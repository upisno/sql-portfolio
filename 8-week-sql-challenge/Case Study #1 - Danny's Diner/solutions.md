# 🍜 Case Study #1 - Danny's Diner

## Table of Contents

1. [What is the total amount each customer spent at the restaurant?](#what-is-the-total-amount-each-customer-spent-at-the-restaurant)

## 1. What is the total amount each customer spent at the restaurant?

```sql
SELECT     customer_id
         , SUM(price) AS total_spent
FROM       sales
           INNER JOIN menu
	           ON menu.product_id = sales.product_id
GROUP BY   customer_id
ORDER BY   customer_id;
```

#### Result set:
| customer_id | total_spent |
| ----------- | ----------- |
| A           | 76          |
| B           | 74          |
| C           | 36          |
