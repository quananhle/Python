## [1148. Article Views I](https://leetcode.com/problems/article-views-i)

```Tag```: ```SQL``` ```Pandas```

```SQL
Create table If Not Exists Views (article_id int, author_id int, viewer_id int, view_date date)
Truncate table Views
insert into Views (article_id, author_id, viewer_id, view_date) values ('1', '3', '5', '2019-08-01')
insert into Views (article_id, author_id, viewer_id, view_date) values ('1', '3', '6', '2019-08-02')
insert into Views (article_id, author_id, viewer_id, view_date) values ('2', '7', '7', '2019-08-01')
insert into Views (article_id, author_id, viewer_id, view_date) values ('2', '7', '6', '2019-08-02')
insert into Views (article_id, author_id, viewer_id, view_date) values ('4', '7', '1', '2019-07-22')
insert into Views (article_id, author_id, viewer_id, view_date) values ('3', '4', '4', '2019-07-21')
insert into Views (article_id, author_id, viewer_id, view_date) values ('3', '4', '4', '2019-07-21')

```

```Python
Views = pd.DataFrame([], columns=['article_id', 'author_id', 'viewer_id', 'view_date']).astype({'article_id':'Int64', 'author_id':'Int64', 'viewer_id':'Int64', 'view_date':'datetime64[ns]'})
```

![image](https://github.com/quananhle/Python/assets/35042430/e75440a0-a9af-4240-bcad-163042efcb77)

---

```MySQL
# Write your MySQL query statement below
SELECT DISTINCT author_id AS id FROM Views WHERE author_id = viewer_id ORDER BY id;
```

```Python
import pandas as pd

def article_views(views: pd.DataFrame) -> pd.DataFrame:
    df = views[views['author_id'] == views['viewer_id']]
    df.drop_duplicates(subset=['author_id'], inplace=True)
    df.sort_values(by=['author_id'], inplace=True)
    return df[['author_id']].rename(columns={'author_id': 'id'})
```
