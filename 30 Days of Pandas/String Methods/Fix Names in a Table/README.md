## [1667. Fix Names in a Table](https://leetcode.com/problems/fix-names-in-a-table)

```Tag```: ```Panda``` ```SQL```

```MySQL
Create table If Not Exists Users (user_id int, name varchar(40))
Truncate table Users
insert into Users (user_id, name) values ('1', 'aLice')
insert into Users (user_id, name) values ('2', 'bOB')
```

```Python
Users = pd.DataFrame([], columns=['user_id', 'name']).astype({'user_id':'Int64', 'name':'object'})
```

![image](https://github.com/quananhle/Python/assets/35042430/dafd5ff5-c93b-4d9e-a8d7-842201a833e4)

---

![image](https://github.com/quananhle/Python/assets/35042430/124ee086-6337-463f-aa42-2c5f53091b9b)

---

```Python
import pandas as pd

def calculate_special_bonus(employees: pd.DataFrame) -> pd.DataFrame:
    employees['bonus'] = employees.apply(lambda x: x['salary'] if x['employee_id'] % 2 and not x['name'].startswith('M') else 0, axis=1)
    df = employees[['employee_id', 'bonus']].sort_values('employee_id')
    return df
```

```MySQL
# Write your MySQL query statement below
SELECT employee_id, CASE WHEN MOD(employee_id, 2) <> 0 AND name NOT LIKE 'M%' THEN salary
                        ELSE 0
                    END AS bonus
FROM employees
ORDER BY employee_id;
```
