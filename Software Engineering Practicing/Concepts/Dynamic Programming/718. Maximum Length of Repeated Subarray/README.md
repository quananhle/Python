## [718. Maximum Length of Repeated Subarray](https://leetcode.com/problems/maximum-length-of-repeated-subarray/)

```Tag```: ```Dynamic Programming``` ```Recursion``` ```Sliding Window```

#### Difficulty: Medium

Given two integer arrays ```nums1``` and ```nums2```, return _the maximum length of a subarray that appears in __both__ arrays_.

![image](https://user-images.githubusercontent.com/35042430/221624291-510db02c-fda9-46ac-9ab8-ebd7724b71ea.png)

---

__Example 1:__
```
Input: nums1 = [1,2,3,2,1], nums2 = [3,2,1,4,7]
Output: 3
Explanation: The repeated subarray with maximum length is [3,2,1].
```

__Example 2:__
```
Input: nums1 = [0,0,0,0,0], nums2 = [0,0,0,0,0]
Output: 5
Explanation: The repeated subarray with maximum length is [0,0,0,0,0].
```

__Constraints:__

- ```1 <= nums1.length, nums2.length <= 1000```
- ```0 <= nums1[i], nums2[i] <= 100```

---

### The Framework

#### Top-Down Dynamic Programming (Recursion)

```Python
class Solution:
    def findLength(self, nums1: List[int], nums2: List[int]) -> int:
        # Top-Down DP (Recursion)
        n, m = len(nums1), len(nums2)

        @lru_cache(None)
        def dp(i, j, curr):
            # Base cases
            if i == -1 or j == -1:
                return 0

            # Get the current length of the longest subarray
            longest_subarray = curr
            
            # Recurrence relation: matching elements found or not found
            
            # Check if the element at both arrays are the same
            if nums1[i - 1] == nums2[j - 1]:
                longest_subarray = max(longest_subarray, dp(i - 1, j - 1, curr + 1))
            
            # Move pointers to the left in either array as elements are different, reset the subarray size
            longest_subarray = max(longest_subarray, dp(i - 1, j, 0), dp(i, j - 1, 0))
            
            return longest_subarray

        return dp(n, m, 0)
```

```Python
class Solution:
    def findLength(self, nums1: List[int], nums2: List[int]) -> int:
        n, m = len(nums1), len(nums2)
        
        @lru_cache(None)
        def dp(i, j, curr):
            # Base cases
            if i == 0 or j == 0:
                return curr

            longest_subarray = curr
            if nums1[i - 1] == nums2[j - 1]:
                longest_subarray = max(longest_subarray, dp(i - 1, j - 1, curr + 1))

            longest_subarray = max(longest_subarray, dp(i - 1, j, 0), dp(i, j - 1, 0))
            return longest_subarray
        
        return dp(n, m, 0)
```

```Python
class Solution:
    def findLength(self, nums1: List[int], nums2: List[int]) -> int:
        n, m = len(nums1), len(nums2)

        @lru_cache(None)
        def dp(i, j, curr):
            # Base cases
            if i == len(nums1) or j == len(nums2):
                return curr

            longest_subarray = curr
            if nums1[i] == nums2[j]:
                longest_subarray = max(longest_subarray, dp(i + 1, j + 1, curr + 1))

            longest_subarray = max(longest_subarray, max(dp(i + 1, j, 0), dp(i, j + 1, 0)))
            return longest_subarray

        return dp(0, 0, 0)
```
