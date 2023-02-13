## 78. Subsets

```Tag```: ```Backtracking```

#### Difficulty: Medium

Given an integer array ```nums``` of unique elements, return _all possible subsets_ (the power set).

The solution set must not contain duplicate subsets. Return the solution in any order.

![image](https://user-images.githubusercontent.com/35042430/218276564-bb1b1b0b-2f7a-4a81-86bc-4e34250b1975.png)

---

__Example 1:__
```
Input: nums = [1,2,3]
Output: [[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]
```

__Example 2:__
```
Input: nums = [0]
Output: [[],[0]]
```

__Constraints:__

- ```1 <= nums.length <= 10```
- ```-10 <= nums[i] <= 10```
- All the numbers of ```nums``` are unique.

---

![image](https://leetcode.com/problems/subsets/solutions/464411/Figures/78/recursion.png)

### Cascading

```Python
class Solution:
    def subsets(self, nums: List[int]) -> List[List[int]]:
        n = len(nums)
        res = [[]]
        for num in nums:
            res += [curr + [num] for curr in res]
        return res
```

### Backtracking

![image](https://leetcode.com/problems/subsets/solutions/464411/Figures/78/combinations.png)

![image](https://leetcode.com/problems/subsets/solutions/464411/Figures/78/backtracking.png)

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
