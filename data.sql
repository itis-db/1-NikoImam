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
	select 1 from "area"
	where "area".areaid = tmp.areaid
);

--Заполнение сущностей по иерархии
insert into activity (activityid, activitytypeid, code, "name", parentid)
select *
from(
	values (1, 1, '1', 'Program 1', null),
	(2, 1, '2', 'Program 2', null),
	(3, 2, '1.1', 'Subprogram 1', 1),
	(4, 2, '1.2', 'Subprogram 2', 1),
	(5, 2, '2.1', 'Subprogram 3', 2),
	(6, 3, '1.1.1', 'Project 1', 3),
	(7, 3, '1.2.1', 'Project 2', 4),
	(8, 3, '2.1.1', 'Project 3', 5),
	(9, 4, '1.1.1.1', 'Contract 1', 6),
	(10, 4, '1.1.1.2', 'Contract 2', 6),
	(11, 4, '1.2.1.1', 'Contract 3', 7),
	(12, 4, '2.1.1.1', 'Contract 4', 8),
	(13, 5, 'Px1.1.1', 'Point 1', 6),
	(14, 5, 'Px1.2.1', 'Point 2', 7),
	(15, 5, 'Px2.1.1', 'Point 3', 8),
	(16, 5, 'Px1.1.1.1', 'Point 4', 9),
	(17, 5, 'Px1.1.1.2', 'Point 5', 10),
	(18, 5, 'Px1.2.1.1', 'Point 6', 11),
	(19, 5, 'Px2.1.1.1', 'Point 7', 12)
) as inp(activityid, activitytypeid, code, "name", parentid)
where not exists(
	select 1 from activity
	where activity.activityid = inp.activityid
);

insert into "program" (programid)
select *
from(
	values (1), (2
)) as tmp(programid)
where not exists(
	select 1 from "program"
	where "program".programid = tmp.programid
);

insert into subprogram (subprogramid)
select *
from(
	values (3), (4
), (5)) as tmp(subprogramid)
where not exists(
	select 1 from subprogram 
	where subprogram.subprogramid = tmp.subprogramid
);

insert into project (projectid)
select *
from(
	values (6), (7), (8)
) as tmp(projectid)
where not exists(
	select 1 from project
	where project.projectid = tmp.projectid
);

insert into contract (contractid, areaid)
select *
from(
	values (9, 1), (10, 1), (11, 5), (12, 2)
) as tmp(contractid)
where not exists(
	select 1 from contract
	where contract.contractid = tmp.contractid
);

insert into point (pointid, plandate)
select *
from(
	values (13, to_date('2023-10-20', 'YYYY-MM-DD')),
	(14, to_date('2024-3-7', 'YYYY-MM-DD')),
	(15, to_date('2024-2-23', 'YYYY-MM-DD')),
	(16, to_date('2023-11-5', 'YYYY-MM-DD')),
	(17, to_date('2025-6-13', 'YYYY-MM-DD')),
	(18, to_date('2023-12-8', 'YYYY-MM-DD')),
	(19, to_date('2026-3-1', 'YYYY-MM-DD'))
) as tmp(pointid, plandate)
where not exists(
	select 1 from point
	where point.pointid = tmp.pointid
);
