## [2082. The Number of Rich Customers](https://leetcode.com/problems/the-number-of-rich-customers)

```Tag```: ```SQL``` ```Pandas```

#### Difficulty: Easy

```MySQL
Create table If Not Exists Store (bill_id int, customer_id int, amount int)
Truncate table Store
insert into Store (bill_id, customer_id, amount) values ('6', '1', '549')
insert into Store (bill_id, customer_id, amount) values ('8', '1', '834')
insert into Store (bill_id, customer_id, amount) values ('4', '2', '394')
insert into Store (bill_id, customer_id, amount) values ('11', '3', '657')
insert into Store (bill_id, customer_id, amount) values ('13', '3', '257')
```

```Python
data = [[6, 1, 549], [8, 1, 834], [4, 2, 394], [11, 3, 657], [13, 3, 257]]
Store = pd.DataFrame(data, columns=['bill_id', 'customer_id', 'amount']).astype({'bill_id':'int64', 'customer_id':'int64', 'amount':'int64'})
```

![image](https://github.com/quananhle/Python/assets/35042430/32ea14f3-444e-4bcc-b550-0ed39467ad56)

---

![image](https://github.com/quananhle/Python/assets/35042430/dae3e876-3dc3-4915-99e8-d2aefb3bb47f)

---

```Python
import pandas as pd

def count_rich_customers(store: pd.DataFrame) -> pd.DataFrame:
    df = store[store['amount'] > 500]
    count = df['customer_id'].nunique()
    return pd.DataFrame({'rich_count': [count]})
```

```MySQL
# Write your MySQL query statement below
SELECT COUNT(DISTINCT(customer_id)) AS rich_count FROM Store WHERE amount > 500;
```
