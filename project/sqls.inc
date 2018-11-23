  const CIOGSQLCOMMON = 'select ' +
'   i.id,   ' +
'   s.id as session_id, ' +
'   s.azscode, ' +
'   a.extcode as azsextcode, ' +
'   iif( i.direction = 0,'+#$27'Расход'#$27+',' + #$27'Приход'#$27 +') as dir, ' +
'   cast(s.startdatetime as date) as sdate, ' +
'   c.name as clientname, ' +
'   c.code as clientcode, ' +
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

'   from inoutgsm i ' +
'   join sessions s on s.id = i.session_id ' +
'   join wares w on w.code=i.ware_code ' +
'   join contragents c on c.code=i.client_code ' +
'   join contracts cn on cn.partner_code=c.code ' +
'   join paymentmodes p on p.code=i.payment_code ' +
'   join stations a on a.code=s.azscode ';

const CIOGSQL = CIOGSQLCOMMON +
 '     where /*s.startdatetime >= cast(:start_session_t as TIMESTAMP)*/ ' +
 '     s.id = :session_id ' +
 '     and i.azscode=:azscode ' +

 '  order by s.startdatetime, i.direction,paymentmode,clientname';

const CIOGSQLH = CIOGSQLCOMMON
    + ' where s.state = ' + SS_CLOSED
    + 'order by s.startdatetime, i.direction,paymentmode,clientname';

const CIOGSQLSum1 = 'select sum(volume) as volume,sum(amount0) as amount0, ' +
    'sum(sumnds) as sumnds, sum(whole) as whole, sum(mass) as mass ' +
    ' from ( ';

const CIOGSQLSum = CIOGSQLSum1  +
       CIOGSQL +
       ')';
