## [1378. Replace Employee ID With The Unique Identifier](https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier)

#### Difficulty: Easy

```SQL
-- Write your PostgreSQL query statement below
SELECT COALESCE(b.unique_id, NULL) AS unique_id, a.name FROM Employees a LEFT JOIN EmployeeUNI b ON a.id = b.id;
```
