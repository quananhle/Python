## [595. Big Countries](https://leetcode.com/problems/big-countries)

```Tag```: ```SQL``` ```Pandas```

![image](https://github.com/quananhle/Python/assets/35042430/013465b7-0414-440b-bc89-5620511dba34)

```SQL
Create table If Not Exists World (name varchar(255), continent varchar(255), area int, population int, gdp bigint)
Truncate table World
insert into World (name, continent, area, population, gdp) values ('Afghanistan', 'Asia', '652230', '25500100', '20343000000')
insert into World (name, continent, area, population, gdp) values ('Albania', 'Europe', '28748', '2831741', '12960000000')
insert into World (name, continent, area, population, gdp) values ('Algeria', 'Africa', '2381741', '37100000', '188681000000')
insert into World (name, continent, area, population, gdp) values ('Andorra', 'Europe', '468', '78115', '3712000000')
insert into World (name, continent, area, population, gdp) values ('Angola', 'Africa', '1246700', '20609294', '100990000000')
```

```Python
World = pd.DataFrame([], columns=['name', 'continent', 'area', 'population', 'gdp']).astype({'name':'object', 'continent':'object', 'area':'Int64', 'population':'Int64', 'gdp':'Int64'})
```

![image](https://github.com/quananhle/Python/assets/35042430/a97ee5d7-aeca-43dd-b22e-8a6b5391b2dd)

---

__Example 1__:

![image](https://github.com/quananhle/Python/assets/35042430/a4b202d1-afda-4c7f-9c54-2e9a009d1e30)

---

```MySQL
SELECT event_day AS day , emp_id , SUM(out_time - in_time) AS total_time FROM Employees GROUP BY emp_id , event_day;
```

```Python
import pandas as pd

def total_time(employees: pd.DataFrame) -> pd.DataFrame:
    employees["total_time"] = employees['out_time'] - employees['in_time']
    df = employees.groupby(["event_day" , "emp_id"])["total_time"].sum().reset_index()
    df.rename({"event_day": "day"}, axis=1, inplace=True)
    df["day"] = df["day"].astype(str)
    return df
```
