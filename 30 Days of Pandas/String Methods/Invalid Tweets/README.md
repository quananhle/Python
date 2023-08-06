## [1683. Invalid Tweets](https://leetcode.com/problems/invalid-tweets/)

```Tag```: 


---

---

```Python
import pandas as pd

def invalid_tweets(tweets: pd.DataFrame) -> pd.DataFrame:
    df = tweets[tweets['content'].str.len() > 15]
    return df[['tweet_id']]
```

```MySQL
# Write your MySQL query statement below
SELECT tweet_id FROM Tweets WHERE LENGTH(content) > 15;
```
