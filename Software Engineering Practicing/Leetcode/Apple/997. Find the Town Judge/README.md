## 997. Find the Town Judge

```Tag```: ```Array``` ```Hash Map``` ```Graph```

#### Difficulty: Easy

In a town, there are ```n``` people labeled from ```1``` to ```n```. There is a rumor that one of these people is secretly the town judge.

If the town judge exists, then:

- The town judge trusts nobody.
- Everybody (except for the town judge) trusts the town judge.

There is exactly one person that satisfies properties 1 and 2.

You are given an array ```trust``` where ```trust[i]``` = $[a_i, b_i]$ representing that the person labeled a<sub>i</sub> trusts the person labeled b<sub>i</sub>.

Return _the label of the town judge if the town judge exists and can be identified_, or return ```-1``` otherwise.

![image](https://github.com/quananhle/Python/assets/35042430/62464300-03ab-469e-ad3f-7995772bebaf)

---

__Example 1:__
```
Input: n = 2, trust = [[1,2]]
Output: 2
```

__Example 2:__
```
Input: n = 3, trust = [[1,3],[2,3]]
Output: 3
```

__Example 3:__
```
Input: n = 3, trust = [[1,3],[2,3],[3,1]]
Output: -1
```

__Constraints:__

- $1 \le n \le 1000$
- $0 \le trust.length \le 10^4$
- $trust[i].length == 2$
- All the pairs of ```trust``` are unique.
- $a_i \neq b_i$
- $1 \le a_i, b_i \le n$

---

### Array

#### Two Arrays

__Time Complexity__: ```O(E)```, with E is the number of edges representing the total of trusts

__Space Complexity__: ```O(N)```, arrays to have up to n people

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

__Time Complexity__: ```O(E)```, with E is the number of edges representing the total of trusts
__Space Complexity__: ```O(N)```, arrays to have up to n people

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

__Time Complexity__: ```O(E)```, with E is the number of edges representing the total of trusts
__Space Complexity__: ```O(N)```, arrays to have up to n people

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

__Time Complexity__: ```O(E)```, with E is the number of edges representing the total of trusts

__Space Complexity__: ```O(N)```, arrays to have up to n people

```Python
class Solution:
    def findJudge(self, n: int, trust: List[List[int]]) -> int:
        # Count the number of people trusted by every one in town
        score = collections.defaultdict(int)

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

### Bonus

Can There Be More Than One Town Judge?

In the problem description, we're told that iff there is a town judge, there'll only be one town judge.

It's likely that not all interviewers would tell you directly that there can only be one town judge. If you asked them whether or not there could be more than one town judge, they might ask you if there could be. And the answer is... it's __impossible__!

If there were two town judges, then they would have to trust each other, otherwise we'd have a town judge not trusted by everybody. But this doesn't work, because town judges aren't supposed to trust anybody. Therefore, we know there can be at most one town judge.

### Graph

```Python
class Solution:
    def findJudge(self, n: int, trust: List[List[int]]) -> int:
        # Directed Graph
        graph = collections.defaultdict()
        for i in range(1, n+1):
            graph[i] = set()

        for a, b in trust:
            graph[a].add(b)

        candidate = list()
        # Search for the only person who has no edge in graph or trusting nobody. It is impossible to have two judges
        for v, e in graph.items():
            if len(e) == 0:
                candidate.append(v)
        
        if len(candidate) == 0:                
            return -1
        else:
            # Search for the person who are being trusted by everyone except himself
            for v, e in graph.items():
                # Check if found the judge
                if candidate[0] == v:
                    continue
                # Check if found someone who does not trust the candidate
                elif not candidate[0] in graph[v]:
                    return -1 
            return candidate[0]
```
