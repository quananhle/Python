## [1741. Find Total Time Spent by Each Employee](https://leetcode.com/problems/find-total-time-spent-by-each-employee)

```Tag```: ```SQL``` ```Pandas```

#### Difficulty: Easy

![image](https://github.com/quananhle/Python/assets/35042430/013465b7-0414-440b-bc89-5620511dba34)

```SQL
Create table If Not Exists Employees(emp_id int, event_day date, in_time int, out_time int)
Truncate table Employees
insert into Employees (emp_id, event_day, in_time, out_time) values ('1', '2020-11-28', '4', '32')
insert into Employees (emp_id, event_day, in_time, out_time) values ('1', '2020-11-28', '55', '200')
insert into Employees (emp_id, event_day, in_time, out_time) values ('1', '2020-12-3', '1', '42')
insert into Employees (emp_id, event_day, in_time, out_time) values ('2', '2020-11-28', '3', '33')
insert into Employees (emp_id, event_day, in_time, out_time) values ('2', '2020-12-9', '47', '74')
```

```Python
data = [['1', '2020-11-28', '4', '32'], ['1', '2020-11-28', '55', '200'], ['1', '2020-12-3', '1', '42'], ['2', '2020-11-28', '3', '33'], ['2', '2020-12-9', '47', '74']]
Employees = pd.DataFrame(data, columns=['emp_id', 'event_day', 'in_time', 'out_time']).astype({'emp_id':'Int64', 'event_day':'datetime64[ns]', 'in_time':'Int64', 'out_time':'Int64'})
```

![image](https://github.com/quananhle/Python/assets/35042430/cb90b9ee-4cc5-4bc1-b141-ac2da771e18f)

---

![image](https://github.com/quananhle/Python/assets/35042430/6b6c0b4d-cbc8-497c-bc6d-e4062bc65503)

---

![image](https://github.com/quananhle/Python/assets/35042430/a0266006-7157-44b9-b0c4-64b9c06d9dc8)

---

```Python
import pandas as pd

def total_time(employees: pd.DataFrame) -> pd.DataFrame:
    employees["total_time"] = employees['out_time'] - employees['in_time']
    df = employees.groupby(["event_day" , "emp_id"])["total_time"].sum().reset_index()
    df.rename({"event_day": "day"}, axis=1, inplace=True)
    df["day"] = df["day"].astype(str)
    return df
```

```MySQL
# Write your MySQL query statement below
SELECT event_day AS day , emp_id , SUM(out_time - in_time) AS total_time FROM Employees GROUP BY emp_id , event_day;
```
