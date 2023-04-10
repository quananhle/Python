## [50. Pow(x, n)](https://leetcode.com/problems/powx-n)

```Tag```: ```Recursion``` ```Binary Search``` ```Dynamic Programming```

#### Difficulty: Medium

Implement ```pow(x, n)```, which calculates ```x``` raised to the power ```n``` (i.e., x<sup>n</sup>).

![image](https://user-images.githubusercontent.com/35042430/216752099-4f762004-0675-4164-ac4c-06ea69a8e56b.png)

---

__Example 1:__
```
Input: x = 2.00000, n = 10
Output: 1024.00000
```

__Example 2:__
```
Input: x = 2.10000, n = 3
Output: 9.26100
```

__Example 3:__
```
Input: x = 2.00000, n = -2
Output: 0.25000
Explanation: 2-2 = 1/22 = 1/4 = 0.25
```

__Constraints:__

- ```-100.0 < x < 100.0```
- -2<sup>31</sup> <= ```n``` <= 2<sup>31</sup> - 1
- ```n``` is an integer.
- -10<sup>4</sup> <= x<sup>n</sup> <= 10<sup>4</sup>

---

### Brute Force

#### Time Limit Exceeded

```Python
class Solution:
    def myPow(self, x: float, n: int) -> float:
        # Brute Force
        ### Time Limit Exceeded
        """
        if not x:
            return 0
        if not n or x == 1:
            return 1
        if n < 0:
            x = 1/x
            n = -n
        ans = x
        for _ in range(2, n+1):
            ans *= x
        return ans
```

### The Framework

#### Top-Down Dynamic Programming

```Python
class Solution:
    def myPow(self, x: float, n: int) -> float:
        # Top-Down Dynamic Programming
        memo = collections.defaultdict(int)

        def dp(x, n):
            # Base cases
            if x == 0:
                return 0
            if n == 0 or x == 1:
                return 1

            if (x, n) in memo:
                return memo[(x, n)]

            # Recurrence relation
            if n % 2 == 0:
                memo[(x, n)] = dp(x, n // 2) * dp(x, n // 2)
            else:
                memo[(x, n)] = x * dp(x, n // 2) * dp(x, n // 2)
            
            return memo[(x, n)]

        ans = dp(x, abs(n))

        if n < 0:
            return 1 / ans

        return ans
```

```Python
class Solution:
    def myPow(self, x: float, n: int) -> float:
        # Top-Down Dynamic Programming
        @lru_cache(maxsize=None)
        def dp(x, n):
            # Base cases
            if x == 0:
                return 0
            if n == 0 or x == 1:
                return 1

            # Convert negative power to positive power
            if n < 0:
                x = 1 / x
                n = -n

            # Recurrence relation
            if n % 2 == 0:
                return dp(x, n // 2) * dp(x, n // 2)

            return x * dp(x, n // 2) * dp(x, n // 2)

        return dp(x, n)
```

```Python
class Solution:
    def myPow(self, x: float, n: int) -> float:
        # Top-Down Dynamic Programming
        @lru_cache(maxsize=None)
        def dp(x, n):
            # Base cases
            if x == 0:
                return 0
            if n == 0 or x == 1:
                return 1

            # Recurrence relation
            if n % 2 == 0:
                return dp(x, n // 2) * dp(x, n // 2)

            return x * dp(x, n // 2) * dp(x, n // 2)

        ans = dp(x, abs(n))

        if n < 0:
            return 1 / ans

        return ans
```

#### Bottom-Up Dynamic Programming

```Python
class Solution:
    def myPow(self, x: float, n: int) -> float:
        if not x:
            return 0
        if not n or x == 1:
            return 1
        if n < 0:
            x = 1/x
            n = -n

        cache = [0] * (n + 1)
        cache[0], cache[1] = 1, x

        for i in range(2, len(cache)):
            cache[i] = x * cache[i-1]

        return cache[n]
```

```Python
class Solution:
    def myPow(self, x: float, n: int) -> float:
        if not x:
            return 0
        if not n or x == 1:
            return 1

        if n < 0:
            x = 1/x
            n = -n

        cache = collections.defaultdict(int)
        cache[0], cache[1] = 1, x

        for i in range(2, n + 1):
            cache[i] = x * cache[i-1]

        return cache[n]
```

---

### Fast Power Algorithm

#### Recursive Approach

![image](https://user-images.githubusercontent.com/35042430/216752727-5ab9120e-6cb4-4458-9dc4-94f7278f927d.png)

#### Algorithm

![image](https://user-images.githubusercontent.com/35042430/216752885-c966f64e-13b2-41af-8098-eb2c65a9f945.png)

- __Time complexity__: ```O(log⁡n)```
- __Space complexity__: ```O(log⁡n)```

```Python
class Solution:
    def myPow(self, x: float, n: int) -> float:
        # Edge cases
        if n < 0:
            x = 1/x
            n = -n
        
        def fast_power(x, n):
            # Base cases
            if not x:
                return 0
            if not n or x == 1:
                return 1

            half = fast_power(x, n // 2)

            if n % 2 == 0:
                return half * half
            else:
                return half * half * x
        
        return fast_power(x, n)
```

#### Iterative Approach

- __Time complexity__: ```O(log⁡n)```
- __Space complexity__: ```O(1)```

```Python
class Solution:
    def myPow(self, x: float, n: int) -> float:
        # Base cases
        if not x:
            return 0
        if n == 0:
            return 1
        # Edge cases
        if n < 0:
            x = 1/x
            n = -n

        ans, cur = 1, x

        while n > 0: 
            if n % 2 == 1:
                ans *= cur
            cur *= cur
            n //= 2
        return ans
```
