## [N<sup>th</sup> Highest Salary](https://leetcode.com/problems/nth-highest-salary)

```Tag```: ```SQL``` ```Pandas```

#### Difficulty: Medium

```MySQL
Create table If Not Exists Employee (Id int, Salary int)
Truncate table Employee
insert into Employee (id, salary) values ('1', '100')
insert into Employee (id, salary) values ('2', '200')
insert into Employee (id, salary) values ('3', '300')
OK
```

![image](https://github.com/quananhle/Python/assets/35042430/c98c269e-b9c4-4a40-9b07-e663057b0176)


![image](https://github.com/quananhle/Python/assets/35042430/9c58e2d6-addb-4843-a2bc-99ceff536462)

---

![image](https://github.com/quananhle/Python/assets/35042430/ec461574-0647-4077-8338-ad3b59442318)

---

```Python
import pandas as pd

def nth_highest_salary(employee: pd.DataFrame, N: int) -> pd.DataFrame:
    df = employee[['salary']].drop_duplicates()
    if len(df) < N:
        return pd.DataFrame({'getNthHighestSalary(2)': [None]})
    return df.sort_values('salary', ascending=False).head(N).tail(1)
```

```MySQL
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
    RETURN (
        # Write your MySQL query statement below.
        SELECT DISTINCT
            salary
        FROM
            (
            SELECT 
                id, salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS DR
            FROM 
                Employee
            ) AS rnked_emp
        WHERE DR = N
  );
END
```

```MySQL
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
    DECLARE M INT;
    SET M = N - 1;
        RETURN (
            # Write your MySQL query statement below.
            SELECT DISTINCT salary FROM Employee ORDER BY salary DESC LIMIT M, 1
        );
END
```
