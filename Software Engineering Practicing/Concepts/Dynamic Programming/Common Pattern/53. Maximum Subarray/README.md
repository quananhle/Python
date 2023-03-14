## [53. Maximum Subarray](https://leetcode.com/problems/maximum-subarray/)

```Tag```: ```Dynamic Programming``` ```Kadane's Algorithm```

#### Difficulty: Medium

Given an integer array ```nums```, find the subarray with the largest sum, and return _its sum_.

![image](https://user-images.githubusercontent.com/35042430/225088213-290ed01b-33af-4b45-815e-3933e69a64af.png)

---

__Example 1:__
```
Input: nums = [-2,1,-3,4,-1,2,1,-5,4]
Output: 6
Explanation: The subarray [4,-1,2,1] has the largest sum 6.
```

__Example 2:__
```
Input: nums = [1]
Output: 1
Explanation: The subarray [1] has the largest sum 1.
```

__Example 3:__
111
Input: nums = [5,4,-1,7,8]
Output: 23
Explanation: The subarray [5,4,-1,7,8] has the largest sum 23.
111

__Constraints:__

- 1 <= ```nums.length``` <= 10<sup>5</sup>
- -10<sup>4</sup> <= ```nums[i]``` <= 10<sup>4</sup>

---

### Brute Force

```Python
class Solution:
    def maxSubArray(self, nums: List[int]) -> int:
        # Brute Force:
        ### Time Limit Exceeded
        n = len(nums)

        ans = -float('inf')

        for start in range(n):
            for end in range(start + 1, n + 1):
                ans = max(ans, sum(nums[start:end]))
        
        return ans
```
```Python
class Solution:
    def maxSubArray(self, nums: List[int]) -> int:
        # Brute Force:
        ### Time Limit Exceeded
        n = len(nums)

        ans = -math.inf

        for i in range(n):
            curr = 0
            for j in range(i, n):
                curr += nums[j]
                ans = max(ans, curr)
        
        return ans
```

### Kadane's Algorithm

```Python
class Solution:
    def maxSubArray(self, nums: List[int]) -> int:
        maxi_subarray = curr_subarray = nums[0]
        for num in nums[1:]:
            curr_subarray = max(num, curr_subarray + num)
            maxi_subarray = max(maxi_subarray, curr_subarray)
        return maxi_subarray
```

---

### The Framework

#### Top-Down Dynamic Programming

```Python
class Solution:
    def maxSubArray(self, nums: List[int]) -> int:
        n = len(nums)

        ans = -float('inf')

        @lru_cache(None)
        def dp(start):
            # Base case
            if start < 0:
                return 0

            # Recurrence relation
            return nums[start] + max(0, dp(start - 1))

        for i in range(len(nums) - 1, -1, -1):
            ans = max(ans, dp(i))

        return ans
```


```Python
class Solution:
    def maxSubArray(self, nums: List[int]) -> int:
        n = len(nums)
        memo = [-float('inf')] * (n + 1)

        def dp(start):
            # Base case
            if start < 0:
                return 0

            if memo[start] != -math.inf:
                return memo[start]

            # Recurrence relation
            memo[start] = nums[start] + max(0, dp(start - 1))
            return memo[start]

        dp(n - 1)
        return max(memo)
```

#### Bottom-Up Dynamic Programming

```Python

```

__Follow up__: If you have figured out the O(n) solution, try coding another solution using the divide and conquer approach, which is more subtle.
