create database customer_behavior;
 use customer_behavior;
 select * from customer;
 
# 1 Total number of customers
SELECT COUNT(*) AS total_customers FROM customer;

# 2. Find unique cities of customers
SELECT DISTINCT city FROM customer;


#  3. Count customers per city
SELECT city, COUNT(*) AS total_customers FROM customer GROUP BY city;


# 4. Find average age of customers
SELECT AVG(age) AS avg_age FROM customer;



# 5. Find customers with highest spending
SELECT name, spending FROM customer ORDER BY spending DESC LIMIT 5;


#  6 . RFM Analysis (Customer Segmentation)
SELECT customer_id,DATEDIFF(CURDATE(), MAX(purchase_date)) AS recency,COUNT(*) AS frequency, SUM(spending) 
AS monetary FROM customer GROUP BY customer_id;


#7 . Top 10% High-Value Customers
SELECT * FROM customer WHERE spending >= (SELECT PERCENTILE_CONT(0.9) WITHIN GROUP (ORDER BY spending) OVER ());



# 8. Customer Lifetime Value (CLV)
SELECT  customer_id,SUM(spending) AS total_value FROM customer GROUP BY customer_id ORDER BY total_value DESC;


# 9. Monthly Sales Trend
SELECT MONTH(purchase_date) AS month, SUM(spending) AS total_sales FROM customer GROUP BY MONTH(purchase_date) ORDER BY month;


# 10. Running Total (Cumulative Sales)
SELECT purchase_date, SUM(spending) OVER (ORDER BY purchase_date) AS running_total FROM customer;

