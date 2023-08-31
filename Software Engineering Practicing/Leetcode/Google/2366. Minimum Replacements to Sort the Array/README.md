## [2366. Minimum Replacements to Sort the Array](https://leetcode.com/problems/minimum-replacements-to-sort-the-array/)

```Tag```: ```Greedy```

#### Difficulty: Hard

You are given a __0-indexed__ integer array ```nums```. In one operation you can replace any element of the array with any two elements that sum to it.

- For example, consider ```nums = [5,6,7]```. In one operation, we can replace ```nums[1]``` with ```2``` and ```4``` and convert ```nums``` to ```[5,2,4,7]```.

Return _the minimum number of operations to make an array that is sorted in non-decreasing order_.
 
![image](https://github.com/quananhle/Python/assets/35042430/eae5dce1-3661-4520-98d7-d719f524c18b)

---

__Example 1:__
```
Input: nums = [3,9,3]
Output: 2
Explanation: Here are the steps to sort the array in non-decreasing order:
- From [3,9,3], replace the 9 with 3 and 6 so the array becomes [3,3,6,3]
- From [3,3,6,3], replace the 6 with 3 and 3 so the array becomes [3,3,3,3,3]
There are 2 steps to sort the array in non-decreasing order. Therefore, we return 2.
```

__Example 2:__
```
Input: nums = [1,2,3,4,5]
Output: 0
Explanation: The array is already in non-decreasing order. Therefore, we return 0. 
```

__Constraints:__

- $1 \le nums.length \le 10^{5}$
- $1 \le nums[i] \le 10^{9}$

---

![image](https://leetcode.com/problems/minimum-replacements-to-sort-the-array/Figures/2366/1.png)

![image](https://leetcode.com/problems/minimum-replacements-to-sort-the-array/Figures/2366/2.png)

![image](https://leetcode.com/problems/minimum-replacements-to-sort-the-array/Figures/2366/forward.png)

![image](https://leetcode.com/problems/minimum-replacements-to-sort-the-array/Figures/2366/3.png)

![image](https://leetcode.com/problems/minimum-replacements-to-sort-the-array/Figures/2366/4.png)

![image](https://leetcode.com/problems/minimum-replacements-to-sort-the-array/Figures/2366/5.png)

### Greedy

__Algorithm__

1. Set ```ans``` as 0, and set ```n``` as the length of ```nums```.
2. Iterate over ```nums``` backward from ```nums[n - 2]```, as we don't need to replace ```nums[n - 1]```.
 - If ```nums[i] <= nums[i + 1]```, move on to the next element ```nums[i - 1]```.
 - If ```nums[i]``` is divisible by ```nums[i + 1]```, break ```nums[i]``` into ```nums_elements = num[i] / nums[i + 1]``` elements, otherwise, break ```num[i]``` into ```nums_elements = nums[i] / nums[i + 1] + 1``` elements. This requires ```num_elements - 1``` replacement operations. Hence, we increment ```ans``` by ```num_elements - 1```.
 - The largest possible ```nums[i]``` after the operations is ```nums[i] / num_elements```, update ```nums[i]``` as ```nums[i] / num_elements```.
3. Return ```ans``` once the iteration is complete.

```Python
class Solution:
    def minimumReplacement(self, nums: List[int]) -> int:
        ans = 0
        n = len(nums)

        # Start from the second last element, as the last one is always sorted.
        for i in range(n - 2, -1, -1):
            # No need to break if they are already in order
            if nums[i] <= nums[i + 1]:
                continue
            
            # Count how many elements are made from breaking nums[i]
            num_elems = (nums[i] + nums[i + 1] - 1) // nums[i + 1]

            # Add number of operation = number of elements broken from nums[i] - 1
            ans += num_elems - 1

            # Maximize nums[i] after replace to sort the list in non-decreasing order
            nums[i] = nums[i] // num_elems
        
        return ans
```
