## [46. Permutations](https://leetcode.com/problems/permutations/)

```Tag```: ```Backtracking```

#### Difficulty: Medium

Given an array ```nums``` of __distinct__ integers, return _all the possible permutations_. You can return the answer in any order.

![image](https://user-images.githubusercontent.com/35042430/218553058-3877688e-e6e4-42e3-ba6b-d346855a1c15.png)

---

__Example 1:__
```
Input: nums = [1,2,3]
Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
```

__Example 2:__
```
Input: nums = [0,1]
Output: [[0,1],[1,0]]
```

__Example 3:__
```
Input: nums = [1]
Output: [[1]]
```

__Constraints:__

- ```1 <= nums.length <= 6```
- ```-10 <= nums[i] <= 10```
- All the integers of ```nums``` are unique.

---

### Backtracking

![image](https://user-images.githubusercontent.com/35042430/226508162-6e3de2b8-cfa9-46b6-9ee7-95e9e8cd0666.png)

```Python
class Solution:
    def permute(self, nums: List[int]) -> List[List[int]]:
        res = list()

        def backtrack(curr):
            # Base case
            # Check if integers in nums have been swapped n times for n == len(nums) 
            if curr == len(nums):
                res.append(nums[:])
                return
            
            for i in range(curr, len(nums)):
                # Swap the integers in nums
                nums[i], nums[curr] = nums[curr], nums[i]
                # Move on to the next integer
                backtrack(curr + 1)
                # Backtracking
                nums[i], nums[curr] = nums[curr], nums[i]
        
        backtrack(0)
        return res
```
