## [403. Frog Jump](https://leetcode.com/problems/frog-jump)

```Tag```: ```Dynamic Programming```

#### Difficulty: Hard

A frog is crossing a river. The river is divided into some number of units, and at each unit, there may or may not exist a stone. The frog can jump on a stone, but it must not jump into the water.

Given a list of ```stones```' positions (in units) in sorted ascending order, determine if the frog can cross the river by landing on the last stone. Initially, the frog is on the first stone and assumes the first jump must be ```1``` unit.

If the frog's last jump was ```k``` units, its next jump must be either ```k - 1```, ```k```, or ```k + 1``` units. The frog can only jump in the forward direction.

![image](https://github.com/quananhle/Python/assets/35042430/28de727a-a5cb-45e3-91b2-c41a62074a85)

---

__Example 1__:
```
Input: stones = [0,1,3,5,6,8,12,17]
Output: true
Explanation: The frog can jump to the last stone by jumping 1 unit to the 2nd stone, then 2 units to the 3rd stone, then 2 units to the 4th stone, then 3 units to the 6th stone, 4 units to the 7th stone, and 5 units to the 8th stone.
```

__Example 2__:
```
Input: stones = [0,1,2,3,4,8,9,11]
Output: false
Explanation: There is no way to jump to the last stone as the gap between the 5th and 6th stone is too large.
```

__Constraints__:

- $2 \le stones.length \le 2000$
- $0 \le stones[i] \le 2^{31} - 1$
- $stones[0] == 0$
- ```stones``` is sorted in a strictly increasing order.

---

### The Framework

#### Top-Down Dynamic Programming

![image](https://github.com/quananhle/Python/assets/35042430/ead430b6-90a4-4d8a-af52-1aeb8d365b5f)

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N^{2})$
- __Space Complexity__: $\mathcal{O}(N^{2})$

```Python
class Solution:
    def canCross(self, stones: List[int]) -> bool:
        n = len(stones)

        if stones[1] > 1: 
            return False

        steps = {stone:i for i, stone in enumerate(stones)}
        memo = collections.defaultdict(bool)

        def dp(i, k):
            # Base case
            if i == n - 1:
                return True

            if (i, k) in memo:
                return memo[(i, k)]
            # DP Transitions: is the next stone possible to jump in k - 1, k, k + 1 units?
            memo[(i, k)] = False

            for step in range(k - 1, k + 2):
                if stones[i] + step in steps and steps[stones[i] + step] > i:
                    memo[(i, k)] = memo[(i, k)] or dp(steps[stones[i] + step], step)

            return memo[(i, k)]
    
        return dp(1, 1)
```

```Python
class Solution:
    def canCross(self, stones: List[int]) -> bool:
        stone_set = set(stones)
        memo = collections.defaultdict(bool)

        def dp(stone, k):
            if (stone, k) in memo:
                return memo[(stone, k)]

            if stone in stones:
                # Base case
                if stone == stones[-1]:
                    memo[(stone, k)] = True
                    return True
                
                # DP Transitions
                for next_leap in range(max(1, k - 1), k + 2):
                    if dp(stone + next_leap, next_leap):
                        memo[(stone, k)] = True
                        return True
            
            memo[(stone, k)] = False
            return False
        
        return dp(0, 0)
```

```Python
class Solution:
    def canCross(self, stones: List[int]) -> bool:
        n = len(stones)

        if stones[1] > 1: 
            return False 	

        steps = {stone:i for i, stone in enumerate(stones)}

        @lru_cache(maxsize=None)
        def dp(i, k):
            # Base case
            if i == n - 1:
                return True

            # DP Transitions: is the next stone possible to jump in k - 1, k, k + 1 units?
            ans = False

            for step in range(k - 1, k + 2):
                if stones[i] + step in steps and steps[stones[i] + step] > i:
                    ans = ans or dp(steps[stones[i] + step], step)

            return ans
    
        return dp(1, 1)
```

```Python
class Solution:
    def canCross(self, stones: List[int]) -> bool:
        stone_set = set(stones)

        @lru_cache(maxsize=None)
        def dp(stone, k):
            if stone in stones:
                # Base case
                if stone == stones[-1]:
                    return True
                
                # DP Transitions
                for next_leap in range(max(1, k - 1), k + 2):
                    if dp(stone + next_leap, next_leap):
                        return True
                
            return False
        
        return dp(0, 0)
```

#### Bottom-Up Dynamic Programming

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N^{2})$
- __Space Complexity__: $\mathcal{O}(N^{2})$

```Python
class Solution:
    def canCross(self, stones: List[int]) -> bool:
        n = len(stones)
        dp = [[None] * (n + 1) for _ in range(n + 1)]
        steps = {stone:i for i, stone in enumerate(stones)}

        dp[0][0] = True

        for i in range(n):
            for k in range(n + 1):
                if dp[i][k]:
                    if (stones[i] + k) in steps:
                        dp[steps.get(stones[i] + k)][k] = True
                    
                    if (stones[i] + k + 1) in steps:
                        dp[steps.get(stones[i] + k + 1)][k + 1] = True
                    
                    if (stones[i] + k - 1) in steps:
                        dp[steps.get(stones[i] + k - 1)][k - 1] = True
                    
        for i in range(n + 1):
            if dp[n - 1][i]:
                return True
            
        return False
```
