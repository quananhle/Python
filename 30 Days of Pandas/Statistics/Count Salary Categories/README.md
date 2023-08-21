## [1907. Count Salary Categories](https://leetcode.com/problems/count-salary-categories)

```Tag```: ```SQL``` ```Pandas```

#### Difficulty: Easy

```MySQL
Create table If Not Exists Delivery (delivery_id int, customer_id int, order_date date, customer_pref_delivery_date date)
Truncate table Delivery
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('1', '1', '2019-08-01', '2019-08-02')
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('2', '5', '2019-08-02', '2019-08-02')
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('3', '1', '2019-08-11', '2019-08-11')
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('4', '3', '2019-08-24', '2019-08-26')
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('5', '4', '2019-08-21', '2019-08-22')
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('6', '2', '2019-08-11', '2019-08-13')
```

```Python
data = [[1, 1, '2019-08-01', '2019-08-02'], [2, 5, '2019-08-02', '2019-08-02'], [3, 1, '2019-08-11', '2019-08-11'], [4, 3, '2019-08-24', '2019-08-26'], [5, 4, '2019-08-21', '2019-08-22'], [6, 2, '2019-08-11', '2019-08-13']]
Delivery = pd.DataFrame(data, columns=['delivery_id', 'customer_id', 'order_date', 'customer_pref_delivery_date']).astype({'delivery_id':'Int64', 'customer_id':'Int64', 'order_date':'datetime64[ns]', 'customer_pref_delivery_date':'datetime64[ns]'})
```

![image](https://github.com/quananhle/Python/assets/35042430/e7ed406e-87b6-4eea-88b4-e8ea01524a31)

---

![image](https://github.com/quananhle/Python/assets/35042430/6d2df469-d5b4-41a3-9de9-6b050c8f341a)

---

```Python
import pandas as pd

def count_salary_categories(accounts: pd.DataFrame) -> pd.DataFrame:
    low_salary = accounts[accounts['income'] < 20000]
    average_salary = accounts[(20000 <= accounts['income']) & (accounts['income'] <= 50000)]
    high_salary = accounts[accounts['income'] > 50000]

    df = pd.DataFrame({'category': ['Low Salary' , 'Average Salary', 'High Salary'], 
                       'accounts_count': [len(low_salary) , len(average_salary) , len(high_salary)]})
    return df
```

```MySQL
import pandas as pd

def count_salary_categories(accounts: pd.DataFrame) -> pd.DataFrame:
    low_salary = (accounts['income'] < 20000).sum()
    average_salary = ((20000 <= accounts['income']) & (accounts['income'] <= 50000)).sum()
    high_salary = (accounts['income'] > 50000).sum()

    df = pd.DataFrame({'category': ['Low Salary' , 'Average Salary', 'High Salary'], 
                       'accounts_count': [low_salary , average_salary , high_salary]
                     })
    return df
```

```MySQL
# Write your MySQL query statement below
SELECT "Low Salary" category , SUM(CASE WHEN income < 20000 THEN 1 ELSE 0 END) AS "accounts_count" FROM Accounts
UNION
SELECT "Average Salary" category , SUM(CASE WHEN 20000 <= income AND income <= 50000 THEN 1 ELSE 0 END) AS "accounts_count" FROM Accounts
UNION
SELECT "High Salary" category , SUM(CASE WHEN income > 50000 THEN 1 ELSE 0 END) AS "accounts_count" FROM Accounts;
```

```MySQL
SELECT "Low Salary" AS category , COALESCE(COUNT(account_id), 0) AS "accounts_count" 
FROM Accounts WHERE income < 20000
UNION
SELECT "Average Salary" AS category , COALESCE(COUNT(account_id), 0) AS "accounts_count" 
FROM Accounts WHERE 20000 <= income AND income <= 50000
UNION
SELECT "High Salary" AS category , COALESCE(COUNT(account_id), 0) AS "accounts_count" 
FROM Accounts WHERE income > 50000;
```

```MySQL
SELECT "Low Salary" AS category , IFNULL(COUNT(account_id), 0) AS "accounts_count" FROM Accounts WHERE income < 20000
UNION
SELECT "Average Salary" AS category , IFNULL(COUNT(account_id), 0) AS "accounts_count" FROM Accounts WHERE 20000 <= income AND income <= 50000
UNION
SELECT "High Salary" AS category , IFNULL(COUNT(account_id), 0) AS "accounts_count" FROM Accounts WHERE income > 50000;
```
