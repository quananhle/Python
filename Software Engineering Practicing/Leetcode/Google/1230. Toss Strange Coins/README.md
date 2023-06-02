## [1230. Toss Strange Coins](https://leetcode.com/problems/toss-strange-coins/)

```Tag```: ```Dynamic Programming```

#### Difficulty: Medium

You have some coins.  The ```i```-th coin has a probability ```prob[i]``` of facing heads when tossed.

Return _the probability that the number of coins facing heads equals ```target``` if you toss every coin exactly once_.

![image](https://github.com/quananhle/Python/assets/35042430/6e57107e-d7ae-4d3f-99af-bb4f799fdc9d)

---

__Example 1:__
```
Input: prob = [0.4], target = 1
Output: 0.40000
```

__Example 2:__
```
Input: prob = [0.5,0.5,0.5,0.5,0.5], target = 0
Output: 0.03125
```

__Constraints:__

- ```1 <= prob.length <= 1000```
- ```0 <= prob[i] <= 1```
- ```0 <= target <= prob.length```
- Answers will be accepted as correct if they are within ```10^-5``` of the correct answer.

---

![image](https://github.com/quananhle/Python/assets/35042430/5228e59b-2dbf-4722-9e28-d392f33ae5df)

### The Framework

#### Top-Down Dynamic Programming

![image](https://github.com/quananhle/Python/assets/35042430/de4e9dcd-76cd-4ea3-beaf-ca1d2fe2caca)

```Python
class Solution:
    def probabilityOfHeads(self, prob: List[float], target: int) -> float:
        n = len(prob)
        memo = collections.defaultdict(int)

        def dp(curr, head):
            # Base case
            if head > target:
                return 0

            if curr == n:
                if head == target:
                    return 1
                return 0

            if (curr, head) in memo:
                return memo[(curr, head)]

            probability = prob[curr]
            # Recurrence relation: coin facing heads or coin not facing heads
            heads = dp(curr + 1, head + 1) * probability 
            tails = dp(curr + 1, head) * (1 - probability)
            memo[(curr, head)] = heads + tails
            return memo[(curr, head)]

        return dp(0, 0)
```

```Python
class Solution:
    def probabilityOfHeads(self, prob: List[float], target: int) -> float:
        n = len(prob)

        @lru_cache(None)
        def dp(curr, head):
            # Base case
            if head > target:
                return 0

            if curr == n:
                if head == target:
                    return 1
                return 0

            probability = prob[curr]
            # Recurrence relation: coin facing heads or coin not facing heads
            heads = dp(curr + 1, head + 1) * probability 
            tails = dp(curr + 1, head) * (1 - probability)
            ans = heads + tails
            return ans

        return dp(0, 0)
```

#### Bottom-Up Dynamic Programming

```Python

```
