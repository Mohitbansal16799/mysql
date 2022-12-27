/*the pareto principle states that for many outcomes, roughly 80% of consequences come from 20% of causes. eg:
1- 80% of productivity come from the 20% of the employees
2- 80% of sales come from the 20% of the client
3- 80% of dicision made in 20% of the time
4- 80% of sales come from the 20% of product and services
*/
create database superstore;
-- 80% sales(21099.24)
select sum(sales) * 0.8 from superstore.orders;

with product_wise_sales as(
select product_id,sum(sales) as productsales from superstore.orders group by product_id order by productsales desc)

select product_id, productsales, 
sum(productsales) over(order by productsales desc rows between unbounded preceding and 0 preceding ) as running_total

from product_wise_sales

