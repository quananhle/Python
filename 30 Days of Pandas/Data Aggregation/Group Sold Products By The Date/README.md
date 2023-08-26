## [1484. Group Sold Products By The Date](https://leetcode.com/problems/group-sold-products-by-the-date)

```Tag```: ```SQL``` ```Pandas```

#### Difficulty: Easy

![image](https://github.com/quananhle/Python/assets/35042430/48b214f1-b28a-4145-89e1-974adae61156)

```SQL
Create table If Not Exists Activities (sell_date date, product varchar(20))
Truncate table Activities
insert into Activities (sell_date, product) values ('2020-05-30', 'Headphone')
insert into Activities (sell_date, product) values ('2020-06-01', 'Pencil')
insert into Activities (sell_date, product) values ('2020-06-02', 'Mask')
insert into Activities (sell_date, product) values ('2020-05-30', 'Basketball')
insert into Activities (sell_date, product) values ('2020-06-01', 'Bible')
insert into Activities (sell_date, product) values ('2020-06-02', 'Mask')
insert into Activities (sell_date, product) values ('2020-05-30', 'T-Shirt')
```

```Python
data = [['2020-05-30', 'Headphone'], ['2020-06-01', 'Pencil'], ['2020-06-02', 'Mask'], ['2020-05-30', 'Basketball'], ['2020-06-01', 'Bible'], ['2020-06-02', 'Mask'], ['2020-05-30', 'T-Shirt']]
Activities = pd.DataFrame(data, columns=['sell_date', 'product']).astype({'sell_date':'datetime64[ns]', 'product':'object'})
```

---

![image](https://github.com/quananhle/Python/assets/35042430/b23d4c92-98e8-41f3-b04f-ab3d5b7f8204)

---

```Python
import pandas as pd

def categorize_products(activities: pd.DataFrame) -> pd.DataFrame:
    df = activities.groupby('sell_date')

    df = df.agg(
        num_sold = ('product' , 'nunique'),
        products = ('product' , lambda x: ','.join(sorted(set(x))))
    ).reset_index()

    df.sort_values('sell_date', inplace=True)
    return df
```

```MySQL
# Write your MySQL query statement below
# Write your MySQL query statement below
SELECT sell_date, COUNT(DISTINCT product) AS num_sold, GROUP_CONCAT(DISTINCT product ORDER BY product ASC SEPARATOR ',' ) AS products  
FROM Activities 
GROUP BY sell_date
ORDER BY sell_date;
```
