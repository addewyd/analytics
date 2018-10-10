select
    sid,
    startdatetime,
    case when dir=0 then 'out' else 'in' end as direction,
    pmec,
    a.fuelextcode,
    w.name as fuelname,
    price,
    density,
    partnerextcode,
    p.name as client,
    c.name as contract,
    sum(volume) as volume,
    sum(amount) as amount
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
    i.density as density,
    'EMPTY' as pmec,
    '' as paymentmodename,
    i.partnerextcode, 
    sum(i.volume) as volume,
    sum(mass) as amount
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
        startdatetime,
        direction,
        fuelextcode,
        fuelname,
        pmec,
        price,
        density,
        partnerextcode,
        client,
        contract
   order by
        startdatetime,
        direction,
        pmec,
        partnerextcode



