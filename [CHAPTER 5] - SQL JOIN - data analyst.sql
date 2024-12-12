-- [CHAPTER 5 SQL Join]
SELECT 
	p.product_id,
    p.product_name,
    pc.product_category_id,
    pc.product_category_name
FROM
	farmers_market.product as p
    INNER JOIN product_category as pc
		ON p.product_category_id = pc.product_category_id;
        


SELECT
	*
FROM
	farmers_market.customer as c
    LEFT JOIN customer_purchases as cp
		ON c.customer_id = cp.customer_id;
        
        

SELECT
	c.*
FROM
	farmers_market.customer as c
	LEFT JOIN
		customer_purchases as cp
		ON c.customer_id = cp.customer_id
WHERE
	cp.customer_id IS NULL;
    
    
/* JOIN MULTIPLE TABLES */
SELECT
	b.booth_number,
    b.booth_type,
    vba.market_date,
    v.vendor_id,
    v.vendor_name,
    v.vendor_type
FROM farmers_market.booth as b
	LEFT JOIN vendor_booth_assignments as vba
		ON b.booth_number = vba.booth_number
	LEFT JOIN vendor as v
		ON v.vendor_id = vba.vendor_id
ORDER BY b.booth_number, vba.market_date;


/* EXERCISE */
/* 1) . Write a query that INNER JOINs the vendor table to the vendor_booth_
assignments table on the vendor_id field they both have in common, and
sorts the result by vendor_name, then market_date. */

SELECT
	*
FROM farmers_market.vendor as v
	INNER JOIN farmers_market.vendor_booth_assignments as vba
		ON v.vendor_id = vba.vendor_id
ORDER BY vendor_name, market_date;

/* 2) Is it possible to write a query that produces an output identical to the
output of the following query, but using a LEFT JOIN instead of a RIGHT
JOIN? */
SELECT *
FROM customer AS c
RIGHT JOIN customer_purchases AS cp
 ON c.customer_id = cp.customer_id;
 
 SELECT *
 FROM customer as c
 LEFT JOIN customer_purchases as cp
	ON cp.customer_id = c.customer_id;
 


