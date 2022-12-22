## [494. Target Sum](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Concepts/Dynamic%20Programming/494.%20Target%20Sum)

---

### Depth-First Search with Top-Down Dynamic Programming with Memoization

```Python
class Solution:
    def findTargetSumWays(self, nums: List[int], target: int) -> int:        
        # Depth-First Search with Top-Down Dynamic Programming with Memoization
        memo = dict()
        def dfs(nums, idx, total, target, memo):
            if idx == len(nums):
                if total == target:
                    return 1
                else:
                    return 0
            else:
                if (idx, total) in memo:
                    return memo[(idx, total)]
            ways = dfs(nums, idx + 1, total + nums[idx], target, memo) + dfs(nums, idx + 1, total - nums[idx], target, memo)
            memo[(idx, total)] = ways
            return ways
        dfs(nums, 0, 0, target, memo)
        return memo[(0, 0)]
```

```Python
class Solution:
    def findTargetSumWays(self, nums: List[int], target: int) -> int:
        # Depth-First Search
        ### Brute Force
        ### Time Limit Exceeded
        #### Time Complexity: O(2^N), size of recursion tree, two recursive calls up to the size of input array  
        #### Space Complexity: O(N), the depth of the recusion tree go up to the size of input array
        res = [0]

        def dfs(nums, idx, total, target):
            if idx == len(nums):
                if total == target:
                    res[0] += 1
            else:
                dfs(nums, idx + 1, total + nums[idx], target)
                dfs(nums, idx + 1, total - nums[idx], target)

        dfs(nums, 0, 0, target)
        return res.pop()
```
        
```Python
class Solution:
    def findTargetSumWays(self, nums: List[int], target: int) -> int:        
        # Depth-First Search with Top-Down Dynamic Programming with Memoization
        #### Time Complexity: O(N * M), traverse through 2D array memo
        #### Space Complexity: O(N * M), to build 2D array memo
        
        def dfs(nums, idx, total, target, memo):
            if idx == len(nums):
                if total == target:
                    return 1
                else:
                    return 0
            else:
                if memo[idx][total + sum(nums)] > -float('inf'):
                    return memo[idx][total + sum(nums)]
                add = dfs(nums, idx + 1, total + nums[idx], target, memo)
                sub = dfs(nums, idx + 1, total - nums[idx], target, memo)
                memo[idx][total + sum(nums)] = add + sub
                return memo[idx][total + sum(nums)]

        memo = [[-float('inf')] * (2 * sum(nums) + 1) for _ in range(len(nums))]       
         return dfs(nums, 0, 0, target, memo)
```
