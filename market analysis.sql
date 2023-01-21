/* MARKET ANALYSIS : write an sql query to find for each seller , whether the brand of the second item (by date) 
they sold is their favorite brand
if a seller less than 2 items,report the answer for that seller as no. o/p
seller_id 2nd_item_fav_brand
1         yes/no 
2         yes/no
*/

create database market_analysis;
use market_analysis;
create table market_analysis.users (
user_id         int     ,
 join_date       date    ,
 favorite_brand  varchar(50));

 create table market_analysis.orders (
 order_id       int     ,
 order_date     date    ,
 item_id        int     ,
 buyer_id       int     ,
 seller_id      int 
 );

create table market_analysis.items
 (
 item_id        int     ,
 item_brand     varchar(50)
 );


 insert into market_analysis.users values (1,'2019-01-01','Lenovo'),(2,'2019-02-09','Samsung'),(3,'2019-01-19','LG'),(4,'2019-05-21','HP');

 insert into market_analysis.items values (1,'Samsung'),(2,'Lenovo'),(3,'LG'),(4,'HP');

 insert into market_analysis.orders values (1,'2019-08-01',4,1,2),(2,'2019-08-02',2,1,3),(3,'2019-08-03',3,2,3),(4,'2019-08-04',1,4,2)
 ,(5,'2019-08-04',1,3,4),(6,'2019-08-05',2,2,4);
 
with rnk_orders as
( select *, rank() over (partition by orders.seller_id order by orders.order_date asc) as rn from market_analysis.orders)
select ro.*,item_brand,favorite_brand,
case when item_brand=favorite_brand then "yes" else "no" end as favourite_item from rnk_orders ro inner join market_analysis.items i on ro.item_id = i.item_id
inner join market_analysis.users on users.user_id = ro.seller_id  where rn = 2;
   
 