## [16. 3Sum Closest](https://leetcode.com/problems/3sum-closest/)

```Tag```: ```Two Pointers``` ```Binary Search```

#### Difficulty: Medium

Given an integer array ```nums``` of length ```n``` and an integer ```target```, find three integers in ```nums``` such that the sum is closest to ```target```.

Return _the sum of the three integers_.

You may assume that each input would have exactly one solution.

![image](https://user-images.githubusercontent.com/35042430/225415842-e4952b9e-76b2-46f9-88a8-ee3dd27253da.png)

---

__Example 1__:
```
Input: nums = [-1,2,1,-4], target = 1
Output: 2
Explanation: The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).
```

__Example 2__:
```
Input: nums = [0,0,0], target = 1
Output: 0
Explanation: The sum that is closest to the target is 0. (0 + 0 + 0 = 0).
```

__Constraints__:

- ```3 <= nums.length <= 500```
- ```-1000 <= nums[i] <= 1000```
- -10<sup>4</sup> <= ```target``` <= 10<sup>4</sup>

---

### Two Pointers

__Algorithm__

1. Initialize the minimum difference ```diff``` with a large value.
2. Sort the input array ```nums```.
3. Iterate through the array:
- For the current position ```i```, set ```lo``` to ```i + 1```, and ```hi``` to the last index.
- While the ```lo``` pointer is smaller than ```hi```:
  - Set sum to ```nums[i] + nums[lo] + nums[hi]```.
  - If the absolute difference between ```sum``` and ```target``` is smaller than the absolute value of ```diff```:
    - Set ```diff``` to ```target - sum```.
  - If ```sum``` is less than ```target```, increment ```lo```.
  - Else, decrement ```hi```.
- If ```diff``` is zero, break from the loop.
4. Return the value of the closest triplet, which is ```target - diff```.

```Python
class Solution:
    def threeSumClosest(self, nums: List[int], target: int) -> int:
        diff = float('inf')
        nums.sort()
        for i in range(len(nums)):
            lo, hi = i + 1, len(nums) - 1
            while lo < hi:
                total = nums[i] + nums[lo] + nums[hi]
                if abs(target - total) < abs(diff):
                    diff = target - total
                if total < target:
                    lo += 1
                else:
                    hi -= 1
                
            if diff == 0:
                break
        return target - diff
```

### Binary Search

```Python
class Solution:
    def threeSumClosest(self, nums: List[int], target: int) -> int:
        diff = float('inf')
        nums.sort()
        n = len(nums)
        for i in range(n):
            for j in range(i + 1, n):
                complement = target - nums[i] - nums[j]
                hi = bisect_right(nums, complement, j + 1)
                lo = hi - 1
                if hi < n and abs(complement - nums[hi]) < abs(diff):
                    diff = complement - nums[hi]
                if lo > j and abs(complement - nums[lo]) < abs(diff):
                    diff = complement - nums[lo]
            
            if diff == 0:
                break
        
        return target - diff
```
