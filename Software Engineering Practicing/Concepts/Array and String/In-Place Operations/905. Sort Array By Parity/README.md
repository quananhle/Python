## [905. Sort Array By Parity](https://leetcode.com/problems/sort-array-by-parity)

```Tag```: ```Two Pointers``` ```In-Place``` ```Sorting```

#### Difficulty: Easy

Given an integer array ```nums```, move all the even integers at the beginning of the array followed by all the odd integers.

Return ___any array__ that satisfies this condition_.

![image](https://user-images.githubusercontent.com/35042430/212778181-c82e0d63-53d1-434e-95ca-122597b7f4b6.png)
![image](https://github.com/quananhle/Python/assets/35042430/9a31c5b5-34ba-4bad-b2d1-d1b3cad89628)

---

__Example 1:__
```
Input: nums = [3,1,2,4]
Output: [2,4,3,1]
Explanation: The outputs [4,2,3,1], [2,4,1,3], and [4,2,1,3] would also be accepted.
```

__Example 2:__
```
Input: nums = [0]
Output: [0]
```

__Constraints:__

- $1 \le nums.length \le 5000$
- $0 \le nums[i] \le 5000$

---

### Sort

```Python
class Solution:
    def sortArrayByParity(self, nums: List[int]) -> List[int]:
        # Sort
        #### Time Complexity : O(NlogN), sort operations take NlogN time
        #### Space Complexity: O(N), generate a new array to sort elements
        nums.sort(key=lambda x: x % 2)
        return nums
```

### Two Pointers

```Python
class Solution:
    def sortArrayByParity(self, nums: List[int]) -> List[int]:
        # Two Pointers
        #### Time Complexity : O(N), traverse through the input array to build even and odd lists
        #### Space Complexity: O(N), extra memory space to build even and odd lists
        even = [num for num in nums if num % 2 == 0] 
        odd = [num for num in nums if num % 2 != 0]
        return even + odd
```

### Two Pointers and Swap

```Python
class Solution:
    def sortArrayByParity(self, nums: List[int]) -> List[int]:
        # In-Place
        #### Time Complexity : O(N), traverse through the input array to build even and odd lists
        #### Space Complexity: O(1), constant memory space for pointers
        left, right = 0, len(nums)-1
        while left < right:
            if nums[left] % 2 != 0 and nums[right] % 2 == 0:
                nums[left], nums[right] = nums[right], nums[left]
            if nums[left] % 2 == 0:
                left += 1
            if nums[right] % 2 != 0:
                right -= 1          
        return nums
```

```Python
class Solution:
    def sortArrayByParity(self, nums: List[int]) -> List[int]:
        i, j = 0, len(nums) - 1

        while i < j:
            if nums[i] % 2 != 0 and nums[j] % 2 == 0:
                nums[i], nums[j] = nums[j], nums[i]
            else:
                if nums[j] % 2 != 0:
                    j -= 1
                elif nums[i] % 2 == 0:
                    i += 1
                else:
                    i += 1; j -= 1
        return nums
```
