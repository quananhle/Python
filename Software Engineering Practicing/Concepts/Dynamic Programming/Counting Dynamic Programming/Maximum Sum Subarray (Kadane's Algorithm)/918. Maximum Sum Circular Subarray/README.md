## 918. Maximum Sum Circular Subarray

```Tag```: ```Kadane's Algorithm``` ```Dynamic Programming``` ```Math``` ```Prefix Sum```

#### Difficulty: Medium

Given a circular integer array ```nums``` of length ```n```, return _the maximum possible sum of a non-empty __subarray__ of ```nums```_.

A __circular array__ means the end of the array connects to the beginning of the array. Formally, the next element of ```nums[i]``` is ```nums[(i + 1) % n]``` and the previous element of ```nums[i]``` is ```nums[(i - 1 + n) % n]```.

A subarray may only include each element of the fixed buffer ```nums``` at most once. Formally, for a subarray ```nums[i], nums[i + 1], ..., nums[j]```, there does not exist ```i <= k1```, ```k2 <= j``` with ```k1 % n == k2 % n```.

![image](https://user-images.githubusercontent.com/35042430/220442598-b5cfc7ef-d21e-4184-aaf0-cedb431aa0ee.png)

---

__Example 1:__
```
Input: nums = [1,-2,3,-2]
Output: 3
Explanation: Subarray [3] has maximum sum 3.
```

__Example 2:__
```
Input: nums = [5,-3,5]
Output: 10
Explanation: Subarray [5,5] has maximum sum 5 + 5 = 10.
```

__Example 3:__
```
Input: nums = [-3,-2,-3]
Output: -2
Explanation: Subarray [-2] has maximum sum -2.
```

__Constraints:__

- ```n == nums.length```
- ```1 <= n <= 3 * 10^4```
- ```-3 * 10^4 <= nums[i] <= 3 * 10^4```

---

![image](https://assets.leetcode.com/users/brianchiang_tw/image_1589539736.png)

### Kadane's Algorithm

The maximum "normal sum" is the __Maximum Subarray problem__ which can be found with Kadane's. As such, we can focus on finding the __"special sum"__.

Instead of thinking about the "special sum" as the sum of a prefix and a suffix, we can think about it as the sum of all elements, minus a subarray in the middle. In this case, we want to minimize this middle subarray's sum, which we can calculate using Kadane's algorithm as well.

![image](https://leetcode.com/problems/maximum-sum-circular-subarray/solutions/2868539/Figures/918/918_Maximum_Sum_Circular_Subarray.png)

#### Bottom-Up Dynamic Programming (Tabulation)

```Python
class Solution:
    def maxSubarraySumCircular(self, nums: List[int]) -> int:
        n = len(nums)
        total = sum(nums)
        # A circular array is made of a combination of maximum subarray and minimum subarray
        dp = [[0, 0] for _ in range(n + 1)]

        # Base case: for the first element in nums, the maximum non-empty subarray is nums[0] and the minimum is 0
        dp[0][0], dp[0][1] = nums[0], 0
        ans = nums[0]

        for i in range(1, n):
            # Recurrence relation: maximize the normal sum and minimize the special sum
            # Maximum subarray
            dp[i][0] = max(dp[i - 1][0] + nums[i], nums[i])
            # Minimum subarray
            dp[i][1] = min(dp[i - 1][1] + nums[i], nums[i])
            ans = max(ans, dp[i][0], total - dp[i][1])
        return ans
```

![image](https://leetcode.com/problems/maximum-sum-circular-subarray/solutions/2868539/Figures/918/918_Maximum_Sum_Circular_Subarray.png)

#### Constant Space Bottom-Up Dynamic Programming

```Python
class Solution:
    def maxSubarraySumCircular(self, nums: List[int]) -> int:
        # Bottom-Up Memoization (Space optimized)
        #### Time Complexity : O(N), traverse through the input array
        #### Space Complexity: O(1), constant memory space for pointers
        total = sum(nums)
        maximum_subarray = minimum_subarray = cur_max_subarray = cur_min_subarray = nums[0]
        for num in nums[1:]:
            cur_max_subarray = max(num, cur_max_subarray + num)
            maximum_subarray = max(maximum_subarray, cur_max_subarray)
            cur_min_subarray = min(num, cur_min_subarray + num)
            minimum_subarray = min(minimum_subarray, cur_min_subarray)
        # Edge case: if all numbers are negative, the maximum subarray is the maximum of the array
        return max(maximum_subarray, total - minimum_subarray) if maximum_subarray > 0 else maximum_subarray
```
