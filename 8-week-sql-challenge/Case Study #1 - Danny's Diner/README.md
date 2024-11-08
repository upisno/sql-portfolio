# 🍜 Case Study #1 - Danny's Diner

All information relating to this case study can be found [here](https://8weeksqlchallenge.com/case-study-1/).

## Table of Contents

1. [Overview](#overview)

2. [Aims and Objectives](#overview)

3. [Data](#data)

4. [Entity Relationship Diagram](#entity-relationship-diagram)

</br>

## Overview
Driven by his love of Japanese food, Danny has opened a restaurant selling his three favourite dishes: sushi, curry, and ramen.

The restaurant is struggling to stay afloat. Danny has collected some basic data from the initial months of operation, but he needs help with using the data to aid the business.
</br>
</br>

## Aims and Objectives

Danny wants to use this data to understand more about customer visiting patterns and expenditure, as well as what the most popular dishes on the menu are.

This will help Danny to decide whether or not to expand the restaurant's loyalty program, whilst also providing his team with the ability to inspect the data without needing to use SQL.
</br>
</br>

## Data
Danny has provided three tables for this case study: `sales`, `menu`, and `members`.

- `sales` maps each `customer_id` to a `product_id` and a respective `order_date`, recording individual purchases made by each customer on specific dates.

- `menu` matches each unique `product_id` to its `product_name` and `price`, providing information on all available products and their costs.

- `members` links each unique `customer_id` to their `join_date`, indicating when each customer joined the beta version of the Danny’s Diner loyalty program (where applicable).

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
  

