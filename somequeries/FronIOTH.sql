select
    w.name as fuelname,
    i.tanknum,
    i.hosenum,
    i.startfuelvolume,
    i.endfactvolume,
    (select volume from calcoutcomes(:session_id, i.tanknum,i.hosenum)) as calc
    from iotankshoses i
    join sessions s on s.id = i.session_id
    join wares w on w.code = i.warecode

    where
        s.id = :session_id
