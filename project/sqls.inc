  const CIOGSQLCOMMON = 'select ' +
'   i.id,   ' +
'   s.id as session_id, ' +
'   s.azscode, ' +
'   a.extcode as azsextcode, ' +
'   st.name as stname, ' +
'   s.sessionnum, ' +
'   iif( i.direction = 0,'+#$27'Расход'#$27+',' + #$27'Приход'#$27 +') as dir, ' +
'   cast(s.startdatetime as date) as sdate, ' +
'   c.name as clientname, ' +
'   c.code as clientcode, ' +
'   cn.nomer as cn, ' +
'   cn.nomer || ' + #$27' '#$27  + ' || cn.name as contract, ' +
'   p.name as paymentmode, ' +
'   p.code as paymentcode, ' +
'   w.name as fuelname, ' +
'   w.code as fuelcode, ' +
'   i.ei, ' +
'   i.volume, ' +
'   i.price, ' +

'   i.density,   ' +
'   round(volume * density / 1000,3) as mass, ' +
'   i.nds, ' +
'   round(amount * cast(nds as double precision) / ' +
'       (100+cast(nds as double precision)), 2) as sumnds, ' +
'   amount as whole, ' +
'   round(amount - amount * ' +
'      cast(nds as double precision) / ' +
'     (100+cast(nds as double precision)), 2) as amount0 ' +
'   , i.sent as sent ' +
'   from inoutgsm i ' +
'   join sessions s on s.id = i.session_id ' +
'   join wares w on w.code=i.ware_code ' +
'   join contragents c on c.code=i.client_code ' +
'   join (select max(id) as id, max(nomer) as nomer, max(name) as name, partner_code from contracts group by partner_code) cn on cn.partner_code=c.code ' +
'   join paymentmodes p on p.code=i.payment_code ' +
'   join stations a on a.code=s.azscode ' +
'   left join storages st on st.azscode=s.azscode ';

const CIOGSQL = CIOGSQLCOMMON +
 '     where /*s.startdatetime >= cast(:start_session_t as TIMESTAMP)*/ ' +
 '     s.id = :session_id ' +
 '     and i.azscode=:azscode ' +

 '  order by s.startdatetime, i.direction,paymentmode,clientname';

const CIOGSQLPMODES = CIOGSQLCOMMON +
 '     where /*s.startdatetime >= cast(:start_session_t as TIMESTAMP)*/ ' +
 '     s.id = :session_id ' +
 '     and i.azscode=:azscode ' +
 '     and i.payment_code in (!pmodelist) ' +
 '  order by s.startdatetime, i.direction,paymentmode,clientname';

const CIOGSQLH = CIOGSQLCOMMON
    + ' where i.sent < 1 and (s.state = ' + SS_CLOSED + ' or s.state = ' + SS_PARTLY + ') '
    + 'order by i.session_id, i.id';

const CIOGSQLSum1 = 'select sum(volume) as volume,sum(amount0) as amount0, ' +
    'sum(sumnds) as sumnds, sum(whole) as whole, sum(mass) as mass, ' +
    '0 as clientname, ' +
    '0 as paymentmode, ' +
    '0 as fuelname ' +
    ' from ( ';

const CIOGSQLSum = CIOGSQLSum1  +
       CIOGSQL +
       ')';

const CIOGSQLSumPMODES = CIOGSQLSum1  +
       CIOGSQLPMODES +
       ')';

// .............................................................................

const COITEMSSQLCOMMON =
'select ' +
'   i.id,   ' +
'    iif( i.direction = 0,'+#$27'Расход'#$27+','+#$27'Приход'#$27+') as dir, ' +
'    cast(s.startdatetime as date) as sdate, ' +
'    c.name as clientname, ' +
'    cn.nomer || '+#$27' '#$27+' || cn.name as contract, ' +
'    p.name as paymentmode, ' +
'    w.name as itemname, ' +
'    w.code as itemcode, ' +
'    i.amount, ' +
'    i.ei, ' +
'    i.quantity, ' +
'    i.price, ' +
'    i.nds, ' +
'    round(quantity * price * ' +
'        cast(nds as double precision) / (100+cast(nds as double precision) ), 2) as sumnds, ' +
'    round(quantity * price,2) as whole, ' +
'    round(quantity * price ' +
'          - quantity * price ' +
'          * cast(nds as double precision) / (100+cast(nds as double precision) ), 2) as summ ' +
' ' +
'   from inoutitems i ' +
'   join sessions s on s.id = i.session_id ' +
'   join items w on w.code=i.item_code ' +
'   join contragents c on c.code=i.client_code ' +
'   join contracts cn on cn.partner_code=c.code ' +
'   join paymentmodes p on p.code=i.payment_code ';

const COITEMSSQL = COITEMSSQLCOMMON +
'      where /*s.startdatetime >= cast(:start_session_t as TIMESTAMP)*/ ' +
'      s.id = :session_id ' +
'      and i.azscode=:azscode ' +
'      and i.direction=0 ' +

'   order by s.startdatetime, i.direction,paymentmode,clientname ';

const COITEMSSQLSum1 =
'select sum (amount) as amount, sum(summ) as summ, ' +
'       sum(sumnds) as sumnds, sum(whole) as whole, ' +
    '0 as clientname, ' +
    '0 as contract ' +
 ' from ' +
'(';

const COITEMSSQLSum = COITEMSSQLSum1 + COITEMSSQL + ')';

const COITEMSSQLPMODES = COITEMSSQLCOMMON +
'      where /*s.startdatetime >= cast(:start_session_t as TIMESTAMP)*/ ' +
'      s.id = :session_id ' +
'      and i.azscode=:azscode and i.direction=0' +
'      and i.payment_code in (!pmodelist) ';


const COITEMSSQLSumPMODES = COITEMSSQLSum1 + COITEMSSQLPMODES + ')';

// .............................................................................

// .............................................................................

const COITEMSSQLCOMMONI =
'select ' +
'   i.id,   ' +
'    iif( i.direction = 0,'+#$27'Расход'#$27+','+#$27'Приход'#$27+') as dir, ' +
'    cast(s.startdatetime as date) as sdate, ' +
'    c.name as clientname, ' +
'    cn.nomer || '+#$27' '#$27+' || cn.name as contract, ' +
'    p.name as paymentmode, ' +
'    w.name as itemname, ' +
'    w.code as itemcode, ' +
'    i.amount, ' +
'    i.ei, ' +
'    i.quantity, ' +
'    i.price, ' +
'    i.nds, ' +
'    round(quantity * price * ' +
'        cast(nds as double precision) / (100+cast(nds as double precision) ), 2) as sumnds, ' +
'    round(quantity * price,2) as whole, ' +
'    round(quantity * price ' +
'          - quantity * price ' +
'          * cast(nds as double precision) / (100+cast(nds as double precision) ), 2) as summ ' +
' ' +
'   from inoutitems i ' +
'   join sessions s on s.id = i.session_id ' +
'   join items w on w.code=i.item_code ' +
'   join contragents c on c.code=i.client_code ' +
'   join contracts cn on cn.partner_code=c.code ' +
'   join paymentmodes p on p.code=i.payment_code ';


const COITEMSSQLI = COITEMSSQLCOMMONI +
'      where /*s.startdatetime >= cast(:start_session_t as TIMESTAMP)*/ ' +
'      s.id = :session_id ' +
'      and i.azscode=:azscode ' +
'      and i.direction=1 ' +

'   order by s.startdatetime, i.direction,paymentmode,clientname ';

const COITEMSSQLPMODESI = COITEMSSQLCOMMONI +
'      where /*s.startdatetime >= cast(:start_session_t as TIMESTAMP)*/ ' +
'      s.id = :session_id ' +
'      and i.azscode=:azscode  and i.direction=1 ' +
'      and i.payment_code in (!pmodelist) ';

const COITEMSSQLSumPMODESI = COITEMSSQLSum1 + COITEMSSQLPMODESI + ')';

const COITEMSSQLSumI = COITEMSSQLSum1 + COITEMSSQLI + ')';


