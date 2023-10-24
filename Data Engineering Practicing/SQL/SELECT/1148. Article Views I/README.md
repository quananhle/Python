## [1148. Article Views I](https://leetcode.com/problems/article-views-i)

#### Difficulty: Easy

```SQL
-- Write your PostgreSQL query statement below
SELECT DISTINCT(author_id) AS id FROM Views WHERE author_id = viewer_id ORDER BY id;
```
