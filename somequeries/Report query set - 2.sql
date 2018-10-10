 select
    sid,
    startdatetime,
    hose,
    scnt,
    ecnt,
    tanknum,
    density,
/*    pmec, */
    sum(volume) as volume,
    sum(amount) as amount
    from
(select
    s.id as sid,
    azscode,
    sessionnum,
    startdatetime,
    'R' as tbl,
    r.fuelextcode,
    r.fuelname,
    cast (r.hosename as integer) as hose,
    h.startcounter as scnt,
    h.endcounter as ecnt,
    r.tanknum, 
    t.enddensity as density,
    (h.endcounter - h.startcounter) as hdiff,
    r.paymentmodeextcode as pmec,
    r.paymentmodename,
    sum(r.volume) as volume,
    sum(r.amount) as amount
    from sessions s
    join outcomesbyretail r on s.id = r.session_id
    join Hoses h on s.id = h.session_id
    join tanks t on t.session_id = s.id
   where
    azscode = '002'
    and  startdatetime >= timestamp'2018-08-01 00:00:00'
    and r.fuelextcode = '00000000001'
    and cast(r.hosename as integer) = h.hosenum
    and r.tanknum = t.tanknum
   group by sid,
    azscode,sessionnum,startdatetime,
    tbl,
    hose, hdiff,
    fuelextcode,fuelname,
    startcounter,endcounter,
    tanknum, density,
    paymentmodeextcode,paymentmodename
union all
select
    s.id as sid,
    azscode,
    sessionnum,
    startdatetime,
    'O' as tbl,
    r.fuelextcode,
    r.fuelname,
    cast (r.hosename as integer) as hose,
    h.startcounter as scnt,
    h.endcounter as ecnt,
    r.tanknum, 
    t.enddensity as density,
    (h.endcounter - h.startcounter) as hdiff,
    r.paymentmodeextcode as pmec,
    r.paymentmodename,
    sum(r.volume) as volume,
    sum(r.amount) as amount
    from sessions s
    join outcomesbyretail r on s.id = r.session_id
    join Hoses h on s.id = h.session_id
    join tanks t on t.session_id = s.id
   where
    azscode = '002'
    and  startdatetime >= timestamp'2018-08-01 00:00:00'
    and r.fuelextcode = '00000000001'
    and cast(r.hosename as integer) = h.hosenum
    and r.tanknum = t.tanknum
   group by sid,
    azscode,sessionnum,startdatetime,
    tbl,
    hose, hdiff,
    fuelextcode,fuelname,
    startcounter,endcounter,
    tanknum, density,
    paymentmodeextcode,paymentmodename
 )
    group by
        sid,
        startdatetime,
        hose,
        scnt,
        ecnt,
        tanknum,
        density /*,
        pmec   */

