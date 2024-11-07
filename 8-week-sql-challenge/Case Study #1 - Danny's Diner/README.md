# 🍜 Case Study #1 - Danny's Diner

All information relating to this case study can be found [here](https://8weeksqlchallenge.com/case-study-1/).

## Table of Contents

1. [Overview](#overview)

2. [Data](#data)

3. [Entity Relationship Diagram](#entity-relationship-diagram)

</br>

## Overview
Driven by his love of Japanese food, Danny has opened a restaurant selling his three favourite dishes: sushi, curry, and ramen.

The restaurant is struggling to stay afloat. Danny has collected some basic data from the initial months of operation, but he needs help with using the data to aid the business.

</br>

## Data
Danny has provided three tables for this case study: `sales`, `menu`, and `members`.

- `sales` records all purchases on the `customer_id`
- including the corresponding order date and product ID, detailing when and which menu items were ordered.


- `menu` table also had three fields

- `members` table

</br>

**Table 1. sales**
| customer_id | order_date | product_id |
|-------------|------------|------------|
| A           | 2021-01-01 | 1          |
| A           | 2021-01-01 | 2          |
| A           | 2021-01-07 | 2          |
| A           | 2021-01-10 | 3          |
| A           | 2021-01-11 | 3          |
| A           | 2021-01-11 | 3          |
| B           | 2021-01-01 | 2          |
| B           | 2021-01-02 | 2          |
| B           | 2021-01-04 | 1          |
| B           | 2021-01-11 | 1          |
| B           | 2021-01-16 | 3          |
| B           | 2021-02-01 | 3          |
| C           | 2021-01-01 | 3          |
| C           | 2021-01-01 | 3          |
| C           | 2021-01-07 | 3          |

</br>

**Table 2. menu**
| product_id | product_name | price |
|------------|--------------|-------|
| 1          | sushi        | 10    |
| 2          | curry        | 15    |
| 3          | ramen        | 12    |

</br>

**Table 3. members**
| customer_id | join_date  |
|-------------|------------|
| A           | 2021-01-07 |
| B           | 2021-01-09 |

</br>

## Entity Relationship Diagram

![ERD](Danny's%20Diner.svg)

</br>
  

