## [724. Find Pivot Index](https://leetcode.com/problems/find-pivot-index)

```Tag```: ```Array``` ```Prefix Sum```

#### Difficulty: Easy

Given an array of integers ```nums```, calculate the __pivot index__ of this array.

The __pivot index__ is the index where the sum of all the numbers __strictly__ to the left of the index is equal to the sum of all the numbers __strictly__ to the index's right.

If the index is on the left edge of the array, then the left sum is ```0``` because there are no elements to the left. This also applies to the right edge of the array.

Return the leftmost pivot index. If no such index exists, return ```-1```.

![image](https://user-images.githubusercontent.com/35042430/209426103-8c299418-43b6-49df-b818-fe28f930435a.png)

---

__Example 1:__
```
Input: nums = [1,7,3,6,5,6]
Output: 3
Explanation:
The pivot index is 3.
Left sum = nums[0] + nums[1] + nums[2] = 1 + 7 + 3 = 11
Right sum = nums[4] + nums[5] = 5 + 6 = 11
```

__Example 2:__
```
Input: nums = [1,2,3]
Output: -1
Explanation:
There is no index that satisfies the conditions in the problem statement.
```

__Example 3:__
```
Input: nums = [2,1,-1]
Output: 0
Explanation:
The pivot index is 0.
Left sum = 0 (no elements to the left of index 0)
Right sum = nums[1] + nums[2] = 1 + -1 = 0
```

__Constraints:__

```
1 <= nums.length <= 104
-1000 <= nums[i] <= 1000
```

---

### Prefix Sum

```Python
class Solution:
    def pivotIndex(self, nums: List[int]) -> int:
        # Prefix Sum
        total = sum(nums)
        left_sum = 0

        for i, e in enumerate(nums):
            if left_sum == total - left_sum - e:
                return i
            left_sum += e

        return -1
```
