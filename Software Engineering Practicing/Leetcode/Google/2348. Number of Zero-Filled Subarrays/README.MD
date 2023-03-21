## [2348. Number of Zero-Filled Subarrays](https://leetcode.com/problems/number-of-zero-filled-subarrays/)

```Tag```: ```Two Pointers``` ```Sliding Window```

#### Difficulty: Medium

Given an integer array ```nums```, return _the number of __subarrays__ filled with ```0```_.

A __subarray__ is a contiguous non-empty sequence of elements within an array.

![image](https://user-images.githubusercontent.com/35042430/226645899-b06e1333-1cd2-4836-b173-dc251542de80.png)

---

__Example 1:__
```
Input: nums = [1,3,0,0,2,0,0,4]
Output: 6
Explanation: 
There are 4 occurrences of [0] as a subarray.
There are 2 occurrences of [0,0] as a subarray.
There is no occurrence of a subarray with a size more than 2 filled with 0. Therefore, we return 6.
```

__Example 2:__
```
Input: nums = [0,0,0,2,0,0]
Output: 9
Explanation:
There are 5 occurrences of [0] as a subarray.
There are 3 occurrences of [0,0] as a subarray.
There is 1 occurrence of [0,0,0] as a subarray.
There is no occurrence of a subarray with a size more than 3 filled with 0. Therefore, we return 9.
```

__Example 3:__
```
Input: nums = [2,10,2019]
Output: 0
Explanation: There is no subarray filled with 0. Therefore, we return 0.
```

__Constraints:__

- 1 <= ```nums.length``` <= 10<sup>5</sup>
- -10<sup>9</sup> <= ```nums[i]``` <= 10<sup>9</sup>

---

![image](https://leetcode.com/problems/number-of-zero-filled-subarrays/Figures/2348/2348-1.png)

### Count Running Subarray

![image](https://leetcode.com/problems/number-of-zero-filled-subarrays/Figures/2348/2348-2.png)

![image](https://leetcode.com/problems/number-of-zero-filled-subarrays/Figures/2348/2348-2_4.png)

```Python
class Solution:
    def zeroFilledSubarray(self, nums: List[int]) -> int:
        total_subarray = curr_subarray = 0
        for num in nums:
            if num == 0:
                curr_subarray += 1
                total_subarray += curr_subarray
            else:
                curr_subarray = 0
        return total_subarray
```

### Sliding Window

```Python
class Solution:
    def zeroFilledSubarray(self, nums: List[int]) -> int:
        start = total_subarray = 0
        for end in range(len(nums)):
            if nums[end]:
                start = end + 1
            total_subarray += end - start + 1
        return total_subarray
```
