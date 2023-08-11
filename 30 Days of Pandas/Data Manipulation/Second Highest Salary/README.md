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

