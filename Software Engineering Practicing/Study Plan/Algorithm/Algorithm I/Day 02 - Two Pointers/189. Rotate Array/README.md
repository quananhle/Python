## [189. Rotate Array](https://leetcode.com/problems/rotate-array)

```Tag```: ```Two Pointers``` ```Stack``` ```Splicing```

#### Difficulty: Medium

Given an array, rotate the array to the right by ```k``` steps, where ```k``` is non-negative.

![image](https://user-images.githubusercontent.com/35042430/210019065-ea0ee90a-dc60-4509-8f6e-eccdba3ef0fb.png)

---

__Example 1:__
```
Input: nums = [1,2,3,4,5,6,7], k = 3
Output: [5,6,7,1,2,3,4]
Explanation:
rotate 1 steps to the right: [7,1,2,3,4,5,6]
rotate 2 steps to the right: [6,7,1,2,3,4,5]
rotate 3 steps to the right: [5,6,7,1,2,3,4]
```

__Example 2:__
```
Input: nums = [-1,-100,3,99], k = 2
Output: [3,99,-1,-100]
Explanation: 
rotate 1 steps to the right: [99,-1,-100,3]
rotate 2 steps to the right: [3,99,-1,-100]
```

__Constraints:__
```
1 <= nums.length <= 105
-231 <= nums[i] <= 231 - 1
0 <= k <= 105
```

---

__Follow up__:

- Try to come up with as many solutions as you can. There are at least three different ways to solve this problem.
- Could you do it in-place with ```O(1)``` extra space?

### ✅ Two Pointers

```Python
class Solution:
    def rotate(self, nums: List[int], k: int) -> None:
        """
        Do not return anything, modify nums in-place instead.
        """
        k = k % len(nums)
        # Reverse the entire array                      [1,2,3,4,5,6,7] -> [7,6,5,4,3,2,1]
        l, r = 0, len(nums)-1
        while l < r:
            nums[l], nums[r] = nums[r], nums[l]
            l += 1
            r -= 1
        # Reverse k length of the array                 [7,6,5,4,3,2,1], k = 3 -> [5,6,7,4,3,2,1]
        l, r = 0, k-1
        while l < r:
            nums[l], nums[r] = nums[r], nums[l]
            l += 1
            r -= 1
        # Reverse the remaining portion of the array    [5,6,7,4,3,2,1], k = 3 -> [5,6,7,1,2,3,4]
        l, r = k, len(nums)-1
        while l < r:
            nums[l], nums[r] = nums[r], nums[l]
            l += 1
            r -= 1
```

### Cyclic Replacements

![image](https://leetcode.com/media/original_images/189_Rotate_Array.png)

```Python
class Solution:
    def rotate(self, nums: List[int], k: int) -> None:
        """
        Do not return anything, modify nums in-place instead.
        """
        n = len(nums)
        # Ensure k is smaller than n to avoid repeated rotation
        k %= n

        start = count = 0
        while count < n:
            current, prev = start, nums[start]
            while True:
                next_idx = (current + k) % n
                nums[next_idx], prev = prev, nums[next_idx]
                current = next_idx
                count += 1

                if start == current:
                    break
            start += 1
```

### Pop() and Prepend (insert(0, n))

```Python
class Solution:
    def rotate(self, nums: List[int], k: int) -> None:
        """
        Do not return anything, modify nums in-place instead.
        """

        # Stack Pop() and Prepend
        #### Time Complexity: O(k), loop k time
        #### Space Complexity: O(1), constant memory space
        # Base Cases
        # If k == n, rotate a complete round similar to k == 0
        k %= len(nums)
        for _ in range(k):
            num = nums.pop()
            nums.insert(0, num)
```
