## [643. Maximum Average Subarray I](https://leetcode.com/problems/maximum-average-subarray-i)

```Tag```: ```Sliding Window``` ```Cumulative Sum``` ```Math```

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

### Cumulative Sum

- __Time complexity__: ```O(n)```
- __Space complexity__: ```O(n)```9

```Python
class Solution:
    def findMaxAverage(self, nums: List[int], k: int) -> float:
        n = len(nums)
        cumulative_sum = [0] * n
        cumulative_sum[0] = nums[0]

        for i in range(1, n):
            cumulative_sum[i] = cumulative_sum[i - 1] + nums[i]

        ans = cumulative_sum[k - 1] / k
        for i in range(k, n):
            ans = max(ans, (cumulative_sum[i] - cumulative_sum[i - k]) / k)

        return ans
```

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

```Python
class Solution:
    def findMaxAverage(self, nums: List[int], k: int) -> float:
        n = len(nums)
        ans = curr_sum = sum(nums[:k])

        for i in range(k, n):
            curr_sum += nums[i] - nums[i - k]
            ans = max(ans, curr_sum)
        
        return ans / k
```

```Python
class Solution:
    def findMaxAverage(self, nums: List[int], k: int) -> float:
        ans = curr = sum(nums[:k])
        n = len(nums)

        if n <= k:
            return sum(nums) / k

        for end in range(k, n):
            start = end - k
            curr += nums[end] - nums[start]
            ans = max(ans, curr)

        return ans / k
```

```Python
class Solution:
    def findMaxAverage(self, nums: List[int], k: int) -> float:
        n = len(nums)
        cumulative_sum = 0

        if n <= k:
            return sum(nums) / k

        for num in nums[:k]:
            cumulative_sum += num

        ans = cumulative_sum
        for i in range(k, n):
            cumulative_sum += nums[i] - nums[i - k]
            ans = max(ans, cumulative_sum) 

        return ans / k
```
