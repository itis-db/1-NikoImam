insert into activitytype (activitytypeid ,name ,sysname)
select *
from (
	values(1,'Программа','Program'),
	(2,'Подпрограмма','SubProgram'),
	(3,'Проект','Project'),
	(4,'Контракт','Contract'),
	(5,'КТ','Point')
) as d(activitytypeid, name, sysname)
where not exists(
	select 1 from activitytype as t
    where t.activitytypeid = d.activitytypeid
);

--Заполнение таблицы Area
insert into "area" (areaid, "name")
select *
from(
	values (1, 'Europe'),
	(2, 'Asia'),
	(3, 'Africa'),
	(4, 'Australia'),
	(5, 'North America'),
	(6, 'South America')
) as tmp(areaid, "name")
where not exists(
	select 1 from "area" as t
	where t.areaid = tmp.areaid
);
