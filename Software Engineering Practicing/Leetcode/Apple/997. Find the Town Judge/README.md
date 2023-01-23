## 997. Find the Town Judge

```Tag```: ```Array``` ```Hash Map``` ```Graph```

#### Difficulty: Easy

![image](https://user-images.githubusercontent.com/35042430/213986662-f76a8197-0abf-4e36-9eec-ab93adf823b5.png)

---

### Array

#### Two Arrays

```Python
class Solution:
    def findJudge(self, n: int, trust: List[List[int]]) -> int:
        # Count the number of people trusted by every one in town
        trusting = [0] * (n + 1)
        trusted = [0] * (n + 1)

        for a, b in trust:
            trusting[a] += 1
            trusted[b] += 1
            
        # Check from person 1 to person n
        for person in range(1, n+1):
            # Check if there exists a person p who does not trust anyone and trusted by n - 1 people
            if trusting[person] == 0 and trusted[person] == n - 1:
                return person
        else:
            return -1
```

#### One Array

Build a score system, with the result of ```(indegree - outdegree)``` for each person. In other words, we'll ```+1``` to their "score" for each person they are trusted by, and ```-1``` from their "score" for each person they trust. Therefore, for a person to maximize their "score", they should be trusted by as many people as possible, and trust as few people as possible.

```Python
class Solution:
    def findJudge(self, n: int, trust: List[List[int]]) -> int:
        # Count the number of people trusted by every one in town
        score = [0] * (n + 1)

        # People with the highest score of all is the one who is trusting nobody and being trusted by everyone except himself 
        for a, b in trust:
            score[a] -= 1
            score[b] += 1
        
        # Check from person 1 to person n
        for person in range(1, n+1):
            # Check if there exists an exact one person who gets a scores of n - 1
            if score[person] == n - 1:
                return person
        else:
            return -1
```

### Hash Map

#### Two Hash Maps

```Python
class Solution:
    def findJudge(self, n: int, trust: List[List[int]]) -> int:
        # Count the number of people trusted by every one in town
        trusting = collections.defaultdict(int)
        being_trusted = collections.defaultdict(int)
        for a, b in trust:
            trusting[a] += 1
            being_trusted[b] += 1

        # Check from person 1 to person n
        for person in range(1, n+1):
            # Check if there exists a person p who does not trust anyone and trusted by everyone
            if trusting[person] == 0 and being_trusted[person] == n-1:
                return person
        return -1
```

#### One Hash Map

```Python

```
