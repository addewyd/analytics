select    i.session_id,    cast(s.startdatetime as date) as stdt,    i.payment_code,    p.name as pmode,
            sum(i.volume) as volume,
            coalesce((select sum(i1.volume)
                from inoutgsm i1 join wares w1 on w1.code=i1.ware_code
                where w1.code= '00000000001'        and i1.direction=0
                and i1.payment_code = i.payment_code and i1.session_id=:session_id), 0
            )
                as volume_0,
            coalesce((select sum(i1.volume) from inoutgsm i1 join wares w1 on w1.code=i1.ware_code
                where w1.code= '00000000030'
                    and i1.direction=0         and i1.payment_code = i.payment_code
                    and i1.session_id=:session_id), 0)
                as volume_1,
                (select sum(i1.volume) from inoutgsm i1 join wares w1 on w1.code=i1.ware_code     where w1.code= '00000000041'        and i1.direction=0         and i1.payment_code = i.payment_code and i1.session_id=:session_id)     as volume_2,(select sum(i1.volume) from inoutgsm i1 join wares w1 on w1.code=i1.ware_code     where w1.code= '00000000042'        and i1.direction=0         and i1.payment_code = i.payment_code and i1.session_id=:session_id)     as volume_3, 0 as nol    from inoutgsm i    join sessions s on s.id=i.session_id    join paymentmodes p on i.payment_code = p.code    where /*s.startdatetime >= cast(:start_session_t as TIMESTAMP)*/   s.id = :session_id    and i.azscode=:azscode   and  i.direction = 0 group by session_id,stdt,payment_code, pmode order by stdt


