#select all data
SELECT * FROM smartphone.smartphones;
SELECT * FROM smartphone.smartphones WHERE 1;
#filter column
SELECT model,brand_name,rating FROM smartphone.smartphones;
SELECT * FROM smartphone.smartphones;
SELECT model,processor_brand,battery_capacity FROM smartphone.smartphones;
#renaming columns
SELECT * FROM smartphone.smartphones;
select os AS 'operating system',battery_capacity AS 'Mah' from smartphone.smartphones;
#creating expression
#finding PPI 
Select model,sqrt(resolution_width*resolution_width + resolution_height*resolution_height)/screen_size AS 'PPI' from smartphone.smartphones;
SELECT * FROM smartphone.smartphones;
#constants
SELECT model, 'smartphone' as 'type' from smartphone.smartphones;
#distinct
SELECT * from smartphone.smartphones;
SELECT DISTINCT brand_name as 'brands' from smartphone.smartphones;
SELECT DISTINCT os as 'operating' from smartphone.smartphones;
#distincts combos
SELECT DISTINCT brand_name,processor_brand from smartphone.smartphones;
#filter rows where clause
SELECT * from smartphone.smartphones;
SELECT * FROM smartphone.smartphones WHERE brand_name = 'samsung';
SELECT * FROM smartphone.smartphones WHERE price > 50000;
#between
SELECT * FROM smartphone.smartphones WHERE price between 20000 AND 30000;
SELECT * FROM smartphone.smartphones WHERE price>10000 and price<30000;
SELECT * FROM smartphone.smartphones WHERE rating>80 and price<15000;
SELECT * FROM smartphone.smartphones WHERE brand_name='samsung' AND ram_capacity > 8;
#in or not in
SELECT DISTINCT brand_name from smartphone.smartphones where processor_brand = 'snapdragon' OR processor_brand = 'exynos';
SELECT DISTINCT brand_name from smartphone.smartphones where processor_brand IN ('snapdragon','exynos');
SELECT DISTINCT * from smartphone.smartphones where processor_brand NOT IN ('snapdragon','exynos');
#update
SELECT * FROM smartphone.smartphones where processor_brand = 'dimensity';
UPDATE smartphone.smartphones SET processor_brand = 'mediatek' WHERE processor_brand = 'dimensity';
SELECT * FROM smartphone.smartphones where processor_brand = 'mediatek';
#delete
SELECT * FROM smartphone.smartphones WHERE price > 200000;
DELETE FROM smartphone.smartphones WHERE price > 200000;
SELECT * FROM smartphone.smartphones WHERE price > 200000;
DELETE from smartphone.smartphones where primary_camera_rear>150 and brand_name = 'samsung';
select * from smartphone.smartphones where primary_camera_rear>100 and brand_name = 'samsung';
#max/min
select MAX(price) from smartphone.smartphones;
select MIN(price) from smartphone.smartphones;
#SUM
SELECT SUM(price) from smartphone.smartphones;
#average
select avg(price) from smartphone.smartphones;
#count
select COUNT(brand_name) from smartphone.smartphones where brand_name = 'samsung';
#distinct count
select count(distinct(brand_name)) from smartphone.smartphones;
#abolute
select abs(price - 100000) from smartphone.smartphones;
#round
select * from smartphone.smartphones;
select round(processor_speed) from smartphone.smartphones;
#ceil/floor
select processor_speed,ceil(processor_speed) as temp from smartphone.smartphones;
select processor_speed,floor(processor_speed) as temp from smartphone.smartphones;
-- Find top 5 samsung phones with biggest screen size
SELECT brand_name,screen_size,MODEL FROM smartphone.smartphones WHERE brand_name = "samsung"
ORDER BY screen_size desc LIMIT 5;
select * from smartphone.smartphones;
-- sort all the phone in descending order of the number of total cameras
SELECT model,num_rear_cameras + num_front_cameras as 'total_camera' from smartphone.smartphones
order by total_camera desc;
-- sort data on the ppi decreasing order
select model, round(sqrt(resolution_width*resolution_width + resolution_height*resolution_height)/screen_size) as 'ppi' from
smartphone.smartphones
order by ppi desc;
-- Find the phone having 2nd highest battery backup
select model,battery_capacity from smartphone.smartphones
order by battery_capacity desc
limit 1,1;
-- find the name and rating of the worse rated apple phone.
select model,rating from smartphone.smartphones where brand_name = 'apple'
order by rating asc limit 1;
-- sort phones alphabetically and then on the basis of rating desc
select * from smartphone.smartphones
order by brand_name asc,rating desc; 
-- sort phones alphabetically and then on the basis of price asc
select * from smartphone.smartphones
order by brand_name asc,price asc;
-- group smartphonees by brand and get the count, average price, max ratng,aavg screen size and avg battery capacity
select brand_name,count(*) as total, avg(price), max(rating) as 'maxrating', 
round(avg(screen_size)) as 'avgsize' , 
round(avg(battery_capacity)) as 'avgcapacity' 
from smartphone.smartphones
group by brand_name
order by total desc limit 15; 
-- group smartphones by whether they have an NFC and get the averace price and rating
select has_nfc,count(*) as 'countnfc',
round(avg(rating)) as 'avgrating',
round(avg(price)) as 'avgprice' from 
smartphone.smartphones
group by has_nfc;
-- group smartphones by the extended memory available and get average price
select extended_memory_available,count(*) as 'yes/no',
round(avg(price)) from smartphone.smartphones 
group by extended_memory_available;
-- Group smartphones by brand and processor brandand get the count of models and the average primary camera resolution (rear)
select brand_name,
count(*) as 'countrow',
round(avg(primary_camera_rear)),
processor_brand from smartphone.smartphones
group by brand_name,processor_brand;
-- top 5 most costly top brand
select brand_name,round(avg(price)) as 'costly'
 from smartphone.smartphones
 group by brand_name
 order by costly desc
 limit 5;
 -- group smartphones by the brand and find the brands with highest number of models that has both nfc and ir blaster
 select brand_name, count(*) as 'count' 
 from smartphone.smartphones
 where has_nfc = 'true' and has_ir_blaster = 'true' 
 group by brand_name
 order by count desc
 limit 1;
 select * from smartphone.smartphones;
 -- FInd all 5g enabled smartphones and find out the avg price for nfc and non nfc phones
  select brand_name,
  count(*),
  has_nfc,
  round(avg(price))
  from smartphone.smartphones 
  where has_5g = 'true'  
  group by brand_name,has_nfc 
  order by brand_name asc;
  -- find the avg rating of smartphones which have more than 20 phone
  select brand_name,count(*) as 'count', round(avg(rating)) as 'rating' from smartphone.smartphones
  group by brand_name
  having count> 20
  order by rating desc;
  -- find the top 3 brands with the highest avg ram that have a refresh rate of atleast 90hz and 
  -- fast charging available and dont consider brand which have less the 10 phones.
  select brand_name,avg(ram_capacity),count(*) from smartphone.smartphones where refresh_rate>90 and fast_charging_available = '1' group by brand_name having count(*) > 10 limit 3;
  -- find the avg price of all the phone brands with avg rating >70 and num_phones more than 10 among all 5g enabled
  select * from smartphone.smartphones;
  select brand_name,avg(rating),avg(price) as 'avgrat',count(*) as nomb 
  from smartphone.smartphones 
  where has_5g ='true' 
  group by brand_name 
  having nomb > 10 and avg(rating) >70
  order by avg(rating) desc;
  -- practice question
  select * from smartphone.smartphones;
  select brand_name,count(*) as 'total', round(avg(price)) from smartphone.smartphones group by brand_name order by total desc  ;
  select brand_name,count(has_5g) as 'total' from smartphone.smartphones where has_5g = 'True' group by brand_name order by total desc ;
  