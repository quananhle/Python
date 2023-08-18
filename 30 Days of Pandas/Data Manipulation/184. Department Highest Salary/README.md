## [184. Department Highest Salary](https://leetcode.com/problems/department-highest-salary)

```Tag```: ```Pandas``` ```SQL```

#### Difficulty: Medium

```SQL
Create table If Not Exists Employee (id int, name varchar(255), salary int, departmentId int)
Create table If Not Exists Department (id int, name varchar(255))
Truncate table Employee
insert into Employee (id, name, salary, departmentId) values ('1', 'Joe', '70000', '1')
insert into Employee (id, name, salary, departmentId) values ('2', 'Jim', '90000', '1')
insert into Employee (id, name, salary, departmentId) values ('3', 'Henry', '80000', '2')
insert into Employee (id, name, salary, departmentId) values ('4', 'Sam', '60000', '2')
insert into Employee (id, name, salary, departmentId) values ('5', 'Max', '90000', '1')
Truncate table Department
insert into Department (id, name) values ('1', 'IT')
insert into Department (id, name) values ('2', 'Sales')
```

```Python
data = [[1, 'Joe', 70000, 1], [2, 'Jim', 90000, 1], [3, 'Henry', 80000, 2], [4, 'Sam', 60000, 2], [5, 'Max', 90000, 1]]
Employee = pd.DataFrame(data, columns=['id', 'name', 'salary', 'departmentId']).astype({'id':'Int64', 'name':'object', 'salary':'Int64', 'departmentId':'Int64'})
data = [[1, 'IT'], [2, 'Sales']]
Department = pd.DataFrame(data, columns=['id', 'name']).astype({'id':'Int64', 'name':'object'})
```

![image](https://github.com/quananhle/Python/assets/35042430/516c7285-8e99-4b9f-a14e-88309d2799e9)

---

![image](https://github.com/quananhle/Python/assets/35042430/10e63546-7f9b-4cbd-a94d-890feb1eaef9)

---

![image](https://github.com/quananhle/Python/assets/35042430/a4b825ba-0f00-4a96-8ce8-594b60378355)

---

```Python
import pandas as pd

def department_highest_salary(employee: pd.DataFrame, department: pd.DataFrame) -> pd.DataFrame:
    df = employee.merge(department, left_on='departmentId', right_on='id', how='left')
    df.rename(columns={'name_x': 'Employee', 'name_y': 'Department', 'salary': 'Salary'}, inplace=True)

    max_salary = df.groupby('Department')['Salary'].transform('max')
    df = df[df['Salary'] == max_salary]

    return df[['Department', 'Employee', 'Salary']]
```

```MySQL
# Write your MySQL query statement below
SELECT b.name AS "Department" , a.name AS "Employee", a.salary AS "Salary" 
FROM Employee a LEFT JOIN Department b ON a.departmentId = b.id 
WHERE (a.departmentId, a.salary) IN (SELECT departmentId, MAX(salary) FROM Employee GROUP BY departmentId);
```
