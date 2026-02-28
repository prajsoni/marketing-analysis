-- Marketing Campaign Performance Analyzer
-- Database: PostgreSQL
-- Concepts: Window Functions (RANK, LAG, SUM OVER)

-- Drop table if exists
DROP TABLE IF EXISTS campaigns;

-- Create Campaigns Table--
Create Table Campaigns(
	campaign_id VARCHAR(10) Primary Key,
	campaign_name VARCHAR(100),
	channel VARCHAR(50),
	start_date DATE,
	end_date DATE,
	budget DECIMAL(10,2),
	revenue DECIMAL(10,2),
	clicks INT,
	conversions INT,
	impressions INT);

-- Insert sample data--
INSERT INTO campaigns VALUES ('C001','Summer Sale','Email','2024-01-01','2024-01-31',5000,18000,2400,320,50000);
INSERT INTO campaigns VALUES ('C002','New Year Blast','Social Media','2024-01-01','2024-01-15',3000,9500,1800,210,35000);
INSERT INTO campaigns VALUES ('C003','Winter Clearance','Paid Ads','2024-01-15','2024-02-15',8000,22000,3200,480,75000);
INSERT INTO campaigns VALUES ('C004','Valentine Special','Email','2024-02-01','2024-02-14',4000,15000,2100,290,42000);
INSERT INTO campaigns VALUES ('C005','Spring Launch','Social Media','2024-03-01','2024-03-31',6000,19500,2800,350,60000);
INSERT INTO campaigns VALUES ('C006','Easter Promo','Paid Ads','2024-03-15','2024-04-15',7000,21000,3000,420,70000);
INSERT INTO campaigns VALUES ('C007','Summer Kickoff','Email','2024-04-01','2024-04-30',4500,14000,1900,260,38000);
INSERT INTO campaigns VALUES ('C008','May Madness','Social Media','2024-05-01','2024-05-31',5500,17000,2500,310,55000);
INSERT INTO campaigns VALUES ('C009','Mid Year Sale','Paid Ads','2024-06-01','2024-06-30',9000,28000,3800,520,85000);
INSERT INTO campaigns VALUES ('C010','Back to School','Email','2024-07-01','2024-07-31',5000,16000,2200,280,45000);
INSERT INTO campaigns VALUES ('C011','Monsoon Deals','Social Media','2024-07-15','2024-08-15',4000,12000,1600,190,30000);
INSERT INTO campaigns VALUES ('C012','Independence Day','Paid Ads','2024-08-01','2024-08-15',6000,20000,2900,400,65000);
INSERT INTO campaigns VALUES ('C013','Festival Season','Email','2024-09-01','2024-09-30',7000,25000,3100,450,72000);
INSERT INTO campaigns VALUES ('C014','Diwali Special','Social Media','2024-10-01','2024-10-31',8000,30000,4000,580,90000);
INSERT INTO campaigns VALUES ('C015','Year End Mega','Paid Ads','2024-11-01','2024-12-31',10000,35000,4500,650,100000);

-- Preview Data
Select * from campaigns;

-- Q1: Which campaign generated the most revenue?
-- Using RANK() to rank all campaigns by revenue

SELECT campaign_name, revenue,
RANK() OVER (ORDER BY revenue DESC) AS revenue_rank
FROM campaigns;

-- Q2: Which is the top performing campaign within each channel?
-- Using RANK() with PARTITION BY to rank within each channel separately

SELECT campaign_name, channel, revenue,
RANK() OVER (partition by channel ORDER BY revenue DESC) AS revenue_rank
FROM campaigns;

-- Q3: Which campaign has the best conversion rate?
-- Conversion rate = (conversions / clicks) * 100
-- Using ::decimal to avoid integer division

Select campaign_name, Round((conversions::decimal/ clicks)* 100, 2) As conversion_rate,
Rank() OVER (order by Round((conversions::decimal/ clicks)* 100, 2) Desc) As conversion_rank
From campaigns;

-- Q4: Month over month revenue growth per channel
-- Using LAG() to compare each campaign's revenue with the previous one in the same channel
-- Negative values indicate a drop in revenue

SELECT campaign_name, channel, start_date, revenue,
LAG(revenue) OVER (PARTITION BY channel ORDER BY start_date) AS previous_revenue,
Revenue - LAG(revenue) OVER (PARTITION BY channel ORDER BY start_date) AS revenue_growth
FROM campaigns;

-- Q5: Running total of revenue over time
-- Using SUM OVER to show cumulative revenue as campaigns progressed through 2024

SELECT campaign_name, start_date, revenue,
SUM(revenue) OVER (ORDER BY start_date) AS running_total
FROM campaigns;


