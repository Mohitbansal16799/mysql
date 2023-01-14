-- write an SQL query to find the winner in each group
-- the winner in each group is the player who scored the maximum total points within the group, in the case of tie 
-- the lowest player id win 

create database tournament2;
create table tournament2.players
(player_id int,
group_id int);

insert into tournament2.players values (15,1);
insert into tournament2.players values (25,1);
insert into tournament2.players values (30,1);
insert into tournament2.players values (45,1);
insert into tournament2.players values (10,2);
insert into tournament2.players values (35,2);
insert into tournament2.players values (50,2);
insert into tournament2.players values (20,3);
insert into tournament2.players values (40,3);

create table tournament2.matches
(
match_id int,
first_player int,
second_player int,
first_score int,
second_score int);

insert into tournament2.matches values (1,15,45,3,0);
insert into tournament2.matches values (2,30,25,1,2);
insert into tournament2.matches values (3,30,15,2,0);
insert into tournament2.matches values (4,40,20,5,2);
insert into tournament2.matches values (5,35,50,1,1);
select * from tournament2.players;
select * from tournament2.matches;
use tournament2;
with player_scores as(
select first_player as player_id,first_score as score from matches
union all
select second_player as player_id,second_score as score from matches)
,final_scores as (
select ps.player_id,sum(score) as score ,p.group_id from player_scores ps
 inner join tournament2.players as p on p.player_id = ps.player_id 
 group by ps.player_id)
 , final_list as (
 select *,rank() over (partition by group_id order by score desc,player_id asc) as rn from 
 final_scores)
 select * from final_list where rn = 1;
