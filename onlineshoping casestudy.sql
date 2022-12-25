create database onlineshop;
use onlineshop;
create table onlineshop.customer_order(orderid integer(10),customerid integer(10),orderdate date,orderamount varchar (10));
insert into onlineshop.customer_order values(1,100,"2022-01-01",2000);
insert into onlineshop.customer_order values(2,200,"2022-01-01",2500);
insert into onlineshop.customer_order values(3,300,"2022-01-01",2100);
insert into onlineshop.customer_order values(4,100,"2022-01-02",2000);
insert into onlineshop.customer_order values(5,400,"2022-01-02",2200);
insert into onlineshop.customer_order values(6,500,"2022-01-02",2700);
insert into onlineshop.customer_order values(7,100,"2022-01-03",3000);
insert into onlineshop.customer_order values(8,400,"2022-01-03",1000);
insert into onlineshop.customer_order values(9,600,"2022-01-03",3000);
select * from onlineshop.customer_order;


with first_visit as 
(select customerid,min(orderdate) as firstvisit from onlineshop.customer_order group by customerid)
, visit_flag as
(select co.*, fv.firstvisit,
case
when co.orderdate = fv.firstvisit then 1 else 0 
end as firstvisitflag,
case
when co.orderdate != fv.firstvisit then 1 else 0 
end as repeatvisitflag 
from onlineshop.customer_order co inner join first_visit fv on co.customerid = fv.customerid)

select orderdate,sum(firstvisitflag) as no_of_new_coustomer,sum(repeatvisitflag) as no_of_repeated_coustomer from visit_flag group by orderdate;
