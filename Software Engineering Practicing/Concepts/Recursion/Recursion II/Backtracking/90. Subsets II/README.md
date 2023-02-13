## 90. Subsets II

```Tag```: ```Backtracking```

Given an integer array ```nums``` that may contain duplicates, return all possible subsets (the power set).

The solution set must not contain duplicate subsets. Return the solution in any order.

![image](https://user-images.githubusercontent.com/35042430/218507116-ce7d250a-667b-4c59-a5b7-ea2b02f470af.png)

---

__Example 1:__
```
Input: nums = [1,2,2]
Output: [[],[1],[1,2],[1,2,2],[2],[2,2]]
```

__Example 2:__
```
Input: nums = [0]
Output: [[],[0]]
```

__Constraints:__

- ```1 <= nums.length <= 10```
- ```-10 <= nums[i] <= 10```

---

### Cascading

```Python
        res = [[]]
        nums.sort()
        size = 0

        for i in range(len(nums)):
            if i > 0 and nums[i] == nums[i-1]:
                start_idx = size
            else:
                start_idx = 0
            size = len(res)
            for j in range(start_idx, size):
                curr_subset = res[j][:]
                curr_subset.append(nums[i])
                res.append(curr_subset)

        return res
```

### Backtracking

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

```Python

        res = list()
        nums.sort()

        def backtrack(curr, subset):
            res.append(subset[:])

            for i in range(curr, len(nums)):
                # Check if subset not empty or two elements standing next to each other are the same
                if i != curr and nums[i] == nums[i - 1]:
                    continue
                subset.append(nums[i])
                backtrack(i + 1, subset)
                subset.pop()

        backtrack(0, [])
        return res
```
