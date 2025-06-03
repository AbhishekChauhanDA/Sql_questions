-- List all unique regions in the dataset.
select distinct region from ev_sales;

-- Find all distinct years available in the data.
select distinct year from ev_sales 
order by year;

-- Count how many entries exist for each parameter (e.g., EV sales, EV stock).
select parameter, count(*) from ev_sales group by parameter; 

-- Find the total EV sales for the year 2022.
select sum(value) as Total_Ev_Sales from ev_sales where parameter = 'Ev Sales' and year = 2022;

-- Retrieve all records for the region 'India'.
select * from ev_sales where region = 'India';

--  Calculate the average EV stock share across all years for each region.
select region ,round(avg(value),2) as avg_ev_share from ev_sales where parameter ='EV stock share'
group by region;

-- Find total EV stock by year globally.
select year, round(sum(value),2) as Ev_stock from ev_sales where parameter = 'EV stock'
group by year order by year;

-- List regions where EV sales share exceeded 5% in any year.
select distinct region, value from ev_sales where parameter = 'EV sales' and value>5;

-- Count how many entries exist per unit type (e.g., Vehicles, percent).
select unit, count(*) as total_count from ev_sales group by unit;

-- Find the regions where EV stock is higher than the average EV stock across all regions.
select region , round(value,2) higher_than_avg from ev_sales where parameter = 'EV stock' and value >
(select  avg(value) from ev_sales where parameter = 'Ev stock');

-- List the years when India had the highest EV sales among all regions for that year.
SELECT 
  year,
  MAX(value) AS max_ev_sales_global,
  MAX(CASE WHEN TRIM(region) = 'India' THEN value END) AS india_sales
FROM ev_sales
WHERE parameter = 'EV sales' 
GROUP BY year;

