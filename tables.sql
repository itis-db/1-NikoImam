create table if not exists activitytype (
	activitytypeid int primary key unique,
	"name" text not null,
	sysname text not null
);

create table if not exists activity (
	activityid int primary key unique,
	activitytypeid int not null,
	code text not null,
	"name" text not null,
	parentid int,
	foreign key (activitytypeid) references activitytype(activitytypeid) on delete cascade,
	foreign key (parentid) references activity(activityid) on delete cascade
);

create table if not exists "program" (
	programid int primary key unique,
	indexnum int null,
	yearstart int null,
	yearfinish int null,
	foreign key (programid) references activity(activityid) on delete cascade
);

create table if not exists subprogram (
	subprogramid int primary key unique,
	indexnum int null,
	foreign key (subprogramid) references activity(activityid) on delete cascade
);

create table if not exists project (
	projectid int primary key unique,
	targetdescr text,
	foreign key (projectid) references activity(activityid) on delete cascade
);

create table if not exists"area" (
	areaid int primary key unique,
	"name" text not null
);

create table if not exists contract (
	contractid int primary key unique,
	areaid int,
	foreign key (contractid) references activity(activityid) on delete cascade,
	foreign key (areaid) references "area"(areaid) on delete set null
);

create table if not exists point (
	pointid int primary key unique,
	plandate date not null,
	factdate date,
	foreign key (pointid) references activity(activityid) on delete cascade
);