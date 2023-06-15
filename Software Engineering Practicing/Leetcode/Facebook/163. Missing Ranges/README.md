## [163. Missing Ranges](https://leetcode.com/problems/missing-ranges)

```Tag```: ```Array & String```

#### Difficulty: Easy

You are given an inclusive range ```[lower, upper]``` and a __sorted unique__ integer array ```nums```, where all elements are within the inclusive range.

A number ```x``` is considered missing if ```x``` is in the range ```[lower, upper]``` and ```x``` is not in ```nums```.

Return _the shortest sorted list of ranges that exactly covers all the missing numbers_. That is, no element of ```nums``` is included in any of the ranges, and each missing number is covered by one of the ranges.

![image](https://github.com/quananhle/Python/assets/35042430/18828dad-fba7-4db6-8064-b82caddbefb5)

---

__Example 1:__
```
Input: nums = [0,1,3,50,75], lower = 0, upper = 99
Output: [[2,2],[4,49],[51,74],[76,99]]
Explanation: The ranges are:
[2,2]
[4,49]
[51,74]
[76,99]
```

__Example 2:__
```
Input: nums = [-1], lower = -1, upper = -1
Output: []
Explanation: There are no missing ranges since there are no missing numbers.
```

__Constraints:__

- ```-10^9 <= lower <= upper <= 10^9```
- ```0 <= nums.length <= 100```
- ```lower <= nums[i] <= upper```
- All the values of ```nums``` are unique.

---

### Linear Scan

![image](https://leetcode.com/problems/missing-ranges/Figures/163/163-1.png)

When nums[i + 1] - nums[i] <= 1, we know that there are no missing elements between nums[i + 1] and nums[i].
When nums[i + 1] - nums[i] > 1, we know that the range of elements, [nums[i] + 1, nums[i + 1] - 1], is missing.
However, there are two edge cases:

If we don't start with lower as the first element of the array, we will need to include [lower, num[0] - 1] as a missing range as well.
Similarly, if we don't end with upper as the last element of the array, we will need to include [nums[n - 1] + 1, upper] as a missing range as well where n is the length of nums.

```Python
class Solution:
    def findMissingRanges(self, nums: List[int], lower: int, upper: int) -> List[List[int]]:
        if not nums:
            return [[lower, upper]]
        
        n = len(nums)
        res = list()

        # Check for the lower out-of-bound boundary
        if lower < nums[0]:
            res.append([lower, nums[0] - 1])
        
        for i in range(n - 1):
            # Check if the numbers in nums are consecutive
            if nums[i + 1] - nums[i] <= 1:
                continue
            # Boundary is the next number of nums[i] and the previous number of nums[i - 1]
            res.append([nums[i] + 1, nums[i + 1] - 1])

        # Check for the upper out-of-bound boundary
        if nums[-1] < upper:
            res.append([nums[-1] + 1, upper])

        return res
```
