## [2391. Minimum Amount of Time to Collect Garbage](https://leetcode.com/problems/minimum-amount-of-time-to-collect-garbage)

```Tag```: ```Hash Map``` ```Prefix Sum```

#### Difficulty: Medium




---


---

![image](https://leetcode.com/problems/minimum-amount-of-time-to-collect-garbage/Figures/2391/2391A.png)

### Hash Map + Prefix Sun

```Python
class Solution:
    def garbageCollection(self, garbage: List[str], travel: List[int]) -> int:
        ans = 0
        n = len(garbage)
        prefix_sum = [0] * n
        prefix_sum[1] = travel[0]
        for i in range(1, n - 1):
            prefix_sum[i + 1] = prefix_sum[i] + travel[i]

        schedule = collections.defaultdict(int)
        last_house = collections.defaultdict(int)

        for i in range(n):
            for trash in garbage[i]:
                last_house[trash] = i
                schedule[trash] += 1

        garbage_type = "MPG"
        for trash in garbage_type:
            if trash in schedule:
                ans += prefix_sum[last_house[trash]] + schedule[trash]
        
        return ans
```
