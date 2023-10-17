    insert into activitytype(
    	  activitytypeid
        ,name
        ,sysname
    )
    select d.*
    from (
    	values(1,'Программа','Program')
        ,(2,'Подпрограмма','SubProgram')
        ,(3,'Проект','Project')
        ,(4,'Контракт','Contract')
        ,(5,'КТ','Point')
    ) d(activitytypeid, name, sysname)
    where not exists(
    	select 1 from activitytype t
        where t.activitytypeid = d.activitytypeid
    );
