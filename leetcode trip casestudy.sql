/* trips and users
write a SQL query to find the cancelation rate of requests for unbanned users (both client and driver are not banned)
each day between "2013-10-01" and "2013-10-03". round cancelation rate is two decimal points.The cancellation rate is 
computed by dividing the no. of canceled (by client or driver) request with unbanned usersby the total no. of requests 
with unbanned user on that day.
*/
create database leetcode;
use leetcode;
Create table  leetcode.Trips (id int, client_id int, driver_id int, city_id int, status varchar(50), request_at varchar(50));
Create table leetcode.Users (users_id int, banned varchar(50), role varchar(50));
Truncate table leetcode.Trips;
insert into leetcode.Trips (id, client_id, driver_id, city_id, status, request_at) values ('1', '1', '10', '1', 'completed', '2013-10-01');
insert into leetcode.Trips (id, client_id, driver_id, city_id, status, request_at) values ('2', '2', '11', '1', 'cancelled_by_driver', '2013-10-01');
insert into leetcode.Trips (id, client_id, driver_id, city_id, status, request_at) values ('3', '3', '12', '6', 'completed', '2013-10-01');
insert into leetcode.Trips (id, client_id, driver_id, city_id, status, request_at) values ('4', '4', '13', '6', 'cancelled_by_client', '2013-10-01');
insert into leetcode.Trips (id, client_id, driver_id, city_id, status, request_at) values ('5', '1', '10', '1', 'completed', '2013-10-02');
insert into leetcode.Trips (id, client_id, driver_id, city_id, status, request_at) values ('6', '2', '11', '6', 'completed', '2013-10-02');
insert into leetcode.Trips (id, client_id, driver_id, city_id, status, request_at) values ('7', '3', '12', '6', 'completed', '2013-10-02');
insert into leetcode.Trips (id, client_id, driver_id, city_id, status, request_at) values ('8', '2', '12', '12', 'completed', '2013-10-03');
insert into leetcode.Trips (id, client_id, driver_id, city_id, status, request_at) values ('9', '3', '10', '12', 'completed', '2013-10-03');
insert into leetcode.Trips (id, client_id, driver_id, city_id, status, request_at) values ('10', '4', '13', '12', 'cancelled_by_driver', '2013-10-03');
Truncate table leetcode.Users;
insert into leetcode.Users (users_id, banned, role) values ('1', 'No', 'client');
insert into leetcode.Users (users_id, banned, role) values ('2', 'Yes', 'client');
insert into leetcode.Users (users_id, banned, role) values ('3', 'No', 'client');
insert into leetcode.Users (users_id, banned, role) values ('4', 'No', 'client');
insert into leetcode.Users (users_id, banned, role) values ('10', 'No', 'driver');
insert into leetcode.Users (users_id, banned, role) values ('11', 'No', 'driver');
insert into leetcode.Users (users_id, banned, role) values ('12', 'No', 'driver');
insert into leetcode.Users (users_id, banned, role) values ('13', 'No', 'driver');

select request_at,count(case when status in ("cancelled_by_client","cancelled_by_driver") then 1 else null 
end) as canceledtrip,count(1) AS totaltrips,
request_at,1.0*count(case when status in ("cancelled_by_client","cancelled_by_driver") then 1 else null 
end)/count(1) * 100 as cancel_percentage 
from leetcode.trips t 
inner join leetcode.users u on t.client_id = u.users_id
inner join leetcode.users y on t.driver_id = y.users_id
where u.banned = "No" and y.banned = "No"
group by request_at;

