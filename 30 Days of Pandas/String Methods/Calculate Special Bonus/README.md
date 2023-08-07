## [1873. Calculate Special Bonus](https://leetcode.com/problems/calculate-special-bonus/)

```Tag```: ```Panda``` ```SQL```

```MySQL
Create table If Not Exists Employees (employee_id int, name varchar(30), salary int)
Truncate table Employees
insert into Employees (employee_id, name, salary) values ('2', 'Meir', '3000')
insert into Employees (employee_id, name, salary) values ('3', 'Michael', '3800')
insert into Employees (employee_id, name, salary) values ('7', 'Addilyn', '7400')
insert into Employees (employee_id, name, salary) values ('8', 'Juan', '6100')
insert into Employees (employee_id, name, salary) values ('9', 'Kannon', '7700')
```

```Python
Employees = pd.DataFrame([], columns=['employee_id', 'name', 'salary']).astype({'employee_id':'int64', 'name':'object', 'salary':'int64'})
```

---

![image](https://github.com/quananhle/Python/assets/35042430/b4e09c5c-d3d8-4358-a12e-1266c5d92e2b)

---

```Python
import pandas as pd

def invalid_tweets(tweets: pd.DataFrame) -> pd.DataFrame:
    df = tweets[tweets['content'].str.len() > 15]
    return df[['tweet_id']]
```

```MySQL
# Write your MySQL query statement below
SELECT tweet_id FROM Tweets WHERE LENGTH(content) > 15;
```
