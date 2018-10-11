/* session_id is input parameter */
/* TODO: Replace tanks & hoses select  by iotankshoses selects!  */

select
    sid,
    tbl,
    dir as direction,
    partnerextcode,
    c.id as contract_id,
    pmec,
    a.fuelextcode,
    sum(amount) as amount,
    't' as ei,
    sum(volume) as volume,
    density,
    price,
    sum(price * volume) as summ,
    nds as nds,
    sum(price * volume + price * volume * cast(nds as integer) / 100.0) as whole,
    1 as lastuser_id,
    current_timestamp as updated_at,
    0 as state
    from
(select
    s.id as sid,
    azscode,
    sessionnum,
    'R' as tbl,
    startdatetime,
    0 as dir,
    t.warecode as fuelextcode,
    w.name as fuelname,
    r.tanknum,
    origprice as price,
    '18' as nds,
    t.density as density,
    r.paymentmodeextcode as pmec,
    r.paymentmodename,
    r.partnerextcode, 
    sum(r.volume) as volume,
    sum(r.amount) as amount
    from sessions s
    join outcomesbyretail r on s.id = r.session_id
    join iotankshoses t on t.session_id = s.id  /* here must be user editable density table */
    join wares w on t.warecode = w.code
   where
    r.session_id = :session_id
    and r.tanknum = t.tanknum
   group by sid,
    azscode,sessionnum,startdatetime,
    dir,
    fuelextcode,fuelname,
    tanknum,
    price,
    nds,
    density,
    paymentmodeextcode,
    paymentmodename,
    partnerextcode
/*   NO OFFICE!
union all
select
    s.id as sid,
    azscode,
    sessionnum,
    'O' as tbl,
    startdatetime,
    0 as dir,
    t.warecode as fuelextcode,
    w.name as fuelname,
    r.tanknum,
    r.origprice as price,
    '18' as nds,
    t.enddensity as density,
    r.paymentmodeextcode as pmec,
    r.paymentmodename,
    'EMPTY' as partnerextcode,
    sum(r.volume) as volume,
    sum(r.amount) as amount
    from sessions s
    join outcomesbyoffice r on s.id = r.session_id
    join tanks t on t.session_id = s.id
    join wares w on t.warecode = w.code
   where
    r.session_id = :session_id
    and r.tanknum = t.tanknum
   group by sid,
    azscode,sessionnum,startdatetime,
    dir,
    fuelextcode,fuelname,
    tanknum,
    price,
    nds,
    density,
    paymentmodeextcode,
    paymentmodename,
    partnerextcode
*/
union all
select
    s.id as sid,
    azscode,
    sessionnum,
    'I' as tbl,
    startdatetime,
    1 as dir,
    t.warecode as fuelextcode,
    w.name as fuelname,
    i.tanknum,
    i.price as price,
    '18' as nds,
    i.density as density, /* ??? */
    'EMPTY' as pmec,
    '' as paymentmodename,
    i.partnerextcode, 
    sum(i.volume) as volume,
    sum(volume * price) as amount
    from sessions s
    join incomesbydischarge i on s.id = i.session_id
    join iotankshoses t on t.session_id = s.id
    join wares w on t.warecode = w.code
   where
    i.session_id = :session_id
    and i.tanknum = t.tanknum
   group by sid,
    azscode,sessionnum,startdatetime,
    dir,
    fuelextcode,fuelname,
    tanknum,
    price,
    nds,
    density,
    pmec,
    paymentmodename,
    partnerextcode
 ) as a
    join  wares as w
        on a.fuelextcode=w.code
    join contragents p
        on a.partnerextcode = p.code
    left join contracts c
        on a.partnerextcode = c.partner_code
    where sid = :session_id
    group by
        sid,
        tbl,
        direction,
        contract_id,
        fuelextcode,
        pmec,
        price,
        density,
        partnerextcode,
        ei,
        nds,
        lastuser_id,
        updated_at,
        state
   order by
        sid,
        direction,
        pmec,
        partnerextcode

