## 918. Maximum Sum Circular Subarray

```Tag```: ```Dynamic Programming```

#### Difficulty: Medium

Given a __circular integer array__ ```nums``` of length ```n```, return _the maximum possible sum of a non-empty __subarray__ of ```nums```_.

A __circular array__ means the end of the array connects to the beginning of the array. Formally, the next element of ```nums[i]``` is ```nums[(i + 1) % n]``` and the previous element of ```nums[i]``` is ```nums[(i - 1 + n) % n]```.

A subarray may only include each element of the fixed buffer ```nums``` at most once. Formally, for a subarray ```nums[i], nums[i + 1], ..., nums[j]```, there does not exist ```i <= k1```, ```k2 <= j``` with ```k1 % n == k2 % n```.

![image](https://user-images.githubusercontent.com/35042430/213271032-6eff7480-2ce8-4c9b-9342-171a81dfa7d7.png)

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
```
n == nums.length
1 <= n <= 3 * 104
-3 * 104 <= nums[i] <= 3 * 104
```

---

![image](https://assets.leetcode.com/users/motorix/image_1538888300.png)

So the max subarray circular sum equals to ```max(the max subarray sum, the total sum - the min subarray sum)```

![image](https://leetcode.com/problems/maximum-sum-circular-subarray/solutions/2868539/Figures/918/918_Maximum_Sum_Circular_Subarray.png)

__Corner case__:

If all numbers are negative, ```maxSum = max(A)``` and ```minSum = sum(A)```. In this case, ```max(maxSum, total - minSum) = 0```, which means the sum of an empty subarray. According to the description,return the ```max(A)```, instead of sum of an empty subarray. So we return the ```maxSum``` to handle this corner case.

### Dynamic Programming
#### Bottom-Up Memoization with 2D Tabulation

```Python
class Solution:
    def maxSubarraySumCircular(self, nums: List[int]) -> int:
        # Bottom-Up Memoization with 2D Tabulation
        #### Time Complexity : O(N), traverse through the input array
        #### Space Complexity: O(N), extra memory space to build memo
        total = sum(nums)
        # A circular array is made of a combination of maximum subarray and minimum subarray
        dp = [[0, 0] for _ in range(len(nums))]
        # Base case: for the first element in nums, the maximum non-empty subarray is nums[0] and the minimum is 0
        dp[0][0], dp[0][1] = nums[0], 0
        res = nums[0]
        for i in range(1, len(nums)):
            # In an array that has at positive number, only care about positive numbers.
            # In an array that has all nevegative number, the maximum subarray is the negative number itself
            dp[i][0] = max(dp[i-1][0] + nums[i], nums[i])
            # In an array that has at positive number, the minimum subarray is the negative number itself.
            # In an array that has all nevegative number, the minimum subarray adds up together
            dp[i][1] = min(dp[i-1][1] + nums[i], nums[i])
            res = max(res, dp[i][0], total - dp[i][1])
        return res
```

#### Bottom-Up Memoization with Optimized Space

```Python
class Solution:
    def maxSubarraySumCircular(self, nums: List[int]) -> int:
        # Bottom-Up Memoization (Optimized Space)
        #### Time Complexity : O(N), traverse through the input array
        #### Space Complexity: O(1), constant memory space for pointers
        total = sum(nums)
        max_subarray = cur_min_subarray = min_subarray = cur_max_subarray = nums[0]
        for num in nums[1:]:
            cur_max_subarray = max(num, cur_max_subarray + num)
            cur_min_subarray = min(num, cur_min_subarray + num)
            max_subarray = max(max_subarray, cur_max_subarray)
            min_subarray = min(min_subarray, cur_min_subarray)
        # Edge case: if all numbers are negative, the maximum subarray is the maximum of the array
        return max(max_subarray, total - min_subarray) if max_subarray > 0 else max_subarray
```
