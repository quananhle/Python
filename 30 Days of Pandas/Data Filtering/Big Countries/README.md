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
SELECT name, population, area FROM world WHERE area >= 3000000 OR population >= 25000000;
```

```Python
import pandas as pd

def big_countries(world: pd.DataFrame) -> pd.DataFrame:
    df = world[(world['area'] >= 3000000) | (world['population'] >= 25000000)]
    return df[['name', 'population', 'area']]
```
