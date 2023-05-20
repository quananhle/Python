## [643. Maximum Average Subarray I](https://leetcode.com/problems/maximum-average-subarray-i)

```Tag```: ```Sliding Window```

#### Difficulty: Easy

You are given an integer array ```nums``` consisting of ```n``` elements, and an integer ```k```.

Find a contiguous subarray whose length is equal to ```k``` that has the maximum average value and return this value. Any answer with a calculation error less than 10<sup>-5</sup> will be accepted.

![image](https://github.com/quananhle/Python/assets/35042430/75b38bba-1534-4ecf-885c-360ea8a21af0)

---

__Example 1:__
```
Input: nums = [1,12,-5,-6,50,3], k = 4
Output: 12.75000
Explanation: Maximum average is (12 - 5 - 6 + 50) / 4 = 51 / 4 = 12.75
```

__Example 2:__
```
Input: nums = [5], k = 1
Output: 5.00000
```

__Constraints:__

- ```n == nums.length```
- 1 <= ```k``` <= ```n``` <= 10<sup>-5</sup>
- -10<sup>4</sup> <= ```nums[i]``` <= 10<sup>4</sup>

---

### Sliding Window

```Python
class Solution:
    def findMaxAverage(self, nums: List[int], k: int) -> float:
        # Time Limit Exceeded
        ans = float('-inf')
        n = len(nums)

        if n <= k:
            return sum(nums) / k

        for end in range(k, n + 1):
            start = end - k
            ans = max(ans, sum(nums[start:end]) / k)

        return ans
```
