## [1909. Remove One Element to Make the Array Strictly Increasing](https://leetcode.com/problems/remove-one-element-to-make-the-array-strictly-increasing)

```Tag```: ```Array & String```

#### Difficulty: Easy

Given a 0-indexed integer array ```nums```, return _```True``` if it can be made strictly increasing after removing exactly one element_, or _```False``` otherwise. If the array is already strictly increasing, return ```True```_.

The array ```nums``` is strictly increasing if $nums[i - 1] \lt nums[i]$ for each index ($1 \le i \lt nums.length$).

---

__Example 1__:
```
Input: nums = [1,2,10,5,7]
Output: true
Explanation: By removing 10 at index 2 from nums, it becomes [1,2,5,7].
[1,2,5,7] is strictly increasing, so return true.
```

__Example 2__:
```
Input: nums = [2,3,1,2]
Output: false
Explanation:
[3,1,2] is the result of removing the element at index 0.
[2,1,2] is the result of removing the element at index 1.
[2,3,2] is the result of removing the element at index 2.
[2,3,1] is the result of removing the element at index 3.
No resulting array is strictly increasing, so return false.
```

__Example 3:__
```
Input: nums = [1,1,1]
Output: false
Explanation: The result of removing any element is [1,1].
[1,1] is not strictly increasing, so return false.
```
 

__Constraints:__

- $2 \le nums.length \le 1000$
- $1 \le nums[i] \le 1000$

---

### One Pass

```Python
class Solution:
    def canBeIncreasing(self, nums: List[int]) -> bool:
        n = len(nums)
        found = False
        idx = 0

        # Check if there are multiple non-increasing elements
        for i in range(1, n):
            if nums[i] <= nums[i - 1]:
                # Get the index of the non-increasing elements
                idx = i - 1
                if not found:
                    found = True
                else:
                    return False
        
        # Check if the array is already strictly increasing
        if not found:
            return True
        
        # Check if the non-increasing element is in first or last positions
        if idx == 0 or idx == n - 2:
            return True
        
        # Check if non-increasing element is in the middle of the array
        # [1,2,1,3,4,5] -> [1,2,(1),3,4,5]: check elements before and after non-increasing element
        # [3,4,5,6,1,7] -> [3,4,5,6,(1),7]: check elements in second to last position
        if nums[idx - 1] < nums[idx + 1] or (idx + 2 < n and nums[idx] < nums[idx + 2]):
            return True
        
        return False
```
