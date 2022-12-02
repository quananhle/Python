## 724. Find Pivot Index

#### Difficulty: Easy

Given an array of integers ```nums```, calculate the __pivot index__ of this array.

The __pivot index__ is the index where the sum of all the numbers __strictly__ to the left of the index is equal to the sum of all the numbers __strictly__ to the index's right.

If the index is on the left edge of the array, then the left sum is ```0``` because there are no elements to the left. This also applies to the right edge of the array.

Return the __leftmost pivot index__. If no such index exists, return ```-1```.

<img width="823" alt="image" src="https://user-images.githubusercontent.com/35042430/205196759-0c3757f7-d865-4bcf-ab75-38f1d91dff76.png">

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
class Solution(object):
    def pivotIndex(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        # Prefix Sum
        #### Time Complexity: O(N)
        #### Space Complexity: O(1)
        total = sum(nums)
        print (total)
        left_sum = 0
        for i, e in enumerate(nums):
            if left_sum == total - left_sum - e:
                return i
            else:
                left_sum += e
        return -1
```

"""
        # Prefix Sum Lists
        left_sum, right_sum = list(), list()
        left, right = 0, len(nums)-1
        while left < len(nums):
            if not left_sum:           
                left_sum.append(nums[left])
                right_sum.append(nums[right])
            else:       
                left_sum.append(left_sum[-1] + nums[left])
                right_sum.append(right_sum[-1] + nums[right])
            left += 1
            right -= 1
        print (left_sum, right_sum)
        for i in range(len(nums)):
            if left_sum[i] == right_sum[-i-1]:
                return i
        else:
            return -1        
        """
        # Three Pointers
        left_sum, right_sum = 0, sum(nums)-nums[0]
        pivot = 0
        while pivot < len(nums)-1 and left_sum != right_sum:
            pivot += 1
            right_sum -= nums[pivot]
            left_sum += nums[pivot-1]
        return pivot if left_sum == right_sum else -1
