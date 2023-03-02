## [96. Unique Binary Search Trees](https://leetcode.com/problems/unique-binary-search-trees/)

```Tag```: ```Binary Search Tree``` ```Dynamic Programming```

#### Difficulty: Medium

Given an integer ```n```, return _the number of structurally unique __BST__'s (binary search trees) which has exactly ```n``` nodes of unique values from ```1``` to ```n```_.

![image](https://user-images.githubusercontent.com/35042430/222545807-f83d1bff-13d8-456b-9fb3-7b27290ba6ef.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/01/18/uniquebstn3.jpg)
```
Input: n = 3
Output: 5
```

__Example 2:__
```
Input: n = 1
Output: 1
```

__Constraints:__

- ```1 <= n <= 19```

---

### Brute Force

```Python
class Solution:
    @lru_cache(None)
    def numTrees(self, n: int) -> int:
        # Brute Foce
        if n <= 1:
            return 1
        elif n == 2:
            return 2
        else:
            return sum(self.numTrees(i - 1) * self.numTrees(n - i) for i in range(1, n + 1))
```

---

### The Framework

#### Top-Down Dynamic Programming (Recursion)

```Python
class Solution:
    def numTrees(self, n: int) -> int:
        # Top-Down DP (Recursion)
        @lru_cache(None)
        def dp(low, high):
            # Base case
            if low >= high:
                return 1
            
            res = 0
            # Recurrence relation
            for mid in range(low, high + 1):
                res += dp(low, mid - 1) * dp(mid + 1, high)
            return res

        return dp(1, n)
```

```Python
class Solution:
    def numTrees(self, n: int) -> int:
        # Top-Down DP (Recursion)
        memo = collections.defaultdict(int)
        
        def dp(low, high):
            # Base case
            if low >= high:
                return 1
            
            if (low, high) in memo:
                return memo[(low, high)]

            for mid in range(low, high + 1):
                memo[(low, high)] += dp(low, mid - 1) * dp(mid + 1, high)
            return memo[(low, high)]

        return dp(1, n)
```

```Python
class Solution:
    def numTrees(self, n: int) -> int:
        @lru_cache(None)
        def dp(high):
            # Base case
            if high == 0:
                return 1
            
            res = 0
            # Recurrece relation
            for mid in range(1, high + 1):
                res += dp(mid - 1) * dp(high - mid)
            return res

        return dp(n)
```

#### Bottom-Up Dynamic Programming (Tabulation)

```Python

```

