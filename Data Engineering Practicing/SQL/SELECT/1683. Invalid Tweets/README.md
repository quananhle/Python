## [1683. Invalid Tweets](https://leetcode.com/problems/invalid-tweets)

#### Difficulty: Easy

```SQL
-- Write your PostgreSQL query statement below
SELECT tweet_id FROM Tweets WHERE LENGTH(content) > 15;
```
