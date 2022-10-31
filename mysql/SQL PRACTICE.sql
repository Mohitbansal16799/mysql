-- HOW TO SELECT DATABASE
USE sql_store;

-- THE SELECT CLAUSE
select * 
from sql_store.customers;
select customers.first_name , 
       customers.last_name 
from sql_store.customers;
select customers.first_name, 
       customers.points,
       customers.points + 20 
as "discount points" 
from sql_store.customers;
select customers.state 
from sql_store.customers;

-- DISTINCT
select 
distinct customers.state 
from sql_store.customers;

-- THE WHERE CLAUSE (FILTER DATA)
select customers.first_name 
from sql_store.customers 
where customers.points > 3000;
-- COMPARISON OPERATORS ARE >,<,>=,<=,=,!=,<>
select customers.first_name 
from sql_store.customers 
where customers.state = "VA";
select customers.first_name 
from sql_store.customers 
where customers.state != "VA";
select customers.first_name 
from sql_store.customers 
where customers.birth_date > "1990-01-01";

-- THE AND,OR AND NOT OPERATORS
select customers.first_name 
from sql_store.customers 
where customers.birth_date > "1990-01-01" 
and customers.points > 1000;
select customers.first_name 
from sql_store.customers 
where customers.birth_date > "1990-01-01" 
or customers.points > 1000;
select customers.first_name 
from sql_store.customers 
where not (customers.birth_date > "1990-01-01" 
and customers.points > 1000);

-- THE IN OPERATOR
select * from sql_store.customers 
where customers.state 
in ("VA","FL","GA"); 
select * from sql_store.customers 
where customers.state 
not in ("VA","FL","GA");

-- THE BETWEEN OPERATOR
select * from sql_store.customers 
where customers.points 
between 1000 and 3000;
select * from sql_store.customers 
where customers.points 
not between 1000 and 3000;

-- THE LIKE OPERATOR
select * from sql_store.customers 
where customers.last_name like "b%"; -- (%) ANY NO. OF CHARACTERS
select * from sql_store.customers 
where customers.last_name like "%b%";
select * from sql_store.customers 
where customers.last_name like "boa__y"; -- (_) ONLY SINGLE CHARACTER
select * from sql_store.customers 
where customers.last_name like "b____y";

-- THE IS NULL OPERATOR
select * from sql_store.customers 
where customers.phone is null;
select * from sql_store.customers 
where customers.phone is not null;

-- THE ORDER BY CLAUSE 
select * from sql_store.customers 
order by customers.first_name ; 
select * from sql_store.customers 
order by customers.first_name desc;

-- THE LIMIT CLAUSE
select * from sql_store.customers 
limit 3; -- SHOW ONLY FIRST 3 CUSTOMERS
select * from sql_store.customers 
limit 6,3; -- IN THIS QUERY 6 DENOTES SKIP THE 6 LINES AND THEN 3 DENOTES SHOW THE DATA OF NEXT 3 COUSTOMERS

-- INNER JOINT
select orders.order_id,customers.first_name,customers.last_name 
from sql_store.orders 
inner join sql_store.customers 
on orders.customer_id = customers.customer_id;

-- JOINING ACCROSSES DATABASES
select oi.order_id,ip.name,oi.quantity 
from sql_store.order_items oi 
join sql_inventory.products ip 
on oi.product_id = ip.product_id;

-- SELF JOINS
use sql_hr;
select * from sql_hr.employees e 
join sql_hr.employees m 
on e.reports_to = m.employee_id;

-- JOINING MULTIPLE TABLE
use sql_store;
select o.order_id, c.first_name, os.name 
from sql_store.customers c 
join sql_store.orders o 
on c.customer_id = o.customer_id 
join sql_store.order_statuses os 
on o.status = os.order_status_id;

-- COMPOUND JOIN CONDITIONS
select * from sql_store.order_items oi 
join sql_store.order_item_notes oin 
on oi.order_id = oin.order_Id 
and oi.product_id = oin.product_id;

-- OUTER JOIN
-- LEFT JOIN
select c.customer_id,c.first_name,o.order_id 
from sql_store.customers c 
left join sql_store.orders o 
on c.customer_id = o.customer_id 
order by c.customer_id;

-- OUTER JOINS BETWEEN MULTIPLE TABLES
 select c.customer_id,c.first_name,o.order_id,sh.name 
 as shipper from sql_store.customers c 
 left join sql_store.orders o 
 on c.customer_id = o.customer_id 
 join sql_store.shippers sh 
 on o.shipper_id = sh.shipper_id  
 order by c.customer_id;
 
 -- SELF OUTER JOIN
 use sql_hr;
 select e.employee_id,e.first_name,m.first_name 
 from sql_hr.employees e 
 left join sql_hr.employees m 
 on e.reports_to = m.employee_id;
 
 -- NATURAL JOIN
 select o.order_id , c.first_name 
 from sql_store.orders o 
 natural join sql_store.customers c;
 
 -- CROSS JOIN
 select * from sql_store.customers 
 cross join sql_store.products 
 order by customers.first_name;
 
 -- UNIONS
 select o.customer_id,o.order_date,"Active" as status from sql_store.orders o 
 where o.order_date >= "2019-01-01"
 union
 select o.customer_id,o.order_date,"Archived" as status from sql_store.orders o 
 where o.order_date < "2019-01-01";
 
 -- INSERTING SINGLE ROW
 insert into sql_store.customers 
 values(default,"mohit","bansal","1999-07-17",7056612797,"Hisar","hisar","hr",default);
 
 -- INSERTING MULTIPLE ROWS
 insert into sql_store.shippers 
 values(default,"shipper1"),(default,"shipper2"),(default,"shipper3");
 
 -- CREATE A COPY OF TABLE
 create table sql_store.order_archived 
 as select * from sql_store.orders;

-- UPDATE SINGLE ROW
update sql_invoicing.invoices 
set invoices.payment_total = 10 where invoices.invoice_id = 1;
update sql_store.customers 
set customers.first_name = "gogi" where customers.first_name = "ambur";

-- UPDATE MULTIPLE ROW
update sql_store.customers 
set customers.first_name = "gogi" 
where customers.first_name in( "ambur","elka","romola");

-- DELETING ROWS
delete from sql_invoicing.invoices 
where invoices.invoice_id = 1;

 