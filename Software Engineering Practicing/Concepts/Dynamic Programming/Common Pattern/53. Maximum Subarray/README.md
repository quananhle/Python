## [53. Maximum Subarray](https://leetcode.com/problems/maximum-subarray/)

```Tag```: ```Dynamic Programming``` ```Kadane's Algorithm``` ```Divide & Conquer```

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
class Solution:
    def maxSubArray(self, nums: List[int]) -> int:
        n = len(nums)
        dp = [-float('inf')] * (n + 1)

        for start in range(n - 1, -1, -1):
            dp[start] = nums[start] + max(0, dp[start + 1])

        return max(dp)
```

```Python
class Solution:
    def maxSubArray(self, nums: List[int]) -> int:
        n = len(nums)
        dp = [-float('inf')] * (n + 1)

        for start in range(n):
            dp[start] = nums[start] + max(0, dp[start - 1])

        return max(dp)
```

```Python
class Solution:
    def maxSubArray(self, nums: List[int]) -> int:
        dp = [0] * len(nums)
        dp[0] = nums[0]
        for i in range(1, len(nums)):
            dp[i] = max(dp[i-1] + nums[i], nums[i])
        return max(dp)
```

__Follow up__: If you have figured out the O(n) solution, try coding another solution using the divide and conquer approach, which is more subtle.

### Divide & Conquer

```Python
class Solution:
    def maxSubArray(self, nums: List[int]) -> int:
        def maxSubArray(left, right):
            if left > right: 
                return -math.inf

            mid = left + (right - left) // 2
            left_sum, right_sum, curr_sum = 0, 0, 0

            for i in range(mid - 1, left - 1, -1):
                '''
                left_sum = max(left_sum, cur_sum := cur_sum + A[i])
                '''
                curr_sum += nums[i]
                left_sum = max(left_sum, curr_sum)

            curr_sum = 0

            for i in range(mid + 1, right + 1):
                '''
                right_sum = max(right_sum, cur_sum := cur_sum + A[i])
                '''
                curr_sum += nums[i]
                right_sum = max(right_sum, curr_sum)           
     
            return max(maxSubArray(left, mid - 1), maxSubArray(mid + 1, right), left_sum + nums[mid] + right_sum)

        return maxSubArray(0, len(nums)-1)
```

### Precomputed

```Python
class Solution:
    def maxSubArray(self, nums: List[int]) -> int:
        '''
        prefix, suffix = [*nums], [*nums]
        '''
        prefix, suffix = nums.copy(), nums.copy()

        for i in range(1, len(nums)):       
            prefix[i] += max(0, prefix[i - 1])

        for i in range(len(nums) - 2, -1, -1):
            suffix[i] += max(0, suffix[i + 1])

        def maxSubArray(left, right):
            if left == right: 
                return nums[left]
            mid = left + (right - left) // 2
            return max(maxSubArray(left, mid), maxSubArray(mid + 1, right), prefix[mid] + suffix[mid + 1])

        return maxSubArray(0, len(nums) - 1)
```
