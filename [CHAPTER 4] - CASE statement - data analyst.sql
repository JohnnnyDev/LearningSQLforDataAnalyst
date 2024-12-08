-- [CASE STATEMENT]
SELECT
	vendor_id,
    vendor_name,
    vendor_type,
    CASE
		WHEN vendor_type LIKE '%fresh%'
			THEN 'Fresh Produce'
		ELSE 'Other'
	END AS vendor_type_condensed
FROM farmers_market.vendor;


-- [binary flags]
SELECT
	market_date,
    market_day,
    CASE
		WHEN market_day = 'Saturday' OR market_day = 'Sunday'
			THEN 1
		ELSE 0
	END AS weekend_flag
FROM farmers_market.market_date_info
LIMIT 10;

-- [grouping and binning continuos values using CASE]
SELECT
	market_date,
    customer_id,
    vendor_id,
    ROUND(quantity * cost_to_customer_per_qty, 2) AS price,
    CASE
		WHEN quantity * cost_to_customer_per_qty < 5
			THEN 'Under 5 dollar'
		WHEN quantity * cost_to_customer_per_qty < 10
			THEN 'Under 10 dollar'
		WHEN quantity * cost_to_customer_per_qty < 20
			THEN 'Under 20 dollar'
		WHEN quantity * cost_to_customer_per_qty < 30
			THEN 'Under 30 dollar'
		WHEN quantity * cost_to_customer_per_qty > 30
			THEN '30 dollar and above'
	END AS price_bin,
    CASE
		WHEN quantity * cost_to_customer_per_qty < 5
			THEN 'Category a'
		WHEN quantity * cost_to_customer_per_qty < 10
			THEN 'Category b'
		WHEN quantity * cost_to_customer_per_qty < 20
			THEN 'Category c'
		WHEN quantity * cost_to_customer_per_qty < 30
			THEN 'Category d'
		WHEN quantity * cost_to_customer_per_qty > 30
			THEN 'Category e'
	END AS price_bin_category
FROM farmers_market.customer_purchases;

-- [categorial encoding using CASE clause]
SELECT
	booth_number,
    booth_price_level,
    CASE
		WHEN booth_price_level = 'A' THEN 1
        WHEN booth_price_level = 'b' THEN 2
        WHEN booth_price_level = 'c' THEN 3
	END AS booth_price_level_numberic
FROM farmers_market.booth
LIMIT 5;


/* EXERCISES FOR CHAPTER 4 CASE statement */

/* 1) Products can be sold by the individual unit or by bulk measures like lbs.
or oz. Write a query that outputs the product_id and product_name columns from the product table, and add a column called prod_qty_type_
condensed that displays the word “unit” if the product_qty_type is “unit,”
and otherwise displays the word “bulk.” */
SELECT
	product_id,
    product_name,
    CASE
		WHEN product_qty_type = 'unit' THEN 'unit'
        ELSE 'bulk'
	END AS prod_qty_type_condense
FROM
	farmers_market.product
LIMIT 10;

/* 2) We want to flag all of the different types of pepper products that are sold
at the market. Add a column to the previous query called pepper_flag
that outputs a 1 if the product_name contains the word “pepper” (regardless of capitalization), and otherwise outputs 0. */
SELECT
	product_id,
    product_name,
    CASE
		WHEN product_qty_type = 'unit' THEN 'unit'
        ELSE 'bulk'
	END AS prod_qty_type_condense,
    
    CASE
		WHEN product_name LIKE '%pepper%' THEN 1
        ELSE 0
	END AS pepper_flag
FROM
	farmers_market.product
LIMIT 10;

/* 3) Can you think of a situation when a pepper product might not get flagged
as a pepper product using the code from the previous exercise?
ANSWER : if using other language / key or term for 'pepper' */



