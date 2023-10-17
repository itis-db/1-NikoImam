
create table if not exists activitytype
(
    activitytypeid integer not null
        constraint pk_activitytype
            primary key,
    name           text    not null,
    sysname        text    not null
);

-- 
