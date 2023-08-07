## [1667. Fix Names in a Table](https://leetcode.com/problems/fix-names-in-a-table)

```Tag```: ```Panda``` ```SQL```

```MySQL
Create table If Not Exists Users (user_id int, name varchar(40))
Truncate table Users
insert into Users (user_id, name) values ('1', 'aLice')
insert into Users (user_id, name) values ('2', 'bOB')
```

```Python
Users = pd.DataFrame([], columns=['user_id', 'name']).astype({'user_id':'Int64', 'name':'object'})
```

![image](https://github.com/quananhle/Python/assets/35042430/dafd5ff5-c93b-4d9e-a8d7-842201a833e4)

---

![image](https://github.com/quananhle/Python/assets/35042430/124ee086-6337-463f-aa42-2c5f53091b9b)

---

```Python
import pandas as pd

def fix_names(users: pd.DataFrame) -> pd.DataFrame:
    users['name'] = users['name'].str[0].str.upper() + users['name'].str[1:].str.lower()
    return users.sort_values('user_id')
```

```Python
import pandas as pd

def fix_names(users: pd.DataFrame) -> pd.DataFrame:
    users["name"] = users["name"].str.title()
    return users.sort_values("user_id")
```

```MySQL
# Write your MySQL query statement below
SELECT user_id, CONCAT(UCASE(LEFT(name,1)), LCASE(SUBSTRING(name, 2))) AS name
FROM Users
ORDER BY user_id
```
