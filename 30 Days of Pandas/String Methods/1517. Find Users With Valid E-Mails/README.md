## [1517. Find Users With Valid E-Mails](https://leetcode.com/problems/find-users-with-valid-e-mails/)

```Tag```: ```SQL``` ```Pandas``` ```Regular Expression```

#### Difficulty: Easy

```MySQL
Create table If Not Exists Users (user_id int, name varchar(30), mail varchar(50))
Truncate table Users
insert into Users (user_id, name, mail) values ('1', 'Winston', 'winston@leetcode.com')
insert into Users (user_id, name, mail) values ('2', 'Jonathan', 'jonathanisgreat')
insert into Users (user_id, name, mail) values ('3', 'Annabelle', 'bella-@leetcode.com')
insert into Users (user_id, name, mail) values ('4', 'Sally', 'sally.come@leetcode.com')
insert into Users (user_id, name, mail) values ('5', 'Marwan', 'quarz#2020@leetcode.com')
insert into Users (user_id, name, mail) values ('6', 'David', 'david69@gmail.com')
insert into Users (user_id, name, mail) values ('7', 'Shapiro', '.shapo@leetcode.com')
```

```Python
data = [[1, 'Winston', 'winston@leetcode.com'], [2, 'Jonathan', 'jonathanisgreat'], [3, 'Annabelle', 'bella-@leetcode.com'], [4, 'Sally', 'sally.come@leetcode.com'], [5, 'Marwan', 'quarz#2020@leetcode.com'], [6, 'David', 'david69@gmail.com'], [7, 'Shapiro', '.shapo@leetcode.com']]
Users = pd.DataFrame(data, columns=['user_id', 'name', 'mail']).astype({'user_id':'int64', 'name':'object', 'mail':'object'})
```

![image](https://github.com/quananhle/Python/assets/35042430/e71451bc-d471-47c9-a039-04e571c76012)

---

![image](https://github.com/quananhle/Python/assets/35042430/6ca456cc-4318-43f6-a108-671ee2eac982)

---

### Regular Expression

A valid e-mail has a prefix name and a domain where:

- The prefix name is a string that may contain letters (upper or lower case), digits, underscore ```'_'```, period ```'.'```, and/or dash ```'-'```. The prefix name must start with a letter.
- The domain is ```'@leetcode.com'```.

__Intuition__

In general, if you are asked to match a string, writing a regular expression pattern to match on should come first to mind.

RegEx provides various functionality, here are a few relevant ones:

```^```: This represents the start of a string or line.

```[a-z]```: This represents a character range, matching any character from ```a``` to ```z```.

```[0-9]```: This represents a character range, matching any character from ```0``` to ```9```.

```[a-zA-Z]```: This variant matches any character from ```a``` to z or ```A``` to ```Z```. Note that there is __no limit__ to the number of character ranges you can specify inside the square brackets -- you can add additional characters or ranges you want to match.

```[^a-z]```: This variant matches any character that is not from ```a``` to ```z```. Note that the ```^``` character is used to negate the character range, which means it has a different meaning inside the square brackets than outside where it means the start.

```[a-z]*```: This represents a character range, matching any character from ```a``` to ```z``` zero or more times.

```[a-z]+```: This represents a character range, matching any character from ```a``` to ```z``` one or more times.

```.```: This matches exactly one of any character.

```\.```: This represents a period character. Note that the backslash is used to escape the period character, as the period character has a special meaning in regular expressions. Also note that in many languages, you need to escape the backslash itself, so you need to use ```\\.```.

```$```: This represents the end of a string or line.

The key idea here is to separate the first character of the name column from the rest, change their cases accordingly, and then join them back together.

```Python
import pandas as pd

def valid_emails(users: pd.DataFrame) -> pd.DataFrame:
    df = users[users["mail"].str.match(r"^[a-zA-Z][a-zA-Z0-9_.-]*\@leetcode\.com$")]
    return df
```

```MySQL
# Write your MySQL query statement below
SELECT * FROM users WHERE mail REGEXP '^[a-zA-Z][a-zA-Z0-9_.-]*\\@leetcode\\.com$';
```
