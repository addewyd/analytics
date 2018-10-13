select
    i.payment_code,
    p.name as pmode,

    sum(i.volume) as volume,
    (select sum(i1.volume) from inoutgsm i1 join wares w1 on w1.code=i1.ware_code
        where w1.code='00000000001'
            and i1.direction=0
            and i1.payment_code = i.payment_code)
        as volume_ai92,
    (select sum(i1.volume) from inoutgsm i1 join wares w1 on w1.code=i1.ware_code
        where w1.code='00000000030'
            and i1.direction=0
            and i1.payment_code = i.payment_code)
        as volume_ai95,
    (select sum(i1.volume) from inoutgsm i1 join wares w1 on w1.code=i1.ware_code
        where w1.code='00000000041'
            and i1.direction=0
            and i1.payment_code = i.payment_code)
        as volume_dt,
    (select sum(i1.volume) from inoutgsm i1 join wares w1 on w1.code=i1.ware_code
        where w1.code='00000000042'
            and i1.direction=0
            and i1.payment_code = i.payment_code)
        as volume_dtf

    from inoutgsm i
    join sessions s on s.id=i.session_id
    join paymentmodes p on i.payment_code = p.code

where i.direction = 0

group by payment_code, pmode
