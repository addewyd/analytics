select distinct
    s.id, 
    s.azscode,
    s.sessionnum,

    w.name as fuelname,
    t.tanknum,
    t.startfuelvolume,
    (select volume from calcincomes(:session_id,t.tanknum))
        as income,
    (select volume from calcoutcomes(:session_id,t.tanknum,h.hosenum))
        as outcome,
    t.startfuelvolume
        - (select volume from calcoutcomes(:session_id,t.tanknum,h.hosenum))
        + (select volume from calcincomes(:session_id,t.tanknum))
        as calcvolume,
    t.endfactvolume,
    t.endfactvolume -
        (
        t.startfuelvolume
        - (select volume from calcoutcomes(:session_id,t.tanknum,h.hosenum))
        + (select volume from calcincomes(:session_id,t.tanknum))
        )
        as diff,
    h.hosenum as trk,
    h.startcounter,
    h.endcounter,
    (h.endcounter - h.startcounter) as cdiff
    from
    hoses h
    inner join tanks t on h.tanknum = t.tanknum
    join wares w on w.code = t.warecode
    join sessions s on s.id = h.session_id

    where t.session_id = :session_id
            and s.id = t.session_id

    order by t.tanknum

