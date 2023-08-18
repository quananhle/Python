## [178. Rank Scores](https://leetcode.com/problems/rank-scores)

```Tag```: ```SQL``` ```Pandas```

#### Difficulty: Medium

```MySQL
Create table If Not Exists Scores (id int, score DECIMAL(3,2))
Truncate table Scores
insert into Scores (id, score) values ('1', '3.5')
insert into Scores (id, score) values ('2', '3.65')
insert into Scores (id, score) values ('3', '4.0')
insert into Scores (id, score) values ('4', '3.85')
insert into Scores (id, score) values ('5', '4.0')
insert into Scores (id, score) values ('6', '3.65')
```

```Python
data = [[1, 3.5], [2, 3.65], [3, 4.0], [4, 3.85], [5, 4.0], [6, 3.65]]
Scores = pd.DataFrame(data, columns=['id', 'score']).astype({'id':'Int64', 'score':'Float64'})
```

---

![image](https://github.com/quananhle/Python/assets/35042430/abd65644-e193-45fb-a7f5-a37d88841791)

---

![image](https://github.com/quananhle/Python/assets/35042430/a77fbc9e-5e21-4941-8f89-6b3cbd512d99)

---

```Python
import pandas as pd

def order_scores(scores: pd.DataFrame) -> pd.DataFrame:
  scores['rank'] = scores['score'].rank(method='dense', ascending=False)
  return scores[['score', 'rank']].sort_values('score', ascending=False)
```

```MySQL
# # Write your MySQL query statement below
SELECT S.score, DENSE_RANK() OVER (ORDER BY S.score DESC) AS 'rank'
FROM Scores S;
```

```MySQL
# # Write your MySQL query statement below
SELECT S1.score , (SELECT COUNT(DISTINCT S2.score) FROM Scores S2 WHERE S2.score >= S1.score) AS "rank"
FROM Scores S1
ORDER BY S1.score DESC;
```

```MySQL
# # Write your MySQL query statement below
SELECT S.score, COUNT(DISTINCT T.score) AS 'rank' 
FROM Scores S INNER JOIN Scores T on S.score <= T.score
GROUP BY S.id, S.score ORDER BY S.score DESC;
```
