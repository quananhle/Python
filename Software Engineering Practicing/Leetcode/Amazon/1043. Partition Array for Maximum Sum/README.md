## [1043. Partition Array for Maximum Sum](https://leetcode.com/problems/partition-array-for-maximum-sum)

```Tag```: ```Dynamic Programming```

#### Difficulty: Medium

Given an integer array ```arr```, partition the array into (contiguous) subarrays of length at most ```k```. After partitioning, each subarray has their values changed to become the maximum value of that subarray.

Return _the largest sum of the given array after partitioning_. Test cases are generated so that the answer fits in a 32-bit integer.

![image](https://github.com/quananhle/Python/assets/35042430/6c52e239-3d8f-48ad-9424-81432148777f)

---

__Example 1:__
```
Input: arr = [1,15,7,9,2,5,10], k = 3
Output: 84
Explanation: arr becomes [15,15,15,9,10,10,10]
```

__Example 2:__
```
Input: arr = [1,4,1,5,7,3,6,1,9,9,3], k = 4
Output: 83
```

__Example 3:__
```
Input: arr = [1], k = 1
Output: 1
```

__Constraints:__

- $1 \le arr.length \le 500$
- $0 \le arr[i] \le 10^9$
- $1 \le k \le arr.length$

---

### Dynamic Programming Framework

#### Top-Down Dynamic Programming

```Python

```

```Python
class Solution:
    def maxSumAfterPartitioning(self, arr: List[int], k: int) -> int:
        n = len(arr)

        @functools.lru_cache(maxsize=None)
        def dp(start):
            # Base case
            if start >= n:
                return 0
            
            curr_max = ans = 0
            for curr in range(start, min(start + k, n)):
                curr_max = max(curr_max, arr[curr])
                ans = max(ans, curr_max * (curr - start + 1) + dp(curr + 1))
            
            return ans

        return dp(0)
```

#### Bottom-Up Dynamic Programming

```Python
class Solution:
    def maxSumAfterPartitioning(self, arr: List[int], k: int) -> int:
        n = len(arr)
        # Base case
        if n == k:
            return max(arr) * n
        
        dp = collections.defaultdict(int)

        for start in range(n - 1, -1, -1):
            curr_max = 0
            for curr in range(start, min(n, start + k)):
                curr_max = max(curr_max, arr[curr])
                dp[start] = max(dp[start], curr_max * (curr - start + 1) + dp[curr + 1])
        
        return dp[0]
```

```Python

```
