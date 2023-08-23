## [2356. Number of Unique Subjects Taught by Each Teacher](https://leetcode.com/problems/number-of-unique-subjects-taught-by-each-teacher)

```Tag```: ```SQL``` ```Pandas```

#### Difficulty: Easy

![image](https://github.com/quananhle/Python/assets/35042430/d49a2ae3-20b0-4d86-bfb7-2efeed992e7c)

```SQL
Create table If Not Exists Teacher (teacher_id int, subject_id int, dept_id int)
Truncate table Teacher
insert into Teacher (teacher_id, subject_id, dept_id) values ('1', '2', '3')
insert into Teacher (teacher_id, subject_id, dept_id) values ('1', '2', '4')
insert into Teacher (teacher_id, subject_id, dept_id) values ('1', '3', '3')
insert into Teacher (teacher_id, subject_id, dept_id) values ('2', '1', '1')
insert into Teacher (teacher_id, subject_id, dept_id) values ('2', '2', '1')
insert into Teacher (teacher_id, subject_id, dept_id) values ('2', '3', '1')
insert into Teacher (teacher_id, subject_id, dept_id) values ('2', '4', '1')
```

```Python
data = [[1, 2, 3], [1, 2, 4], [1, 3, 3], [2, 1, 1], [2, 2, 1], [2, 3, 1], [2, 4, 1]]
Teacher = pd.DataFrame(data, columns=['teacher_id', 'subject_id', 'dept_id']).astype({'teacher_id':'Int64', 'subject_id':'Int64', 'dept_id':'Int64'})
```

![image](https://github.com/quananhle/Python/assets/35042430/093baf70-1a64-41c9-93f9-62e62106ab40)

---

![image](https://github.com/quananhle/Python/assets/35042430/0e15fc7c-33f8-4550-bd9d-94e15b9e54e9)

---

```Python

```

```MySQL
# Write your MySQL query statement below

```
