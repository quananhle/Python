## [377. Combination Sum IV](https://leetcode.com/problems/combination-sum-iv)

```Tag```: ```Dynamic Programming``` 

#### Difficulty: Medium

Given an array of distinct integers ```nums``` and a target integer ```target```, return _the number of possible combinations that add up to ```target```_.

The test cases are generated so that the answer can fit in a 32-bit integer.

![image](https://github.com/quananhle/Python/assets/35042430/eb6736c4-ce53-4dcc-a03e-e51983f0d399)

---

__Example 1:__
```
Input: nums = [1,2,3], target = 4
Output: 7
Explanation:
The possible combination ways are:
(1, 1, 1, 1)
(1, 1, 2)
(1, 2, 1)
(1, 3)
(2, 1, 1)
(2, 2)
(3, 1)
Note that different sequences are counted as different combinations.
```

__Example 2:__
```
Input: nums = [9], target = 3
Output: 0
```

__Constraints:__

- $1 \le nums.length \le 200$
- $1 \le nums[i] \le 1000$
- All the elements of ```nums``` are unique.
- $1 \le target \le 1000$
 
__Follow up__: What if negative numbers are allowed in the given array? How does it change the problem? What limitation we need to add to the question to allow negative numbers?

---

### The Framework

#### Top-Down Dynamic Programming

```Python
class Solution:
    def combinationSum4(self, nums: List[int], target: int) -> int:
        res = list()
        n = len(nums)

        @functools.lru_cache(maxsize=None)
        def dp(remain):
            # Base case
            if remain == 0:
                return 1
            
            ans = 0
            for num in nums:
                if remain - num >= 0:
                    ans += dp(remain - num)
            
            return ans
        
        return dp(target)
```
