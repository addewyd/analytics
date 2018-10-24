select
    sid,
    azscode,
    tbl,
    dir as direction,
    partnerextcode,
    c.id as contract_id,
    pmec,
    a.itemextcode,
    sum(amount) as amount,
    'i' as ei,
    price,
   sum(quantity) as quantity,
    sum(price * quantity) as summ,
    nds as nds,
    sum(price * quantity + price * quantity * cast(nds as integer) / 100.0) as whole,
    1 as lastuser_id,
    current_timestamp as updated_at,
    0 as state
    from

(select
    s.id as sid,
    s.azscode as azscode,
    sessionnum,
    'R' as tbl,
    startdatetime,
    0 as dir,
    r.itemextcode as itemextcode,
    w.name as itemname,
    priceretail as price,
    '18' as nds,
    r.paymentmodeextcode as pmec,
    r.paymentmodename,
    r.partnerextcode, 
    sum(r.quantity) as quantity,
    sum(r.amount) as amount
    from sessions s
    join itemoutcomesbyretail r on s.id = r.session_id
    join items w on r.itemextcode = w.code
   where
    r.session_id = :session_id
   group by sid,
    azscode,sessionnum,startdatetime,
    dir,
    itemextcode,
    itemname,
    price,
    nds,
    paymentmodeextcode,
    paymentmodename,
    partnerextcode
-- tradedocsinbills
union all
select
    s.id as sid,
    s.azscode as azscode,
    sessionnum,
    'I' as tbl,
    startdatetime,
    1 as dir,
    b.itemextcode as itemexttcode,
    w.name as itemname,
    b.price as price,
    b.ndsname as nds,
    'EMPTY' as pmec,
    '' as paymentmodename,
    i.partnerextcode, 
    sum(b.quantity) as quantity,
    sum(quantity * b.price) as amount
    from sessions s
    join tradedocsinbill i on s.id = i.session_id
    join tdb_items b on b.bill_id = i.id
    join items w on b.itemcode = w.code
   where
    i.session_id = :session_id
   group by sid,
    azscode,sessionnum,startdatetime,
    dir,
    itemextcode,
    itemname,
    price,
    ndsname,
    pmec,
    paymentmodename,
    partnerextcode
-- itemoutcomesbypaysheet

union all
select
    s.id as sid,
    s.azscode as azscode,
    sessionnum,
    'O' as tbl,
    startdatetime,
    0 as dir,
    i.itemextcode as itemextcode,
    w.name as itemname,
    price,
    '18' as nds,
    i.paymentmodeextcode as pmec,
    i.paymentmodename,
    i.partnerextcode,
    sum(i.quantity) as quantity,
    sum(quantity * price) as amount
    from sessions s
    join itemoutcomesbypaysheet i on s.id = i.session_id
    join items w on i.itemextcode = w.code
   where
    i.session_id = :session_id
   group by sid,
    azscode,sessionnum,startdatetime,
    dir,
    itemextcode,itemname,
    price,
    nds,
    pmec,
    paymentmodename,
    partnerextcode
) as a
    join  items as w
        on a.itemextcode=w.code
    join contragents p
        on a.partnerextcode = p.code
    left join contracts c
        on a.partnerextcode = c.partner_code
    where sid = :session_id
    group by
        sid,
        azscode,
        tbl,
        direction,
        contract_id,
        itemextcode,
        pmec,
        price,
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

