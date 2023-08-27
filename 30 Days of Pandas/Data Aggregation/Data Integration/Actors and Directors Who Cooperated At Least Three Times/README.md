## [1050. Actors and Directors Who Cooperated At Least Three Times](https://leetcode.com/problems/actors-and-directors-who-cooperated-at-least-three-times)

```Tag```: ```SQL``` ```Pandas```

#### Difficulty: Easy

![image](https://github.com/quananhle/Python/assets/35042430/21fd8b6f-6b9e-44bf-8859-82d5a69ae3b8)

```SQL
Create table If Not Exists ActorDirector (actor_id int, director_id int, timestamp int)
Truncate table ActorDirector
insert into ActorDirector (actor_id, director_id, timestamp) values ('1', '1', '0')
insert into ActorDirector (actor_id, director_id, timestamp) values ('1', '1', '1')
insert into ActorDirector (actor_id, director_id, timestamp) values ('1', '1', '2')
insert into ActorDirector (actor_id, director_id, timestamp) values ('1', '2', '3')
insert into ActorDirector (actor_id, director_id, timestamp) values ('1', '2', '4')
insert into ActorDirector (actor_id, director_id, timestamp) values ('2', '1', '5')
insert into ActorDirector (actor_id, director_id, timestamp) values ('2', '1', '6')
```

```Python
data = [[1, 1, 0], [1, 1, 1], [1, 1, 2], [1, 2, 3], [1, 2, 4], [2, 1, 5], [2, 1, 6]]
ActorDirector = pd.DataFrame(data, columns=['actor_id', 'director_id', 'timestamp']).astype({'actor_id':'int64', 'director_id':'int64', 'timestamp':'int64'})
```

![image](https://github.com/quananhle/Python/assets/35042430/a6143b05-a6f0-4790-994e-ff12dad5c4e2)

---

![image](https://github.com/quananhle/Python/assets/35042430/ddc378c5-30d7-4591-aa7e-9a6d54922a0e)

---

```Python
import pandas as pd

def actors_and_directors(actor_director: pd.DataFrame) -> pd.DataFrame:
    df = actor_director.groupby(['actor_id' , 'director_id']).nunique().reset_index()
    df = df[df['timestamp'] >= 3]
    return df[['actor_id' , 'director_id']]
```

```MySQL
# Write your MySQL query statement below
SELECT actor_id , director_id 
FROM ActorDirector
GROUP BY actor_id , director_id
HAVING COUNT(timestamp) >= 3;
```

