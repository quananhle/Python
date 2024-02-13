## [368. Largest Divisible Subset](https://leetcode.com/problems/largest-divisible-subset)

```Tag```: ```Dynamic Programming```

#### Difficulty: Medium

Given a set of distinct positive integers ```nums```, return _the largest subset answer such that every pair ```(answer[i], answer[j])``` of elements in this subset satisfies_:

- $answer[i] % answer[j] == 0$, or
- $answer[j] % answer[i] == 0$

If there are multiple solutions, return _any of them_.

![image](https://github.com/quananhle/Python/assets/35042430/b321b61f-97a0-4248-8f21-d26b772d7431)

---

__Example 1:__
```
Input: n = 12
Output: 3
Explanation: 12 = 4 + 4 + 4.
```

__Example 2:__
```
Input: n = 13
Output: 2
Explanation: 13 = 4 + 9.
```

__Constraints:__

- $1 \le n \le 10^4$

---

### Dynamic Programming Framework

#### Top-Down Dynamic Programming

![image](https://leetcode.com/problems/largest-divisible-subset/Figures/368/368_recursion_memoization.png)

```Python
class Solution:
    def largestDivisibleSubset(self, nums: List[int]) -> List[int]:
        if len(nums) == 0:
            return []

        nums.sort()
        n = len(nums)

        @functools.lru_cache(maxsize=None)
        def dp(curr):
            tail = nums[curr]
            res = list()

            for i in range(0, curr):
                if tail % nums[i] == 0:
                    subset = dp(i)
                    if len(res) < len(subset):
                        res = subset
                    
            res = res.copy()
            res.append(tail)
            
            return res

        return max([dp(curr) for curr in range(n)], key=len)
```

#### Bottom-Up Dynamic Programming

![image](https://leetcode.com/problems/largest-divisible-subset/Figures/368/368_dp.png)

```Python
class Solution:
    def largestDivisibleSubset(self, nums: List[int]) -> List[int]:
        subsets = {-1: set()}

        for num in sorted(nums):
            subsets[num] = max([subsets[k] for k in subsets if num % k == 0 or k % num == 0], key=len) | {num}
        
        return max(subsets.values(), key=len)
```

