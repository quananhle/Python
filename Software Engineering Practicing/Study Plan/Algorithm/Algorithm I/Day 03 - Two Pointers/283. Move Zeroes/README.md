## 283. Move Zeroes

```Tag```: ```Two Pointers```

#### Difficulty: Easy

Given an integer array ```nums```, move all ```0```'s to the end of it while maintaining the relative order of the non-zero elements.

__Note__ that you must do this in-place without making a copy of the array.

![image](https://user-images.githubusercontent.com/35042430/210155168-c6db9570-17bc-4d2f-91cd-3d6e45c0608a.png)

---

__Example 1:__
```
Input: nums = [0,1,0,3,12]
Output: [1,3,12,0,0]
```

__Example 2:__
```
Input: nums = [0]
Output: [0]
```

__Constraints:__

- 1 <= ```nums.length``` <= 10<sup>4</sup>
- -2<sup>31</sup> <= ```nums[i]``` <= 2<sup>31</sup> - 1

---

### Two Pointers

#### Fast and Slow Pointers

```Python
class Solution:
    def moveZeroes(self, nums: List[int]) -> None:
        """
        Do not return anything, modify nums in-place instead.
        """
        n = len(nums)
        slow = fast = 0
        while fast < n:
            if nums[fast]:
                nums[slow], nums[fast] = nums[fast], nums[slow]
                slow += 1
            fast += 1
```

### ✅ Snowball

![image](https://assets.leetcode.com/users/olsh/image_1537442610.png)

```Python
class Solution:
    def moveZeroes(self, nums: List[int]) -> None:
        """
        Do not return anything, modify nums in-place instead.
        """
        snow_ball = 0
        for i in range(len(nums)):
            if nums[i] == 0:
                # Increase snowball size
                snow_ball += 1
            # If encounter a non-zero integer and there is a snowball:
            elif snow_ball:
                # Swap to the first index of the snow ball
                nums[i], nums[i-snow_ball] = nums[i-snow_ball], nums[i]
```

```Python
class Solution:
    def moveZeroes(self, nums: List[int]) -> None:
        """
        Do not return anything, modify nums in-place instead.
        """
        snow_ball = 0
        for idx, num in enumerate(nums):
            if num == 0:
                snow_ball += 1
            elif snow_ball:
                nums[idx], nums[idx - snowball] = nums[idx - snowball], nums[idx]
```
