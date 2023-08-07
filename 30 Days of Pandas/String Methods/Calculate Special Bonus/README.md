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

![image](https://github.com/quananhle/Python/assets/35042430/f9397abc-7de3-44c9-8239-bfa0f0e13dd4)

---

![image](https://github.com/quananhle/Python/assets/35042430/f1e108ca-422a-4a36-9049-501353870b1d)

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
