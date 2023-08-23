## [586. Customer Placing the Largest Number of Orders](https://leetcode.com/problems/customer-placing-the-largest-number-of-orders)

```Tag```: ```SQL``` ```Pandas```

#### Difficulty: Easy

![image](https://github.com/quananhle/Python/assets/35042430/b3b92337-3ba9-4f53-a60b-9022dd7709f3)

```SQL
Create table If Not Exists Courses (student varchar(255), class varchar(255))
Truncate table Courses
insert into Courses (student, class) values ('A', 'Math')
insert into Courses (student, class) values ('B', 'English')
insert into Courses (student, class) values ('C', 'Math')
insert into Courses (student, class) values ('D', 'Biology')
insert into Courses (student, class) values ('E', 'Math')
insert into Courses (student, class) values ('F', 'Computer')
insert into Courses (student, class) values ('G', 'Math')
insert into Courses (student, class) values ('H', 'Math')
insert into Courses (student, class) values ('I', 'Math')
```

```Python
data = [['A', 'Math'], ['B', 'English'], ['C', 'Math'], ['D', 'Biology'], ['E', 'Math'], ['F', 'Computer'], ['G', 'Math'], ['H', 'Math'], ['I', 'Math']]
Courses = pd.DataFrame(data, columns=['student', 'class']).astype({'student':'object', 'class':'object'})
```

![image](https://github.com/quananhle/Python/assets/35042430/827dcdb1-5e2e-4e48-a236-b33230f6f4cd)

---

![image](https://github.com/quananhle/Python/assets/35042430/a050c9fa-4258-404e-9325-34d5bff577f8)

---

```Python
import pandas as pd

def find_classes(courses: pd.DataFrame) -> pd.DataFrame:
    df = courses.groupby('class')['student'].size().reset_index(name='count')
    df = df[(df['count'] >= 5)]
    return df[['class']]
```

```MySQL
# Write your MySQL query statement below
# Write your MySQL query statement below
SELECT class FROM courses 
GROUP BY class HAVING COUNT(class) >= 5;
```

