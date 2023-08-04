## [183. Customers Who Never Order](https://leetcode.com/problems/customers-who-never-order/)

```Tag```: ```SQL``` ```Pandas```

```SQL
Create table If Not Exists Customers (id int, name varchar(255))
Create table If Not Exists Orders (id int, customerId int)
Truncate table Customers
insert into Customers (id, name) values ('1', 'Joe')
insert into Customers (id, name) values ('2', 'Henry')
insert into Customers (id, name) values ('3', 'Sam')
insert into Customers (id, name) values ('4', 'Max')
Truncate table Orders
insert into Orders (id, customerId) values ('1', '3')
insert into Orders (id, customerId) values ('2', '1')
```

```Python
Customers = pd.DataFrame([], columns=['id', 'name']).astype({'id':'Int64', 'name':'object'})
Orders = pd.DataFrame([], columns=['id', 'customerId']).astype({'id':'Int64', 'customerId':'Int64'})

---

```MySQL
# Write your MySQL query statement below
SELECT name AS customers FROM customers WHERE id NOT IN (SELECT customerId FROM orders);
```

```Python
import pandas as pd

def find_customers(customers: pd.DataFrame, orders: pd.DataFrame) -> pd.DataFrame:
    df = customers[~customers['id'].isin(orders['customerId'])]
    return df[['name']].rename(columns={'name': 'Customers'})
```
