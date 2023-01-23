## 997. Find the Town Judge


---

### Hash Map

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
