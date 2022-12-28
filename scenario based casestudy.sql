/* write a query to find personid,name,number of friend,sum of marks of the person who have friend with total score
greater than 100*/
create database scenario;
use scenario;
select * from scenario.friend;
select * from scenario.person;
with score_detail as (
select f.PersonID,sum(p.score) as tscore,count(1) as no_of_frnd from scenario.friend f inner join scenario.person p on f.FriendID = p.PersonID 
group by f.PersonID having tscore > 100)
select s.*,Name
from score_detail s inner join scenario.person on s.PersonID = person.PersonID;