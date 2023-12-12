## [1464. Maximum Product of Two Elements in an Array](https://leetcode.com/problems/maximum-product-of-two-elements-in-an-array)

```Tag```: ```Array & String```

#### Difficulty: Easy

Given the array of integers ```nums```, you will choose two different indices ```i``` and ```j``` of that array. Return _the maximum value of ```(nums[i]-1) * (nums[j]-1)```_.

![image](https://github.com/quananhle/Python/assets/35042430/fe8fd904-0cf9-4fce-ad97-1247d18dfc03)

---

__Example 1:__
```
Input: nums = [3,4,5,2]
Output: 12 
Explanation: If you choose the indices i=1 and j=2 (indexed from 0), you will get the maximum value, that is, (nums[1]-1)*(nums[2]-1) = (4-1)*(5-1) = 3*4 = 12.
```

__Example 2:__
```
Input: nums = [1,5,4,5]
Output: 16
Explanation: Choosing the indices i=1 and j=3 (indexed from 0), you will get the maximum value of (5-1)*(5-1) = 16.
```

__Example 3:__
```
Input: nums = [3,7]
Output: 12
```

__Constraints:__

- $2 \le nums.length \le 500$
- $1 \le nums[i] \le 10^3$

---

### Two Passes

```Python
class Solution:
    def maxProduct(self, nums: List[int]) -> int:
        candidate_1 = candidate_2 = 0
        i = 0

        for idx, num in enumerate(nums):
            if candidate_1 < num:
                i = idx
                candidate_1 = num

        for idx, num in enumerate(nums):
            if candidate_2 < num and idx != i:
                candidate_2 = num

        return (candidate_1 - 1) * (candidate_2 - 1)
```
