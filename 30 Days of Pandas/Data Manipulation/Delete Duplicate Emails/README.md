## [196. Delete Duplicate Emails](https://leetcode.com/problems/delete-duplicate-emails/)

```Tag```: ```SQL``` ```Pandas```

#### Difficulty: Easy

```MySQL
Create table If Not Exists Person (Id int, Email varchar(255))
Truncate table Person
insert into Person (id, email) values ('1', 'john@example.com')
insert into Person (id, email) values ('2', 'bob@example.com')
insert into Person (id, email) values ('3', 'john@example.com')
```

```Python
data = [[1, 'john@example.com'], [2, 'bob@example.com'], [3, 'john@example.com']]
Person = pd.DataFrame(data, columns=['id', 'email']).astype({'id':'int64', 'email':'object'})
```

![image](https://github.com/quananhle/Python/assets/35042430/3f72b8c9-8001-47eb-a3c4-08fca3bbbab7)

---

![image](https://github.com/quananhle/Python/assets/35042430/6bed0a33-05ee-4990-bde3-3d400644d7eb)

---

![image](https://github.com/quananhle/Python/assets/35042430/11b55f7e-83b4-4260-97d9-2b4da0e7fdab)

---

```Python
import pandas as pd

# Modify Person in place
def delete_duplicate_emails(person: pd.DataFrame) -> None:
    min_id = person.groupby('email')['id'].transform('min')
    removed_person = person[person['id'] != min_id]
    person.drop(removed_person.index, inplace=True)
    return
```

```MySQL
# Please write a DELETE statement and DO NOT write a SELECT statement.
# Write your MySQL query statement below
DELETE p1 FROM person p1, person p2
WHERE p1.email = p2.email AND p1.id > p2.id
```
