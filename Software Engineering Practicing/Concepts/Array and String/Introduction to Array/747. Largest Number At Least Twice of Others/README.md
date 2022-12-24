## 747. Largest Number At Least Twice of Others

```Tag```: ```Array```  ```Sorting```

#### Difficulty: Easy

You are given an integer array ```nums``` where the largest integer is __unique__.

Determine whether the largest element in the array is at least twice as much as every other number in the array. If it is, return _the __index__ of the largest element_, or return ```-1``` otherwise.

![image](https://user-images.githubusercontent.com/35042430/209450483-ce0ebaae-18a9-4b40-bfcd-ca7e0fb5e17c.png)

---

__Example 1:__
```
Input: nums = [3,6,1,0]
Output: 1
Explanation: 6 is the largest integer.
For every other number in the array x, 6 is at least twice as big as x.
The index of value 6 is 1, so we return 1.
```

__Example 2:__
```
Input: nums = [1,2,3,4]
Output: -1
Explanation: 4 is less than twice the value of 3, so we return -1.
```

__Constraints:__
```
2 <= nums.length <= 50
0 <= nums[i] <= 100
The largest element in nums is unique.
```

---

### Sorting

```Python
class Solution:
    def dominantIndex(self, nums: List[int]) -> int:
        largest, second_largest = sorted(nums)[-1], sorted(nums)[-2]
        if largest - second_largest >= second_largest:
            for i, num in enumerate(nums):
                if num == largest:
                    return i
        return -1
'''
        
### Max

```Python
class Solution:
    def dominantIndex(self, nums: List[int]) -> int:
        largest, second_largest = -1, -1
        for num in nums:
            if largest < num:
                largest = num
        for num in nums:
            if second_largest < num < largest:
                second_largest = num
        if largest - second_largest < second_largest:
            return -1
        else:
            for idx, num in enumerate(nums):
                if num == largest:
                    return idx 
```
