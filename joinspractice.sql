create database flipkart;

-- cross join
select * from flipkart.users1
cross join
flipkart.groups;

-- inner join
select * from flipkart.users1 u
inner join flipkart.membership m
on u.user_id = m.user_id;

-- left join
select * from flipkart.users1 u
left join flipkart.membership m
on u.user_id = m.user_id;

-- right join
select * from flipkart.users1 u
right join flipkart.membership m
on u.user_id = m.user_id;

-- union
select * from flipkart.person1
union
select * from flipkart.person2;

-- union all
select * from flipkart.person1
union all
select * from flipkart.person2;

-- intersect
select * from flipkart.person1
intersect
select * from flipkart.person2;

-- except
select * from flipkart.person2
except
select * from flipkart.person1;

-- outer join
select * from flipkart.users1 u
left join flipkart.membership m
on u.user_id = m.user_id
union
select * from flipkart.users1 u
right join flipkart.membership m
on u.user_id = m.user_id;

-- outer join
select * from flipkart.users1 u
left join flipkart.membership m
on u.user_id = m.user_id
union all
select * from flipkart.users1 u
right join flipkart.membership m
on u.user_id = m.user_id;