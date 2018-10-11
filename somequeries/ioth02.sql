select distinct
    s.id, 
    t.tanknum,
    t.startfuelvolume,
    t.endfactvolume,
    t.enddensity,
    t.endtemperature,
    t.endheight,
    t.endmass,
    t.endwater,
    t.deadrest,
    t.deadrestliter,
    t.warecode,
    h.hosenum,
    h.startcounter,
    h.endcounter,
    h.pumpnum,
    h.numinpump,
    h.hosetype
    from
    hoses h
    inner join tanks t on h.tanknum = t.tanknum
    join sessions s on s.id = h.session_id

    where t.session_id = :session_id
            and s.id = t.session_id

    order by t.tanknum

