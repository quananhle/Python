## [896. Monotonic Array](https://leetcode.com/problems/monotonic-array)

```Tag```:

#### Difficulty: Easy

An array is monotonic if it is either monotone increasing or monotone decreasing.

An array ```nums``` is monotone increasing if for all ```i <= j```, ```nums[i] <= nums[j]```. An array nums is monotone decreasing if for all ```i <= j```, ```nums[i] >= nums[j]```.

Given an integer array ```nums```, return _```true``` if the given array is monotonic, or ```false``` otherwise_.

![image](https://github.com/quananhle/Python/assets/35042430/098e564e-f567-481d-b9b6-2517bbf62ba8)

---

__Example 1:__
```
Input: nums = [1,2,2,3]
Output: true
```

__Example 2:__
```
Input: nums = [6,5,4,4]
Output: true
```

__Example 3:__
```
Input: nums = [1,3,2]
Output: false
```

__Constraints:__

- $1 \le nums.length \le 10^{5}$
- $-10^{5} \le nums[i] \le 10^{5}$

---

### Brute Force

```Python
class Solution:
    def isMonotonic(self, nums: List[int]) -> bool:
        n = len(nums)

        # Check if monotone increasing or monotone decreasing
        if nums[0] <= nums[len(nums) - 1]:
            for i in range(1, n):
                if nums[i - 1] <= nums[i]:
                    continue
                else:
                    return False
        else:
            for i in range(n - 2, -1, -1):
                if nums[i + 1] <= nums[i]:
                    continue
                else:
                    return False

        return True
```

```Python
class Solution:
    def isMonotonic(self, nums: List[int]) -> bool:
        n = len(nums)

        # Check if monotone increasing or monotone decreasing
        if nums[0] <= nums[len(nums) - 1]:
            for i in range(1, n):
                if nums[i - 1] <= nums[i]:
                    continue
                else:
                    return False
        else:
            for i in range(1, n):
                if nums[i - 1] >= nums[i]:
                    continue
                else:
                    return False

        return True
```
