use sql_project;
-- SQL Retail Sales Analysis
 
create database sql_project1;
use sql_project1;

-- CREATE TABLE
-- ------------------------------------------------------------------------------------------
Drop table if exists retail_sales;
create table retail_sales(
	transactions_id int primary key	,
    sale_date date ,
	sale_time time ,
	customer_id int,
	gender varchar(20),
	age int,
	category varchar(20),
	quantiy int,
	price_per_unit float,
	cogs float,
	total_sale float 

		) ;

-- DATA CLEANING
-- ---------------------------------------------------------------------------
select * from retail_sales
limit 10;

select count(*) from retail_sales;
select * from retail_sales;

select * from retail_sales where transactions_id is null;

select * from retail_sales 
where
 transactions_id is null
 or
 sale_date is null
 or
 sale_time is null
 or
 customer_id is null
 or
 gender is null
 or
 age is null
 or
 category is null
 or
 quantiy is null
 or
 price_per_unit is null
 or
 cogs is null
 or
 total_sale is null; 

-- Deleting null values

delete from retail_sales
where
 transactions_id is null
 or
 sale_date is null
 or
 sale_time is null
 or
 customer_id is null
 or
 gender is null
 or
 age is null
 or
 category is null
 or
 quantiy is null
 or
 price_per_unit is null
 or
 cogs is null
 or
 total_sale is null;
 
 -- DATA EXPLORATION
 
 -- How many sales we have?
 select count(*) as total_sale from retail_sales;
 
 -- How many customers we have?
 select count(distinct customer_id) as customers from retail_sales;
 
 -- How many category we have?
 select count(distinct category) as categories from retail_sales;
 select distinct category from retail_sales;
 
 
 -- DATA ANALYSIS & BUSINESS KEY PROBLEMS AND ANSWERS
 
 -- Q1. Write a SQL query to retrieve all columns for sales made on '2022-11-05'
 -- Q2. Write a SQL query to retrieve all transaction where the category is "Clothing" and the quantity sold is 4 in the month of november 2022 
 -- Q3. Write a SQL query to calculate the total sales (total_sale) for each category.
 -- Q4. Write a SQL Query to Find the Average age of customers who purchased items from the "Beauty" category.
 -- Q5. Write a SQL query to find all transactions ehre the total_sale is greater then 1000.
 -- Q6. Write a SQL query to find the total number of transactions (transactions_id) made by each gender in each category
 -- Q7. Write a SQL query to calculate the average sale for each month.Find out best selling month in each  year
 -- Q8. Write a SQL query to find the top 5 customers based on the highest total sales.
 -- Q9. Write a SQL query to find the number of unique customers who purchased ithems from each category.
 -- Q10. Write a SQL query to create each shift and number of orders (Example Morning <=12,Afternoon between  12-17,Evening>17)
 -- Q11. Write a SQL query to find the average total sales of different gender in the category beauty.
 -- Q12. Write a SQL query to find out the best customer (customer_id) from the dataset.

 
 
 
 -- Q1. Write a SQL query to retrieve all columns for sales made on '2022-11-05'
 select * from retail_sales where sale_date like '2022-11-05';
 
-- Q2. Write a SQL query to retrieve all transaction where the category is "Clothing" and the quantity sold is 4 in the month of november 2022 
select *
 from retail_sales 
 where 
 category='Clothing' and quantiy=4 and
 sale_date between '2022-11-01' and '2022-12-01' ;


-- Q3. Write a SQL query to calculate the total sales (total_sale) for each category.
select category,sum(total_sale) from retail_sales group by category;

-- Q4. Write a SQL Query to Find the Average age of customers who purchased items from the "Beauty" category.
select category,avg(age) as AVERAGE_AGE
 from retail_sales
 where category='Beauty';

-- Q5. Write a SQL query to find all transactions where the total_sale is greater then 1000.
select * from retail_sales
where total_sale>1000;

-- Q6. Write a SQL query to find the total number of transactions (transactions_id) made by each gender in each category
select gender,count(transactions_id) from retail_sales
group by gender;

-- Q7. Write a SQL query to calculate the average sale for each month.Find out best selling month in each  year
select monthname(sale_date) as months,avg(total_sale) as AVERAGE_SALES from retail_sales group by months order by AVERAGE_SALES desc LIMIT 1 ;

-- Q8. Write a SQL query to find the top 5 customers based on the highest total sales.
select customer_id,total_sale from retail_sales
order by total_sale limit 5;

-- Q9. Write a SQL query to find the number of unique customers who purchased items from each category.
select count(distinct(customer_id)) as number_of_customers,category 
from retail_sales
 group by category;

 -- Q10. Write a SQL query to create each shift and number of orders (Example Morning <=12,Afternoon between  12-17,Evening>17)
select  
case
when hour(sale_time)<=12 then 'Morning'
when hour(sale_time)between 12 and 17 then 'Afternoon'
when hour(sale_time)>17 then 'Evening'
end as shift,count(transactions_id)

from retail_sales group by shift
;



-- Q11. Write a SQL query to find the average total sales of different gender in the category beauty.
select gender,
avg(total_sale) from retail_sales where category='Beauty' group by gender;

-- Q12. Write a SQL query to find out the best customer (customer_id) from the dataset.
select customer_id ,sum(total_Sale) as total_sale from retail_sales
group by customer_id  order by total_sale desc limit 1 ;  

-- End of Project
