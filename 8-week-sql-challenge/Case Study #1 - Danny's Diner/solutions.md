# 🍜 Case Study #1 - Danny's Diner

## Case Study Questions

1. [What is the total amount each customer spent at the restaurant?](#1-what-is-the-total-amount-each-customer-spent-at-the-restaurant)
2. [How many days has each customer visited the restaurant?](#2-how-many-days-has-each-customer-visited-the-restaurant)
3. [What was the first item from the menu purchased by each customer?](#3-what-was-the-first-item-from-the-menu-purchased-by-each-customer)



## 1. What is the total amount each customer spent at the restaurant?

```sql
SELECT     customer_id
           SUM(price) AS total_spent
FROM       dannys_diner.sales
           INNER JOIN dannys_diner.menu
	           ON menu.product_id = sales.product_id
GROUP BY   customer_id
ORDER BY   customer_id;
```


## Result set:
| customer_id | total_spent |
| ----------- | ----------- |
| A           | 76          |
| B           | 74          |
| C           | 36          |


---


## 2. How many days has each customer visited the restaurant?

```sql
SELECT     customer_id
         , COUNT(DISTINCT(order_date)) AS days_visited
FROM       dannys_diner.sales
GROUP BY   customer_id
ORDER BY   customer_id;
```

## Result set:
| customer_id | days_visited |
| ----------- | ------------ |
| A           | 4            |
| B           | 6            |
| C           | 2            |


## 3. What was the first item from the menu purchased by each customer?

```sql
SELECT     DISTINCT customer_id
         , product_name
FROM       dannys_diner.sales
           INNER JOIN dannys_diner.menu
		   ON menu.product_id = sales.product_id
WHERE      (
           customer_id
         , order_date) IN (
                          SELECT     customer_id
                                   , MIN(order_date)
                          FROM       dannys_diner.sales
                          GROUP BY   customer_id)
ORDER BY   customer_id;
```

## Result set:
| customer_id | product_name |
| ----------- | ------------ |
| A           | curry        |
| A           | sushi        |
| B           | curry        |
| C           | ramen        |





