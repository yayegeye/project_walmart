-- mysql: WALMART PROJECT QUERIES

select * from walmart;

-- Count payment methods and number of transactions by payment method
select 
	payment_method, 
	count(*) as count_payment
from walmart
group by payment_method;

-- Count distinct branches
select count(distinct Branch)
from walmart;

-- max quantity --
select max(quantity) from walmart;



-- BUSINESS PROBLEMS--
select * from walmart;

-- Q1.find different payment method and number of transactions, number of qty sold
select 
	payment_method, 
	count(*) as payment_transactions,
	sum(quantity) as quantity_sold
from walmart
group by payment_method;

-- Q2.identify the highest-rated category in each branch, displaying the branch, category, and average rating
select * 
from
(	select 
		branch, 
		category, 
		round(avg(rating),2) as avg_rating,
		rank()over(partition by branch order by avg(rating) desc) as ranked
	from walmart
	group by branch, category
) as ranked_data
where ranked = 1;

-- Q3. identify the busiest day for each branch based on the number of transactions
SELECT branch, day_name, no_transactions
FROM (
    SELECT 
        branch,
        DAYNAME(STR_TO_DATE(date, '%d/%m/%Y')) AS day_name,
        COUNT(*) AS no_transactions,
        RANK() OVER(PARTITION BY branch ORDER BY COUNT(*) DESC) AS ranked
    FROM walmart
    GROUP BY branch, day_name
) AS ranked_date
WHERE ranked = 1;

-- Q4. calculate the total quantity of items sold per payment method. list payment method and total quantity
select payment_method, sum(quantity) as total_quantity
from walmart
group by payment_method;

-- Q5. determine the average, min and max rating of category for each city, list the city,
-- average_rating, min_rating, and max_rating
select 
	city,
    category,
    round(avg(rating),2) as avg_rating,
    min(rating) as min_rating,
    max(rating) as max_rating
from walmart
group by city, category
order by city;

-- Q6. calculate the total profit for each category by considering total_profit as
-- (unit_price * quantity * profit_margin). List category and total_profit, orderd from highest to lowest profit.
select 
	category, 
	round(sum(unit_price * quantity * profit_margin),2) as total_profit
from walmart
group by category
order by total_profit desc;

-- Q7: Determine the most common payment method for each branch
-- display branch and the preferred_payment_method
select *
from(
	select 
		branch,
		payment_method as preferred_payment_method, 
		count(*) as total_transactions,
        rank()over(PARTITION by branch order by count(*) desc) as ranked
	from walmart
	group by branch, preferred_payment_method) as ranked_data
where ranked = 1;

-- Q8: Categorize sales into Morning, Afternoon, and Evening shifts
-- find out which of the shift and the number of invoices
select
	branch,
    CASE
		WHEN HOUR(TIME(time)) < 12 THEN 'Morning'
        WHEN HOUR(TIME(time)) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
	END AS shift,
    count(*) as sales
from walmart
group by branch, shift
order by branch, sales desc;

-- Q9: Identify the 5 branches with the highest revenue decrease ratio from last year to current year (e.g., 2022 to 2023)
with revenue_2022 as(
	select 
		branch,
		sum(total) as revenue
	from walmart
	where year(str_to_date(date, '%d/%m/%Y')) = 2022
	#where STR_TO_DATE(`date`, '%d/%m/%Y') BETWEEN '2022-01-01' AND '2022-12-31'
	group by branch),

	revenue_2023 as(
	select 
		branch,
		sum(total) as revenue
	from walmart
	where year(str_to_date(date, '%d/%m/%Y')) = 2023
	#where STR_TO_DATE(`date`, '%d/%m/%Y') BETWEEN '2023-01-01' AND '2023-12-31'
	group by branch)

select
	r2022.branch, 
    r2022.revenue as last_year_revenue,
    r2023.revenue as current_year_revenue,
    round((r2022.revenue - r2023.revenue) / r2022.revenue * 100, 2) as revenue_decrease_ratio
from revenue_2022 as r2022
join revenue_2023 as r2023 on r2022.branch = r2023.branch
where r2022.revenue > r2023.revenue
order by revenue_decrease_ratio desc
limit 5;
