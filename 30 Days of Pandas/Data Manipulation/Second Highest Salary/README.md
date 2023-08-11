## [176. Second Highest Salary](https://leetcode.com/problems/second-highest-salary)

```Tag```: ```SQL``` ```Pandas```

#### Difficulty: Medium

```MySQL
Create table If Not Exists Employee (id int, salary int)
Truncate table Employee
insert into Employee (id, salary) values ('1', '100')
insert into Employee (id, salary) values ('2', '200')
insert into Employee (id, salary) values ('3', '300')
```

```Python
data = [[1, 100], [2, 200], [3, 300]]
Employee = pd.DataFrame(data, columns=['id', 'salary']).astype({'id':'int64', 'salary':'int64'})
```

![image](https://github.com/quananhle/Python/assets/35042430/5cff4359-7f5f-43b5-a829-a5d7370ff66b)

---

![image](https://github.com/quananhle/Python/assets/35042430/e9164df6-849b-47a5-916c-a6a6465d52e9)

---

![image](https://github.com/quananhle/Python/assets/35042430/459cf5fb-a4e8-4542-8910-1c2da3ec78bc)

---

```Python
import pandas as pd

def second_highest_salary(employee: pd.DataFrame) -> pd.DataFrame:
    df = employee[['salary']].drop_duplicates()
    if len(df) < 2:
        return pd.DataFrame({'SecondHighestSalary': [None]})
    df = df.sort_values('salary', ascending=False).head(2).tail(1)
    df.rename({'salary': 'SecondHighestSalary'}, axis=1, inplace=True)
    return df
```

```Python
import pandas as pd

def second_highest_salary(employee: pd.DataFrame) -> pd.DataFrame:
    employee = employee.drop_duplicates(['salary'])
    if len(employee["salary"].unique()) < 2:
        return pd.DataFrame({'SecondHighestSalary': [np.NaN]})
    employee = employee.sort_values('salary', ascending=False)
    employee.drop('id', axis=1, inplace=True)
    employee.rename({'salary': 'SecondHighestSalary'}, axis=1, inplace=True)
    return employee.head(2).tail(1) 
```
