## Pattern for Multiple Backtracking Problems

[46. Permutations](https://leetcode.com/problems/permutations/)

Given an array ```nums``` of distinct integers, return _all the possible permutations_. You can return the answer in any order.

__Example__:
```
Input: nums = [1,2,3]
Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
```

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

---

[78. Subsets](https://leetcode.com/problems/subsets/)

Given an integer array ```nums``` of unique elements, return _all possible subsets (the power set)_.

The solution set must not contain duplicate subsets. Return the solution in any order.

__Example__:
```
Input: nums = [1,2,3]
Output: [[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]
```

```Python
class Solution:
    def subsets(self, nums: List[int]) -> List[List[int]]:
        res = list()

        def backtrack(curr_index, subset):
            # Base case
            if len(subset) == k:
                res.append(subset[:])
                return
            
            for i in range(curr_index, len(nums)):
                subset.append(nums[i])
                # Move on to the next element in the subset
                backtrack(i + 1, subset)
                # Backtracking
                subset.pop()

        for k in range(len(nums) + 1):
            backtrack(0, [])

        return res
```

---

[90. Subsets II](https://leetcode.com/problems/subsets-ii/)

Given an integer array ```nums``` that may contain duplicates, return _all possible subsets (the power set)_.

The solution set must not contain duplicate subsets. Return the solution in any order.

__Example__:
```
Input: nums = [1,2,2]
Output: [[],[1],[1,2],[1,2,2],[2],[2,2]]
```

```Python
class Solution:
    def subsetsWithDup(self, nums: List[int]) -> List[List[int]]:
        # Backtracking
        res = list()

        nums.sort()

        def backtracking(subset, curr):
            # Base case
            if len(subset) == k and not subset in res:
                res.append(subset[:])
                return
            
            for i in range(curr, len(nums)):
                subset.append(nums[i])
                backtracking(subset, i + 1)
                subset.pop()
        
        for k in range(len(nums) + 1):
            backtracking([], 0)
        return res
```

---


