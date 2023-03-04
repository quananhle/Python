## 2444. Count Subarrays With Fixed Bounds

```Tag```: ```String & Array``` ```Two Pointers```

#### Difficulty: Hard

You are given an integer array ```nums``` and two integers ```minK``` and ```maxK```.

A __fixed-bound subarray__ of ```nums``` is a subarray that satisfies the following conditions:

- The __minimum__ value in the subarray is equal to ```minK```.
- The __maximum__ value in the subarray is equal to ```maxK```.

Return _the __number__ of fixed-bound subarrays_.

A __subarray__ is a __contiguous__ part of an array.

![image](https://user-images.githubusercontent.com/35042430/222878096-bf42638b-bc7d-430d-b7a1-7ea105a1aee0.png)

---

__Example 1:__
```
Input: nums = [1,3,5,2,7,5], minK = 1, maxK = 5
Output: 2
Explanation: The fixed-bound subarrays are [1,3,5] and [1,3,5,2].
```

__Example 2:__
```
Input: nums = [1,1,1,1], minK = 1, maxK = 1
Output: 10
Explanation: Every subarray of nums is a fixed-bound subarray. There are 10 possible subarrays.
```

__Constraints:__

- 2 <= ```nums.length``` <= 10<sup>5</sup>
- 1 <= ```nums[i], minK, maxK``` <= 10<sup>6</sup>

---

![image](https://leetcode.com/problems/count-subarrays-with-fixed-bounds/Figures/2444/1.png)

![image](https://leetcode.com/problems/count-subarrays-with-fixed-bounds/Figures/2444/2.png)

Therefore, we also need to record three indexes:

1. ```leftBound```: the most recent value out of the range ```[minK, maxK]```,

2. ```maxPosition```: the most recent index with value equal to ```maxK```.

3. ```minPosition```: the most recent index with value equal to ```minK```.

![image](https://leetcode.com/problems/count-subarrays-with-fixed-bounds/Figures/2444/3.png)

__Algorithm__

1. Initialize three indices ```min_position```, ```max_position``` and ```left_bound``` as ```-1``` and set ```ans``` as ```0```.

2. Iterate over ```nums```, for each index ```i```:

- If ```nums[i]``` is out of the range ```[minK, maxK]```, update ```left_bound = i```.
- If ```nums[i]``` equals ```minK```, update ```minPosition = i```.
- If ```nums[i]``` equals ```maxK```, update ```maxPosition = i```.

The number of valid subarrays ending at index ```i``` equals ```min(min_position, max_position) - left_bound```. If the result is negative, it means there is no valid subarray ending at ```i```. Increment ```ans``` by the number of valid subarrays.

3. Return ```ans``` once the iteration stops.

```Python
class Solution:
    def countSubarrays(self, nums: List[int], minK: int, maxK: int) -> int:
        ans = 0
        min_position = max_position = left_bound = -1

        for idx, num in enumerate(nums):
            if not (minK <= num <= maxK):
                left_bound = idx
            
            if num == minK:
                min_position = idx
            if num == maxK:
                max_position = idx
            
            ans += max(0, min(min_position, max_position) - left_bound)

        return ans
```
