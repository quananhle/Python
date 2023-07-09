## [2407. Longest Increasing Subsequence II](https://leetcode.com/problems/longest-increasing-subsequence-ii/)

```Tag```: ```Segment Tree``` ```Numpy```

#### Difficulty: Hard

You are given an integer ```array``` nums and an integer __k__.

Find the longest subsequence of ```nums``` that meets the following requirements:

- The subsequence is __strictly increasing__ and
- The difference between adjacent elements in the subsequence is __at most__ ```k```.

Return _the length of the __longest subsequence__ that meets the requirements_.

A __subsequence__ is an array that can be derived from another array by deleting some or no elements without changing the order of the remaining elements.

![image](https://github.com/quananhle/Python/assets/35042430/fedf17b5-0442-49e8-baaa-5d28fb3626e2)

---

__Example 1:__
```
Input: nums = [4,2,1,4,3,4,5,8,15], k = 3
Output: 5
Explanation:
The longest subsequence that meets the requirements is [1,3,4,5,8].
The subsequence has a length of 5, so we return 5.
Note that the subsequence [1,3,4,5,8,15] does not meet the requirements because 15 - 8 = 7 is larger than 3.
```

__Example 2:__
```
Input: nums = [7,4,5,1,8,12,4,7], k = 5
Output: 4
Explanation:
The longest subsequence that meets the requirements is [4,5,8,12].
The subsequence has a length of 4, so we return 4.
```

__Example 3:__
```
Input: nums = [1,5], k = 1
Output: 1
Explanation:
The longest subsequence that meets the requirements is [1].
The subsequence has a length of 1, so we return 1.
```

__Constraints:__

- 1 <= ```nums.length``` <= 10<sup>5</sup>
- 1 <= ```nums[i]```, ```k``` <= 10<sup>5</sup>

---

### Segment Tree

```Python
class SegmentTree:
    def __init__(self, size):
        self.size = size
        self.tree = [0] * 2 * self.size

    def query(self, left, right):
        left += self.size
        right += self.size
        ans = 0

        while left < right:
            if left & 1:
                ans = max(ans, self.tree[left])
                left += 1
            if right & 1:
                right -= 1
                ans = max(ans, self.tree[right])
            left >>= 1
            right >>= 1
        
        return ans
    
    def update(self, i, val):
        i += self.size
        self.tree[i] = val
        while i > 1:
            i >>= 1
            self.tree[i] = max(self.tree[i * 2], self.tree[i * 2 + 1])

class Solution:
    def lengthOfLIS(self, nums: List[int], k: int) -> int:
        n, ans = max(nums), 1
        tree = SegmentTree(n)
        for num in nums:
            num -= 1
            prev = tree.query(max(0, num - k), num)
            ans = max(ans, prev + 1)
            tree.update(num, prev + 1)
        
        return ans
```

### Memoization

```Python
class Solution:
    def lengthOfLIS(self, nums: List[int], k: int) -> int:
        # Time Limit Exceeded
        memo = {}
        ans = 0
        for i in nums:
            memo[i] = max([c + 1 for v, c in memo.items() if (i - v) >= 0 and (i - v) <= k], default=1)
            ans = m
        return ans
```

```Python
class Solution:
    def lengthOfLIS(self, nums: List[int], k: int) -> int:
        # Time Limit Exceeded
        memo = [0] * (max(nums) + 1)
        ans = 0

        for i in nums:
            start_idx = max(i - k, 0)
            curr = max(memo[start_idx:i])
            memo[i] = curr + 1
            ans = max(ans, memo[i])

        return ans
```

#### ```Numpy()```

```Python
import numpy as np
class Solution:
    def lengthOfLIS(self, nums: List[int], k: int) -> int:
        memo = np.array([0] * (max(nums) + 1))
        ans = 0

        for i in nums:
            start_idx = max(i - k, 0)
            memo[i] = memo[start_idx:i].max() + 1
            ans = max(ans, memo[i])

        return ans
```
