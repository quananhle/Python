## Pattern for Multiple Backtracking Problems

[__39. Combination Sum__](https://leetcode.com/problems/combination-sum/)

Given an array of __distinct__ integers ```candidates``` and a target integer ```target```, return _a list of all __unique combinations__ of ```candidates``` where the chosen numbers sum to ```target```_. You may return the combinations in any order.

The __same__ number may be chosen from ```candidates``` an __unlimited number of times__. Two combinations are unique if the frequency of at least one of the chosen numbers is different.

The test cases are generated such that the number of unique combinations that sum up to ```target``` is less than ```150``` combinations for the given input.

__Example:__
```
Input: candidates = [2,3,6,7], target = 7
Output: [[2,2,3],[7]]
Explanation:
2 and 3 are candidates, and 2 + 2 + 3 = 7. Note that 2 can be used multiple times.
7 is a candidate, and 7 = 7.
These are the only two combinations.
```

```Python
class Solution:
    def combinationSum(self, candidates: List[int], target: int) -> List[List[int]]:
        res = list()


        def backtrack(combinations, remaining, curr):
            # Base case
            if remaining == 0:
                res.append(combinations[:])
                return
            elif remaining < 0:
                return
            
            for i in range(curr, len(candidates)):
                combinations.append(candidates[i])
                # Stay in the same number until base cases reached
                backtrack(combinations, remaining - candidates[i], i)
                # Backtrack
                combinations.pop()

        backtrack([], target, 0)
        return res
```

---

[__46. Permutations__](https://leetcode.com/problems/permutations/)

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

[__47. Permutations II__](https://leetcode.com/problems/permutations-ii/)

Given a collection of numbers, ```nums```, that might contain duplicates, return _all possible unique permutations in any order_.

__Example_:
```
Input: nums = [1,1,2]
Output:
[[1,1,2],
 [1,2,1],
 [2,1,1]]
```

```Python
class Solution:
    def permuteUnique(self, nums: List[int]) -> List[List[int]]:
        res = list()

        def backtrack(curr):
            # Base case
            if curr == len(nums) and not nums in res:
                res.append(nums[:])
                return
            
            for i in range(curr, len(nums)):
                nums[i], nums[curr] = nums[curr], nums[i]
                backtrack(curr + 1)
                nums[i], nums[curr] = nums[curr], nums[i]

        backtrack(0)
        return res
```

```Python
        res = list()

        def backtrack(permutations, counter):
            # Base case
            if len(permutations) == len(nums):
                '''
                res.append(permutations[:])
                '''
                res.append(list(permutations))
                return
            
            for num in counter:
                # To avoid the duplicate permutations 
                if counter[num] > 0:
                    permutations.append(num)
                    # Update the frequency of num
                    counter[num] -= 1

                    # Move on to the next element in nums to add into permutations
                    backtrack(permutations, counter)

                    # Backtrack
                    permutations.pop()
                    counter[num] += 1

        backtrack([], collections.Counter(nums))
        return res
```

---

[__78. Subsets__](https://leetcode.com/problems/subsets/)

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

[__90. Subsets II__](https://leetcode.com/problems/subsets-ii/)

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



