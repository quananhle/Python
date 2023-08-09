## [2616. Minimize the Maximum Difference of Pairs](https://leetcode.com/problems/minimize-the-maximum-difference-of-pairs/)

```Tag```: ```Dynamic Programming``` ```Greedy``` ```Binary Search```

#### Difficulty: Medium

You are given a __0-indexed__ integer array ```nums``` and an integer ```p```. Find ```p``` pairs of indices of ```nums``` such that the maximum difference amongst all the pairs is minimized. Also, ensure no index appears more than once amongst the ```p``` pairs.

Note that for a pair of elements at the index ```i``` and ```j```, the difference of this pair is ```|nums[i] - nums[j]|```, where ```|x|``` represents the absolute value of ```x```.

Return _the minimum maximum difference among all ```p``` pairs. We define the maximum of an empty set to be zero.

---

__Example 1__:
```
Input: nums = [10,1,2,7,1,3], p = 2
Output: 1
Explanation: The first pair is formed from the indices 1 and 4, and the second pair is formed from the indices 2 and 5. 
The maximum difference is max(|nums[1] - nums[4]|, |nums[2] - nums[5]|) = max(0, 1) = 1. Therefore, we return 1.
```

__Example 2__:
```
Input: nums = [4,2,1,2], p = 1
Output: 0
Explanation: Let the indices 1 and 3 form a pair. The difference of that pair is |2 - 2| = 0, which is the minimum we can attain.
```

__Constraints__:

- $1 \le nums.length \le 10^{5}$
- $0 \le nums[i] \le 10^{9}$
- $0 \le p \le (nums.length)/2$

---

### The Framework

#### Top-Down Dynamic Programming (Memory Limit Exceeded)

```Python
class Solution:
    def minimizeMax(self, nums: List[int], p: int) -> int:
        n = len(nums)
        nums.sort()

        @lru_cache(maxsize=None)
        def dp(curr, remaining):
            # Base case
            if remaining == 0:
                return 0
            
            if curr >= n - 1:
                return float('inf')
            
            # DP Transition
            return min(dp(curr + 1, remaining), max(nums[curr + 1] - nums[curr], dp(curr + 2, remaining - 1)))
        
        return dp(0, p)
```

---

### Binary Search & Greedy

```Python
class Solution:
    def minimizeMax(self, nums: List[int], p: int) -> int:
        nums.sort()
        n = len(nums)

        # Find the number of valid pairs by greedy approach
        def count_valid_pairs(thresold):
            index = count = 0
            while index < n - 1:
                if nums[index + 1] - nums[index] <= thresold:
                    count += 1
                    index += 1
                index += 1
            return count

        lo, hi = 0, nums[-1] - nums[0]
        while lo < hi:
            mi = lo + (hi - lo) // 2

            # If there are enough pairs, look for a smaller threshold
            if count_valid_pairs(mi) >= p:
                hi = mi
            # Otherwise, look for a larger threshold.
            else:
                lo = mi + 1
            
        return lo
```
