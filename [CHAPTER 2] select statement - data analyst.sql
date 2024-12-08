-- FARMER PRODUCT
SELECT 
	product_id,
    product_name
FROM
	farmers_market.product
ORDER BY product_name
LIMIT 5;


-- FARMER VENDOR BOOTH ASSIGNMENTS
SELECT
	market_date,
    vendor_id,
    booth_number
FROM
	farmers_market.vendor_booth_assignments
ORDER BY market_date, vendor_id
LIMIT 5;




-- FARMER CUSTOMER PURCHASES
SELECT 
	market_date,
    customer_id,
    vendor_id,
    quantity,
    cost_to_customer_per_qty,
    ROUND (quantity * cost_to_customer_per_qty, 2) AS price
FROM 
	farmers_market.customer_purchases;








-- FARMERS CUSTOMERS
SELECT
	customer_id,
    UPPER(CONCAT(customer_first_name, " ", customer_last_name)) AS customer_name
FROM
	farmers_market.customer
ORDER BY customer_last_name ASC
LIMIT 10;



-- SELECT STATEMENT TEST
SELECT
	*,
    CONCAT(customer_id, " ", customer_first_name) AS customer_details
FROM
	farmers_market.customer
ORDER BY
	customer_first_name, customer_last_name
LIMIT 10;
