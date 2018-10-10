select
    sid,
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
    startdatetime,
    0 as dir,
    r.fuelextcode,
    r.fuelname,
    r.tanknum,
    origprice as price,
    '18' as nds,
    t.enddensity as density,
    r.paymentmodeextcode as pmec,
    r.paymentmodename,
    r.partnerextcode, 
    sum(r.volume) as volume,
    sum(r.amount) as amount
    from sessions s
    join outcomesbyretail r on s.id = r.session_id
    join tanks t on t.session_id = s.id
   where
    azscode = '001'
    and  startdatetime >= timestamp'2018-08-01 00:00:00'
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
union all
select
    s.id as sid,
    azscode,
    sessionnum,
    startdatetime,
    0 as dir,
    r.fuelextcode,
    r.fuelname,
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
    join outcomesbyretail r on s.id = r.session_id
    join tanks t on t.session_id = s.id
   where
    azscode = '001'
    and  startdatetime >= timestamp'2018-08-01 00:00:00'
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
union all
select
    s.id as sid,
    azscode,
    sessionnum,
    startdatetime,
    1 as dir,
    i.fuelextcode,
    i.fuelname,
    i.tanknum, 
    i.price as price,
    '18' as nds,
    i.density as density,
    'EMPTY' as pmec,
    '' as paymentmodename,
    i.partnerextcode, 
    sum(i.volume) as volume,
    sum(volume * price) as amount
    from sessions s
    join incomesbydischarge i on s.id = i.session_id
    join tanks t on t.session_id = s.id
   where
    azscode = '001'
    and  startdatetime >= timestamp'2018-08-01 00:00:00'
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
    group by
        sid,
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
        direction,
        pmec,
        partnerextcode

