with recursive activity_hierarchy (activityid, parentid, "path", i, activitytypeid) as
(
	select t1.activityid,
		t1.parentid,
		cast (t1.name as text),
		1 as i,
		t1.activitytypeid
	from activity as t1 where activitytypeid = 4
	union all
	select t2.activityid,
		t2.parentid,
		t2.name || '->' || activity_hierarchy."path",
		i + 1 as i,
		t2.activitytypeid 
	from activity t2 join activity_hierarchy on(t2.activityid = activity_hierarchy.parentid)
)
select "path" from activity_hierarchy where i = 4 order by "path";