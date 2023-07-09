## [1137. N-th Tribonacci Number](https://leetcode.com/problems/n-th-tribonacci-number/)

```Tag```: ```Dynamic Programming``` ```Recursion``` ```Backtracking``` ```Hash Table```

#### Difficulty: Easy

The Tribonacci sequence Tn is defined as follows: 

T<sub>0</sub> = 0, T<sub>1</sub> = 1, T<sub>2</sub> = 1, and T<sub>n+3</sub> = T<sub>n</sub> + T<sub>n+1</sub> + T<sub>n+2</sub> for n >= 0.

Given ```n```, return _the value of T<sub>n</sub>_.

![image](https://user-images.githubusercontent.com/35042430/215408044-3d540d06-efba-4207-9746-dd48893fa4a0.png)

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
- The answer is guaranteed to fit within a 32-bit integer, ie. answer <= 2^31 - 1.

---

![image](https://leetcode.com/problems/n-th-tribonacci-number/solutions/348243/Figures/1137/methods.png)

### Optimized Space

#### Dynamic Programming with Memoization using Hash Map

```Python
class Solution:
    def tribonacci(self, n: int) -> int:
        # Dynamic Programming with Memoization using Hash Map
        #### Time Complexity: O(N), traverse through the size of n
        #### Space Complexity: O(N), extra memory space to build hash map up to n numbers
        memo = collections.defaultdict(int)
        memo[0], memo[1], memo[2] = 0, 1, 1
        for i in range(3, n+1):
            memo[i] = memo[i-1] + memo[i-2] + memo[i-3]
        return memo[n]
```

#### Dynamic Programming with Optimized Memoization (O(1) space) using List 

```Python
class Solution:
    def tribonacci(self, n: int) -> int:
        # Dynamic Programming with Optimized Memoization (O(1) space) using List 
        #### Time Complexity: O(N), traverse through the size of n
        #### Space Complexity: O(1), constant memory of 3 
        cache = [[] * (3) for _ in range(3)]
        cache[0], cache[1], cache[2] = 0, 1, 1
        for i in range(3, n+1):
            cache[i % 3] = cache[0] + cache[1] + cache[2]
        return cache[n % 3]
```

#### Dynamic Programming with Optimized Memoization (O(1) space) using Hash Map 

```Python
class Solution:
    def tribonacci(self, n: int) -> int:
        # Dynamic Programming with Optimized Memoization (O(1) space) using Hash Map
        #### Time Complexity: O(N), traverse through the size of n
        #### Space Complexity: O(1), constant memory of 3 
        memo = collections.defaultdict(int)
        memo[0], memo[1], memo[2] = 0, 1, 1
        for i in range(3, n+1):
            memo[i % 3] = memo[0] + memo[1] + memo[2]
        return memo[n % 3]
```

### Optimize Runtime Performance

#### Recursion with Memoization

```Python
# Precompute Tribonacci number
class Tribonacci:
    def __init__(self) -> None:
        n = 38
        self.memo = [0] * n
        self.memo[1] = self.memo[2] = 1

        def helper(k):
            if k == 0:
                return 0

            if self.memo[k]:
                return self.memo[k]

            self.memo[k] = helper(k-1) + helper(k-2) + helper(k-3)
            return self.memo[k]

        helper(n - 1)

class Solution:
    def tribonacci(self, n: int) -> int:
        # Recursion with Memoization
        #### Time Complexity: O(1), to retrieve the preliminary computed Tribonacci number
        #### Space Complexity: O(1), constant space up to the constraint
        tri = Tribonacci()
        return tri.memo[n]
```

#### Iterative Memoization

```Python
# Precomputing Tribonacci number
class Tribonacci:
    def __init__(self) -> None:
        n = 38
        self.memo = [0] * n
        self.memo[1] = self.memo[2] = 1
        for i in range (3, n):
            self.memo[i] = self.memo[i-1] + self.memo[i-2] + self.memo[i-3]

class Solution:
    def tribonacci(self, n: int) -> int:
        # Recursion with Memoization
        #### Time Complexity: O(1), to retrieve the preliminary computed Tribonacci number
        #### Space Complexity: O(1), constant space up to the constraint
        tri = Tribonacci()
        return tri.memo[n]
```

```Python
# Precomputing Tribonacci number
class Tribonacci:
    def __init__(self) -> None:
        n = 38
        self.memo = collections.defaultdict(int)
        self.memo[0], self.memo[1], self.memo[2] = 0, 1, 1
        for i in range(3, n):
            self.memo[i] = self.memo[i-3] + self.memo[i-2] + self.memo[i-1]

class Solution:
    def tribonacci(self, n: int) -> int:
        # Recursion with Memoization
        #### Time Complexity: O(1), to retrieve the preliminary computed Tribonacci number
        #### Space Complexity: O(1), constant space up to the constraint
        tri = Tribonacci()
        return tri.memo[n]
```
