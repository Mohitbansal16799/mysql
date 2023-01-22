create database compex;
use compex ;
create table compex.tasks (
date_value date,
state varchar(10)
);

insert into compex.tasks  values ('2019-01-01','success'),('2019-01-02','success'),('2019-01-03','success'),('2019-01-04','fail')
,('2019-01-05','fail'),('2019-01-06','success');
select *,row_number() over(partition by state order by date_value) as rn
,date_add(day, -1 * row_number() over(partition by state order by date_value) ,date_value) as groupdate
 from compex.tasks order by date_value;
