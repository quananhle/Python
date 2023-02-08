## 280. Wiggle Sort

```Tag```: ```Greedy Algorithm``` ```Sorting``` ```Dynamic Programming```

#### Difficulty: Medium

Given an integer array ```nums```, reorder it such that ```nums[0] <= nums[1] >= nums[2] <= nums[3]....```

You may assume the input array always has a valid answer.

![image](https://user-images.githubusercontent.com/35042430/217604872-6bf33772-38ed-4a2d-86c7-98987071b3c9.png)

---

__Example 1:__
```
Input: nums = [3,5,2,1,6,4]
Output: [3,5,1,6,2,4]
Explanation: [1,6,2,5,3,4] is also accepted.
```

__Example 2:__
```
Input: nums = [6,6,5,6,3,8]
Output: [6,6,5,6,3,8]
```

__Constraints:__

- 1 <= ```nums.length``` <= 5 * 10<sup>4</sup>
- 0 <= ```nums[i]``` <= 10<sup>4</sup>
- It is guaranteed that there will be an answer for the given input nums.
 
---

### Sorting

#### Algorithm

1. Sort the nums array.
2. Iterate over every odd index of ```nums``` starting from index ```i = 1``` until ```nums.length - 2```. We iterate until the second last element because the last element has no next element to swap with. We keep incrementing the index by 2 to move only over odd indices.
   - Swap the element at odd index ```i``` with the adjacent element at index ```i + 1```.

```Python
class Solution:
    def wiggleSort(self, nums: List[int]) -> None:
        """
        Do not return anything, modify nums in-place instead.
        """
        nums.sort()
        # The minimum element and maximum element are assured to be at the first and last index; hence, only iterate the inner bound
        for i in range(1, len(nums)-1, 2):
            # [0, 1, 2, 3, 4, 5, 6, 7, 8, 9] -> swap -> [0, 2, 1, 4, 3, 6, 5, 8, 7, 9]
            nums[i], nums[i+1] = nums[i+1], nums[i]
```

__Follow up__: Could you solve the problem in ```O(n)``` time complexity?

### Greedy

![image](https://leetcode.com/problems/wiggle-sort/solutions/2961467/Figures/280/280-1.png)

```Python
class Solution:
    def wiggleSort(self, nums: List[int]) -> None:
        """
        Do not return anything, modify nums in-place instead.
        """
        for i in range(1, len(nums)):
            # Check if element at odd index is smaller than its previous element, or
            # Check if element at even index is larger than its neighbor element
            if (i % 2 != 0 and nums[i-1] > nums[i]) or (i % 2 == 0 and nums[i-1] < nums[i]):
                nums[i], nums[i-1] = nums[i-1], nums[i]
```
