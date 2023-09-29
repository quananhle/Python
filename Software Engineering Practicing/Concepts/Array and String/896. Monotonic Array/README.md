## [896. Monotonic Array](https://leetcode.com/problems/monotonic-array)

```Tag```: ```Array & String```

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

### Two Pass

__Complexity Analysis__

- __Time Complexity__: $O(N)$
- __Space Complexity__: $O(1)$

```Python
class Solution:
    def isMonotonic(self, nums: List[int]) -> bool:
        return all(nums[i] <= nums[i + 1] for i in range(len(nums) - 1)) or \
               all(nums[i] >= nums[i + 1] for i in range(len(nums) - 1))
```

### One Pass

To perform this check in one pass, we want to handle a stream of comparisons from $\{-1, 0, 1\}$, corresponding to ```<```, ```==```, or ```>```. For example, with the array ```[1, 2, 2, 3, 0]```, we will see the stream ```(-1, 0, -1, 1)```.

__Complexity Analysis__

- __Time Complexity__: $O(N)$
- __Space Complexity__: $O(1)$

```Python
class Solution:
    def isMonotonic(self, nums: List[int]) -> bool:
        stream = 0
        n = len(nums)
        for i in range(n - 1):
            comparison = -1 if nums[i] < nums[i + 1] else 1 if nums[i] > nums[i + 1] else 0 
            if comparison:
                if comparison != stream != 0:
                    return False
                stream = comparison
        return True
```

__Complexity Analysis__

- __Time Complexity__: $O(N)$
- __Space Complexity__: $O(1)$

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


