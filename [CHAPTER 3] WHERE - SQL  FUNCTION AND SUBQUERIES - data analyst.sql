/* [CHAPTER 3] - WHERE CLAUSE */

-- [product category]
SELECT
	product_id,
    product_name,
    product_category_id
FROM
	farmers_market.product
WHERE
	product_category_id = 1 AND product_id BETWEEN 9 AND 20
LIMIT 10;


-- [customer purchases]
SELECT
	market_date,
    customer_id,
    vendor_id,
    product_id,
    quantity,
    ROUND(quantity * cost_to_customer_per_qty, 2) AS price
FROM
	farmers_market.customer_purchases
WHERE
	customer_id = 4 AND vendor_id = 7
ORDER BY
	market_date, customer_id, vendor_id, product_id
LIMIT 10;


-- [vendor booth assignment]
SELECT
	*
FROM 
	farmers_market.vendor_booth_assignments
WHERE
	vendor_id = 7 AND market_date BETWEEN '2019-04-03' AND '2019-04-16'
LIMIT 10;


-- [IN function]
SELECT
	customer_id,
    customer_first_name,
    customer_last_name
FROM
	farmers_market.customer
WHERE
	customer_last_name IN ('Diaz', 'Edwards', 'Wilson')
ORDER BY
	customer_last_name ASC;
    
    
    
-- [LIKE function]
SELECT
	customer_id,
    customer_first_name,
    customer_last_name
FROM
	farmers_market.customer
WHERE
	customer_first_name LIKE 'jer%';
    
    
-- [IS NULL ]
SELECT
	*
FROM
	farmers_market.product
WHERE product_size IS NULL;


-- [using subqueries]
SELECT
	market_date,
    market_rain_flag
FROM
	farmers_market.market_date_info;
    
    
-- [filetering using subqueries]
SELECT
	market_date,
    customer_id,
    ROUND(quantity * cost_to_customer_per_qty, 2) AS price
FROM
	farmers_market.customer_purchases
WHERE
	market_date IN (
		SELECT market_date
        FROM farmers_market.market_date_info
        WHERE market_rain_flag = 1
        )
LIMIT 10;



/* EXERCISES */

-- 1. Write a query that returns all customer purchases of product IDs 4 and 9
SELECT 
	*
FROM
	farmers_market.customer_purchases
WHERE
	product_id = 4 OR product_id = 9
LIMIT 10;

/* 2. Write two queries, one using two conditions
with an AND operator, and one using the BETWEEN operator, that will return
all customer purchases made from vendors with vendor IDs between 8
and 10 (inclusive). */
-- [using AND]
SELECT 
	*
FROM
	farmers_market.customer_purchases
WHERE
	vendor_id = 8 AND vendor_id <= 10
LIMIT 10;

-- [using BETWEEN]
SELECT 
	*
FROM
	farmers_market.customer_purchases
WHERE
	vendor_id BETWEEN 8 AND 10
LIMIT 10;

/* 3. Can you think of two different ways to change the final query in the
chapter so it would return purchases from days when it wasn’t raining? */
-- [NO 1.]
SELECT
	market_date,
    customer_id,
    ROUND(quantity * cost_to_customer_per_qty, 2) AS price
FROM
	farmers_market.customer_purchases
WHERE
	market_date IN (
		SELECT market_date
        FROM farmers_market.market_date_info
        WHERE market_rain_flag = 0
        )
LIMIT 10;