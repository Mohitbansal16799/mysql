create database systems;
create table systems.entries ( 
name varchar(20),
address varchar(20),
email varchar(20),
floor int,
resources varchar(10));

insert into systems.entries 
values ('A','Bangalore','A@gmail.com',1,'CPU'),
('A','Bangalore','A1@gmail.com',1,'CPU'),
('A','Bangalore','A2@gmail.com',2,'DESKTOP'),
('B','Bangalore','B@gmail.com',2,'DESKTOP'),
('B','Bangalore','B1@gmail.com',2,'DESKTOP'),
('B','Bangalore','B2@gmail.com',1,'MONITOR');
select * from systems.entries;

with floorvisit as(
select name,floor,count(*) as no_of_floor_visit,rank() over(partition by name order by count(*) desc)as rn
 from systems.entries group by name,floor),
 total_visits as 
 (select name,COUNT(1) AS totalvisit,group_concat(distinct resources) as resources_used from systems.entries group by name)
 
 select fv.name,fv.floor,tv.totalvisit,tv.resources_used as most_visited_floor from floorvisit fv inner join total_visits tv on 
 fv.name = tv.name where rn = 1;
 
 
