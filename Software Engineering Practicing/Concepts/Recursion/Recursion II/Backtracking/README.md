## Pattern for Multiple Backtracking Problems

[78. Subsets](https://leetcode.com/problems/subsets/)

Given an integer array ```nums``` of unique elements, return all possible subsets (the power set).

The solution set must not contain duplicate subsets. Return the solution in any order.

Example:
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

Given an integer array ```nums``` that may contain duplicates, return all possible subsets (the power set).

The solution set must not contain duplicate subsets. Return the solution in any order.

Example:
```
Input: nums = [1,2,2]
Output: [[],[1],[1,2],[1,2,2],[2],[2,2]]
```

```Python

```
