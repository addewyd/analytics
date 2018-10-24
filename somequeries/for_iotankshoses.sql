select distinct
    s.id, 
    s.azscode,
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
    h.hosetype,
    sum(o.volume) as volume,
     1 as lastuser_id,
    current_timestamp as updated_at,
    0 as state

    from
    hoses h
    inner join tanks t on h.tanknum = t.tanknum
    join sessions s on s.id = h.session_id
    join outcomesbyretail o on (o.session_id=s.id and o.tanknum=t.tanknum and h.hosenum=cast(o.hosename as integer))

    where t.session_id = :session_id
            and s.id = t.session_id
    group by
    s.id, 
    s.azscode,
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
    h.hosetype,
    lastuser_id,
    updated_at,
    state

    order by t.tanknum

