/* --------------------
   Case Study Questions
   --------------------*/

-- 1. What is the total amount each customer spent at the restaurant?
SELECT     customer_id
         , SUM(price)
FROM       sales
           INNER JOIN menu
	           ON menu.product_id = sales.product_id
GROUP BY   customer_id
ORDER BY   customer_id;


-- 2. How many days has each customer visited the restaurant?
SELECT     customer_id
         , COUNT(DISTINCT(order_date))
FROM       sales
GROUP BY   customer_id
ORDER BY   customer_id;


-- 3. What was the first item from the menu purchased by each customer?
SELECT     DISTINCT customer_id
         , product_name
FROM       sales
           INNER JOIN menu
		           ON menu.product_id = sales.product_id
WHERE      (customer_id
         ,  order_date) IN (SELECT     customer_id
                                     , MIN(order_date)
                            FROM       sales
                            GROUP BY   customer_id)
ORDER BY   customer_id;



-- 4. What is the most purchased item on the menu and how many times was it purchased by all customers?
SELECT     customer_id
         , product_name
         , COUNT(*) AS item_count
FROM       sales
           INNER JOIN menu
                   ON menu.product_id = sales.product_id
WHERE      sales.product_id IN (
                               SELECT    sales.product_id -- Subquery for most purchased item (product_id = 3)
                               FROM      sales
                               GROUP BY  product_id
                               ORDER BY  COUNT(*) DESC
                               LIMIT     1)
GROUP BY   customer_id
         , product_name
ORDER BY   customer_id;

-- Across all customers
SELECT     product_name
         , COUNT(*) AS item_count
FROM       sales
           INNER JOIN menu
                   ON menu.product_id = sales.product_id
WHERE      sales.product_id IN (
                               SELECT    sales.product_id -- Subquery for most purchased item (product_id = 3)
                               FROM      sales
                               GROUP BY  product_id
                               ORDER BY  COUNT(*) DESC
                               LIMIT     1)
GROUP  BY  product_name;


-- 5. Which item was the most popular for each customer?
WITH ranked_sales AS (
-- CTE with window function to rank items and group by customers
SELECT   customer_id
       , product_name
       , COUNT(*) AS item_count
       , RANK() OVER (PARTITION BY customer_id 
                      ORDER BY     COUNT(*) DESC) AS item_rank
         FROM       sales
                    INNER JOIN menu
                            ON menu.product_id = sales.product_id
         GROUP BY   customer_id
                  , product_name
)
-- Main query
SELECT   customer_id
       , product_name
       , item_count
FROM     ranked_sales
-- WHERE clause to isolate the most purchased items
WHERE    item_rank = 1;


-- 6. Which item was purchased first by the customer after they became a member?
WITH first_orders AS (
-- CTE with window function to isolate orders made after becoming a member
SELECT   sales.customer_id
       , join_date
       , order_date
       , sales.product_id
       , product_name
       , ROW_NUMBER() OVER (PARTITION BY sales.customer_id
                            ORDER BY     order_date ASC) AS item_rank
FROM     sales
         INNER JOIN members
                 ON members.customer_id = sales.customer_id
         INNER JOIN menu
                 ON menu.product_id = sales.product_id
WHERE    join_date < order_date -- I use < rather than <= as there is no time of purchase
)
-- Main query
SELECT     customer_id
         , product_name
         , order_date
         , join_date
FROM       first_orders
WHERE      item_rank = 1;

-- A less cautious approach
WITH first_orders AS (
-- CTE with window function to isolate orders made after becoming a member
SELECT   sales.customer_id
       , join_date
       , order_date
       , sales.product_id
       , product_name
       , ROW_NUMBER() OVER (PARTITION BY sales.customer_id
                            ORDER BY     order_date ASC) AS item_rank
FROM     sales
         INNER JOIN members
                 ON members.customer_id = sales.customer_id
         INNER JOIN menu
                 ON menu.product_id = sales.product_id
WHERE    join_date <= order_date
)
-- Main query
SELECT   customer_id
       , product_name
       , order_date
       , join_date
FROM     first_orders
WHERE    item_rank = 1;


-- 7. Which item was purchased just before the customer became a member?
WITH prior_orders AS (
-- CTE with window function to isolate orders made prior to membership
SELECT   sales.customer_id
       , join_date
       , order_date
       , product_name
       , RANK() OVER (PARTITION BY sales.customer_id
                      ORDER BY     order_date ASC) AS item_rank
FROM     sales
         INNER JOIN members
                 ON members.customer_id = sales.customer_id
         INNER JOIN menu
                 ON menu.product_id = sales.product_id
WHERE    join_date > order_date
)
SELECT   customer_id
       , product_name
       , join_date
       , order_date
FROM     prior_orders
WHERE    item_rank = 1;


-- 8. What is the total items and amount spent for each member before they became a member?
-- 9.  If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?
-- 10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?
