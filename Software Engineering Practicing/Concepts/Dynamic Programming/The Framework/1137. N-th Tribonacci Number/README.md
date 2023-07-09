## [1137. N-th Tribonacci Number](https://leetcode.com/problems/n-th-tribonacci-number)

```Tag```: ```Dynamic Programming``` ```Recursion```

#### Difficulty: Easy

![image](https://user-images.githubusercontent.com/35042430/218800745-28d757a5-ebbd-4e37-acd9-47e5e4d0e9df.png)

![image](https://user-images.githubusercontent.com/35042430/218800779-f7e4a449-9356-4d98-844b-3126740052ab.png)

---

__Example 1:__
```
Input: n = 4
Output: 4
Explanation:
T_3 = 0 + 1 + 1 = 2
T_4 = 1 + 1 + 2 = 4
```

__Example 2:__
```
Input: n = 25
Output: 1389537
```

__Constraints:__

- ```0 <= n <= 37```
- The answer is guaranteed to fit within a 32-bit integer, ie. ```answer <= 2^31 - 1```.

---

### Brute Force

```Python
class Solution:
    def tribonacci(self, n: int) -> int:
        if n == 0:
            return 0
        elif n == 1:
            return 1
        elif n == 2:
            return 1
        elif n == 3:
            return 2
        elif n == 4:
            return 4
        else:
            return self.tribonacci(n - 1) + self.tribonacci(n - 2) + self.tribonacci(n - 3)
```

---

### The Framework

#### Top-Down DP (Recursion)

__Time Complexity__: ```O(N)```, recursive call up to N

__Space Complexity__: ```O(N)```, recursive stack call size

```Python
class Solution:
    def tribonacci(self, n: int) -> int:
        # Top-Down DP (Recursion)
        memo = collections.defaultdict(int)
        memo[0], memo[1], memo[2], memo[3], memo[4], memo[5], memo[25] = 0, 1, 1, 2, 4, 7, 1389537

        def dp(num):
            if not num in memo:
                memo[num] = dp(num-1) + dp(num-2) + dp(num-3)
            return memo[num]
        return dp(n)
```

```Python
class Solution:
    def tribonacci(self, n: int) -> int:
        memo = collections.defaultdict(int)

        def dp(curr):
            # Base case
            if curr == 0:
                memo[curr] = 0
            elif curr == 1:
                memo[curr] = 1
            elif curr == 2:
                memo[curr] = 1
            elif curr in memo:
                return memo[curr]
            else:
                # Recurrence relation
                memo[curr] = dp(curr - 1) + dp(curr - 2) + dp(curr - 3)

            return memo[curr]
        
        return dp(n)
```

```Python
class Solution:
    def tribonacci(self, n: int) -> int:
        @lru_cache(None)
        def dp(curr):
            # Base case
            if curr == 0:
                return 0
            elif curr == 1:
                return 1
            elif curr == 2:
                return 1
            elif curr == 3:
                return 2
            elif curr == 4:
                return 4
            else:
                return dp(curr - 1) + dp(curr - 2) + dp(curr - 3)
            
        return dp(n)
```

#### Bottom-Up DP (Tabulation)

__Time Complexity__: ```O(N)```, iterate through the entire input array

__Space Complexity__: ```O(N)```, hash map memo size

```Python
class Solution:
    def tribonacci(self, n: int) -> int:
        dp = collections.defaultdict(int)
        dp[0], dp[1], dp[2] = 0, 1, 1

        for curr in range(3, n + 1):
            dp[curr] = dp[curr - 1] + dp[curr - 2] + dp[curr - 3]            

        return dp[n]
```

```Python
class Solution:
    def tribonacci(self, n: int) -> int:
        # Bottom-Up DP (Tabulation)
        memo = collections.defaultdict(int)
        memo[0], memo[1], memo[2], memo[3], memo[4], memo[5], memo[8], memo[25] = 0, 1, 1, 2, 4, 7, 44, 1389537
        for num in range(6, n + 1):
            memo[num] = memo[num-3] + memo[num-2] + memo[num-1]
        return memo[n]
```


#### Space Optimized Bottom-Up DP (Tabulation)

__Time Complexity__: ```O(N)```, iterate to n

__Space Complexity__: ```O(1)```, fixed memory usage of only 3

```Python
class Solution:
    def tribonacci(self, n: int) -> int:
        # Bottom-Up DP (Tabulation)
        memo = collections.defaultdict(int)
        memo[0], memo[1], memo[2] = 0, 1, 1
        for i in range(3, n + 1):
            memo[i % 3] = memo[0] + memo[1] + memo[2]
        return memo[n % 3]
```

---

### Precomputing

#### Recursive Approach

```Python
# Precomputing Tribonacci number
class Tribonacci:
    def __init__(self) -> None:
        def dp(k):
            if k == 0:
                return 0

            if nums[k]:
                return nums[k]
                
            nums[k] = helper(k-1) + helper(k-2) + helper(k-3)
            return nums[k]

        n = 38
        self.nums = nums = [0] * n
        nums[1] = nums[2] = 1
        helper(n - 1)

class Solution:
    def tribonacci(self, n: int) -> int:
        tri = Tribonacci()
        return tri.nums[n]
```

#### Iterative Approach

```Python
# Precomputing Tribonacci number
class Tribonacci:
    def __init__(self) -> None:
        n = 38
        self.nums = [0] * n
        self.nums[1] = self.nums[2] = 1
        for i in range (3, n):
            self.nums[i] = self.nums[i-1] + self.nums[i-2] + self.nums[i-3]

class Solution:
    def tribonacci(self, n: int) -> int:
        # Recursion with Memoization
        #### Time Complexity: O(1), to retrieve the preliminary computed Tribonacci number
        #### Space Complexity: O(1), constant space up to the constraint
        tri = Tribonacci()
        return tri.nums[n]
```
