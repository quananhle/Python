## 561. Array Partition

```Tag```: ```Sorting``` ```Dynamic Programming```

#### Difficulty: Easy

Given an integer array ```nums``` of ```2n``` integers, group these integers into ```n``` pairs ```(a1, b1), (a2, b2), ..., (an, bn)``` such that the sum of ```min(ai, bi)``` for all ```i``` is __maximized__. Return _the maximized sum_.

![image](https://user-images.githubusercontent.com/35042430/209841173-dec6ea9e-a069-42c0-829a-8566f4ffdb31.png)

---

__Example 1:__

```
Input: nums = [1,4,3,2]
Output: 4
Explanation: All possible pairings (ignoring the ordering of elements) are:
1. (1, 4), (2, 3) -> min(1, 4) + min(2, 3) = 1 + 2 = 3
2. (1, 3), (2, 4) -> min(1, 3) + min(2, 4) = 1 + 2 = 3
3. (1, 2), (3, 4) -> min(1, 2) + min(3, 4) = 1 + 3 = 4
So the maximum possible sum is 4.
```

__Example 2:__

```
Input: nums = [6,2,6,5,1,2]
Output: 9
Explanation: The optimal pairing is (2, 1), (2, 5), (6, 6). min(2, 1) + min(2, 5) + min(6, 6) = 1 + 2 + 6 = 9.
```

__Constraints:__

```
1 <= n <= 104
nums.length == 2 * n
-104 <= nums[i] <= 104
```

---

### Sorting

```Python
class Solution:
    def arrayPairSum(self, nums: List[int]) -> int:
        #### Time Complexity: O(NlogN), sort operations takes NlogN time, traverse through input every 2 steps at a time costs N/2 time
        #### Space Complexity: O(1), constant space for pointers
        nums.sort()
        ans = 0
        i, j = 0, 1
        while i < len(nums) and j < len(nums):
            ans += min(nums[i], nums[j])
            if i + 2 < len(nums) and j + 2 < len(nums):
                i += 2
                j += 2
            else:
                break
        return ans
```
