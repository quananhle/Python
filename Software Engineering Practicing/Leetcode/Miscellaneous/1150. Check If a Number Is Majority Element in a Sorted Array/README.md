## [1150. Check If a Number Is Majority Element in a Sorted Array](https://leetcode.com/problems/check-if-a-number-is-majority-element-in-a-sorted-array/)

```Tag```: ```Counter``` ```Hash Map``` ```Binary Search``` ```Array & String```

#### Difficulty: Easy

Given an integer array ```nums``` sorted in non-decreasing order and an integer ```target```, return _```true``` if target is a majority element, or ```false``` otherwise_.

A majority element in an array ```nums``` is an element that appears more than ```nums.length / 2``` times in the array.

![image](https://github.com/quananhle/Python/assets/35042430/96800c8d-8fe8-474b-a903-0ae854306a78)

---

__Example 1:__
```
Input: nums = [2,4,5,5,5,5,5,6,6], target = 5
Output: true
Explanation: The value 5 appears 5 times and the length of the array is 9.
Thus, 5 is a majority element because 5 > 9/2 is true.
```

__Example 2:__
```
Input: nums = [10,100,101,101], target = 101
Output: false
Explanation: The value 101 appears 2 times and the length of the array is 4.
Thus, 101 is not a majority element because 2 > 4/2 is false.
```

__Constraints:__

- ```1 <= nums.length <= 1000```
- ```1 <= nums[i], target <= 10^9```
- ```nums``` is sorted in non-decreasing order.

---

### Counter

```Python
class Solution:
    def isMajorityElement(self, nums: List[int], target: int) -> bool:
        n = len(nums)
        counter = collections.Counter(nums)
        return counter[target] > n // 2
```

#### One-Liner

```Python
class Solution:
    def isMajorityElement(self, nums: List[int], target: int) -> bool:
        return collections.Counter(nums)[target] > len(nums) // 2
```

### ```count()```

#### One Liner

```Python
class Solution:
    def isMajorityElement(self, nums: List[int], target: int) -> bool:
        return nums.count(target) > len(nums) // 2
```

### Binary Search

#### Template 1

```Python
class Solution:
    def isMajorityElement(self, nums: List[int], target: int) -> bool:
        n = len(nums)
        lo, hi = 0, n - 1

        def lower_bound(lo, hi):
            lower_boundary = len(nums)
            while lo <= hi:
                mi = lo + (hi - lo) // 2

                if nums[mi] >= target:
                    hi = mi - 1
                    lower_boundary = mi
                else:
                    lo = mi + 1

            return lower_boundary
        
        def upper_bound(lo, hi):
            upper_boundary = len(nums)
            while lo <= hi:
                mi = lo + (hi - lo) // 2

                if nums[mi] <= target:
                    lo = mi + 1
                else:
                    hi = mi - 1
                    upper_boundary = mi

            return upper_boundary

        return upper_bound(0, n - 1) - lower_bound(0, n - 1) > n // 2
```
