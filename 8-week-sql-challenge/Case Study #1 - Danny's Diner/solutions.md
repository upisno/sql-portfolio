# 🍜 Case Study #1 - Danny's Diner (Solutions)
These are my solutions to the first case study from the [8 Week SQL Challenge](https://8weeksqlchallenge.com/) created by [Danny Ma](https://www.linkedin.com/in/datawithdanny).

## Case Study Questions
1. [What is the total amount each customer spent at the restaurant?](#1-what-is-the-total-amount-each-customer-spent-at-the-restaurant)

<br>

## 1. What is the total amount each customer spent at the restaurant?

```sql
SELECT     customer_id
         , SUM(price) AS total_spent
FROM       dannys_diner.sales
           INNER JOIN dannys_diner.menu
                   ON menu.product_id = sales.product_id
GROUP BY   customer_id
ORDER BY   customer_id;
```

- Use the `INNER JOIN` clause to merge the `sales` and `menu` tables on the `product_id` field.
- Use the `SUM()` function to find the total amount spent at the restaurant.
- Use the `GROUP BY` clause to find the total amount each customer spent at the restaurant.

<br>

**Result set:**	
| customer_id | total_spent |
| ----------- | ----------- |
| A           | 76          |
| B           | 74          |
| C           | 36          |

- Customer A spent a total of $76.
- Customer B spent a total of $74.
- Customer C spent a total of $36.

<br>
