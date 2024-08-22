create database if not exists cinema;

-- find the movies with highest profit
select * from cinema.movies;
select * from cinema.movies 
where (gross - budget) =(select max(gross - budget) 
from cinema.movies);
-------------------------------------------------------------------------------
select * from cinema.movies 
order by (gross-budget) desc 
limit 1;

-- find how many movies have a ration > avg of all movie rating (find the count of above average movie)
select count(*) from cinema.movies 
where score >
(select avg(score) from cinema.movies)
order by score asc;

-- find the highest rated movie of 2000
select * from cinema.movies;
select * from cinema.movies 
where year = 2000 
order by score desc 
limit 1 ;
--------------------------------------------------------------------------
select * from cinema.movies 
where score =(
select max(score) from cinema.movies where year=2000) 
and year = 2000;

-- find the highest rated movie among all movies whose number of votes are> the dataset avg votes.
select * from cinema.movies;
select * from cinema.movies where score = 
(select max(score) from cinema.movies 
where votes >
(select avg(votes) from cinema.movies));