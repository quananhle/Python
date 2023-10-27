## [584. Find Customer Referee](https://leetcode.com/problems/find-customer-referee)

#### Difficulty: Easy

```SQL
-- Write your PostgreSQL query statement below
SELECT name FROM Customer WHERE referee_id != 2 OR referee_id IS NULL;
```

```SQL
-- Write your PostgreSQL query statement below
SELECT name FROM Customer WHERE COALESCE(referee_id, 0) <> 2;
```