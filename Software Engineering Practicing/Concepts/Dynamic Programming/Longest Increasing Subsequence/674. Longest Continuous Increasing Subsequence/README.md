## 674. Longest Continuous Increasing Subsequence

```Tag```: ```Greedy Algorithms``` ```Sliding Window``` ```Dynamic Programming```

#### Difficulty: Easy

Given an unsorted array of integers ```nums```, return _the length of the longest continuous increasing subsequence (i.e. subarray)_. The subsequence must be strictly increasing.

A continuous increasing subsequence is defined by two indices ```l``` and ```r``` ```(l < r)``` such that it is ```[nums[l], nums[l + 1], ..., nums[r - 1], nums[r]]``` and for each ```l <= i < r```, ```nums[i] < nums[i + 1]```.

![image](https://user-images.githubusercontent.com/35042430/216237286-313de8c1-22a5-448e-907a-1e6772691093.png)

---

__Example 1:__
```
Input: nums = [1,3,5,4,7]
Output: 3
Explanation: The longest continuous increasing subsequence is [1,3,5] with length 3.
Even though [1,3,5,7] is an increasing subsequence, it is not continuous as elements 5 and 7 are separated by element 4.
```

__Example 2:__
```
Input: nums = [2,2,2,2,2]
Output: 1
Explanation: The longest continuous increasing subsequence is [2] with length 1. Note that it must be strictly
increasing.
```

__Constraints:__

- 1 <= ```nums.length``` <= 10<sup>4</sup>
- -10<sup>9</sup> <= ```nums[i]``` <= 10<sup>9</sup>

---

### Greedy Algorithms

```Python
class Solution:
    def findLengthOfLCIS(self, nums: List[int]) -> int:
        # Greedy Algorithms
        if len(nums) == 1:
            return len(nums)
        count = 1
        ans = 0
        pivot = nums[0]
        for i in range(1, len(nums)):
            if nums[i] <= pivot:
                count = 1
            else:
                count += 1
            pivot = nums[i]
            ans = max(ans, count)
        return ans
```

### Sliding Window

```Python
class Solution:
    def findLengthOfLCIS(self, nums: List[int]) -> int:
        # Sliding windows
        if len(nums) == 1:
            return len(nums)
        ans = pivot = 0
        for i in range(1, len(nums)):
            if nums[i-1] >= nums[i]:
                pivot = i
            ans = max(ans, i - pivot + 1)
        return ans
```

### Dynamic Programming

```Python
class Solution:
    def findLengthOfLCIS(self, nums: List[int]) -> int:
        # Dynamic Programming
        n = len(nums)
        dp = [1] * n
        for i in range(1, len(nums)):
            if nums[i-1] < nums[i]:
                dp[i] += dp[i-1]
        return max(dp)
```
