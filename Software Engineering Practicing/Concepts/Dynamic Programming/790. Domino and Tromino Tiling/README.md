## [790. Domino and Tromino Tiling](https://leetcode.com/problems/domino-and-tromino-tiling/)

```Tag```: ```Dynamic Programming``` ```Recursion``` ```Matrix```

#### Difficulty: Medium

You have two types of tiles: a ```2 x 1``` domino shape and a tromino shape. You may rotate these shapes.

![image](https://assets.leetcode.com/uploads/2021/07/15/lc-domino.jpg)

Given an integer ```n```, return _the number of ways to tile an ```2 x n``` board_. Since the answer may be very large, return it modulo 10<sup>9</sup> + 7_.

In a tiling, every square must be covered by a tile. Two tilings are different if and only if there are two 4-directionally adjacent cells on the board such that exactly one of the tilings has both squares occupied by a tile.

![image](https://user-images.githubusercontent.com/35042430/221771308-61e31597-bea4-4bf4-920c-503a8ba71e30.png)

---

__Example 1__:


![image](https://assets.leetcode.com/uploads/2021/07/15/lc-domino1.jpg)
```
Input: n = 3
Output: 5
Explanation: The five different ways are show above.
```

__Example 2:__
```
Input: n = 1
Output: 1
```

__Constraints:__

- ```1 <= n <= 1000```

---

Why Dynamic Programming?

When a question asks us to minimize, maximize, or find the number of ways to do something, it doesn't always mean that dynamic programming is the best approach, but it is usually a good indicator that we should at least consider using a dynamic programming approach.

The number of ways to reach the current state depends on the number of ways to reach the previous state. This can be seen in the functions ```f(k)``` and ```p(k)``` which depend on previous fully and partially filled boards. When using dynamic programming, these functions are called transition functions.

![image](https://user-images.githubusercontent.com/35042430/221780869-587ad2ef-8c31-42e5-b88e-7508141e3448.png)

### The Framework

#### Top-Down Dynamic Programming (Recursion)

```Python
class Solution:
    def numTilings(self, n: int) -> int:
        MOD = 10**9 + 7
        # # Top-Down DP (Recursion)
        @lru_cache(None)
        def p(i):
            if i == 2:
                return 1
            return (p(i - 1) + f(i - 2)) % MOD
        
        @lru_cache(None)
        def f(i):
            if i <= 2:
                return i
            return (f(i - 1) + f(i - 2) + 2 * p(i - 1)) % MOD

        return f(n)
```

#### Bottom-Up Dynamic Programming (Tabulation)

```Python
class Solution:
    def numTilings(self, n: int) -> int:
        # Bottom-Up DP (Tabulation)
        MOD = 10**9 + 7
        if n <= 2:
            return n
        
        # f[k]: number of ways to fully cover a board of width k
        f = [0] * (n + 1)

        # p[k]: number of ways to partially cover a board of width k
        p = [0] * (n + 1)

        # Initialize f and p with base cases
        f[1] = 1
        f[2] = 2
        p[2] = 1

        for k in range(3, n + 1):
            f[k] = (f[k - 1] + f[k - 2] + 2 * p[k - 1]) % MOD
            P[k] = (p[k - 1] + f[k - 2]) % MOD
            
        return f[n]
```

#### Optimized-Space Dynamic Programming

```Python
class Solution:
    def numTilings(self, n: int) -> int:
        MOD = 10**9 + 7
        if n <= 2:
            return n
        
        f_prev = 1
        f_curr = 2
        p_curr = 1

        for k in range(3, n + 1):
            tmp = f_curr
            f_curr = (f_curr + f_prev + 2 * p_curr) % MOD
            p_curr = (p_curr + f_prev) % MOD
            f_prev = tmp
            '''
            f_prev, f_curr, p_curr = f_curr, (f_curr + f_prev + 2 * p_curr) % MOD, (p_curr + f_prev) % MOD
            '''
        return f_curr
```

#### Math Optimization (Fibonacci sequence like)

![image](https://leetcode.com/problems/domino-and-tromino-tiling/Documents/790/fibonacci-like-derive.svg)

![image](https://user-images.githubusercontent.com/35042430/222278385-c6224f0e-2a54-4d0d-8574-8a92d43e9eee.png)

```Python
class Solution:
    def numTilings(self, n: int) -> int:
        MOD = 10**9 + 7
        if n <= 2:
            return n

        f_curr = 5
        f_one_prev = 2
        f_two_prev = 1

        for k in range(4, n + 1):
            '''
            tmp = f_one_prev 
            f_one_prev = f_curr
            f_curr = (2 * f_curr + f_two_prev) % MOD
            f_two_prev = tmp
            '''
            f_two_prev, f_one_prev, f_curr = f_one_prev, f_curr, (2 * f_curr + f_two_prev) % MOD

        return f_curr
```

---

### Matrix Exponentiation

```
f(k) = f(k − 1) + f(k − 2) + 2 ∗ p(k − 1)

p(k) = p(k − 1) + f(k − 2)
```

![image](https://leetcode.com/problems/domino-and-tromino-tiling/Documents/790/matrix_expo_1.svg)

Notice, the 1, 1, 2 in the first row corresponds to the one ```f(k − 1)```, one ```f(k − 2)```, and two ```p(k − 1)``` that add up to ```f(k)```.

By replacing ```k``` with ```k−1```, we will get:

![image](https://leetcode.com/problems/domino-and-tromino-tiling/Documents/790/matrix_expo_2.svg)

Take the equation above and insert it in the first equation. This gives us the following equation:

![image](https://leetcode.com/problems/domino-and-tromino-tiling/Documents/790/matrix_expo_3.svg)

This process can be repeated until the base case is reached:

![image](https://leetcode.com/problems/domino-and-tromino-tiling/Documents/790/matrix_expo_4.svg)

```Python
class Solution:
    def numTilings(self, n: int) -> int:
        MOD = 10**9 + 7
        SQ_MATRIX = [[1, 1, 2], [1, 0, 0], [0, 1, 1]] # Initialize square matrix
        SIZE = 3 # Width/Length of square matrix

        def matrix_product(m1, m2):  
            """Return product of 2 square matrices."""
            nonlocal MOD, SIZE
            # Result matrix `ans` will also be a square matrix with same dimensions.
            ans = [[0] * SIZE for _ in range(SIZE)]  
            for row in range(SIZE):
                for col in range(SIZE):
                    cur_sum = 0
                    for k in range(SIZE):
                        cur_sum += (m1[row][k] * m2[k][col]) % MOD
                    ans[row][col] = cur_sum
            return ans

        def matrix_expo(n):  
            """Perform matrix multiplication n times."""
            cur = SQ_MATRIX
            for _ in range(1, n):
                cur = matrix_product(cur, SQ_MATRIX)
            # The answer will be cur[0][0] * f(2) + cur[0][1] * f(1) + cur[0][2] * p(2)
            return (cur[0][0] * 2 + cur[0][1] * 1 + cur[0][2] * 1) % MOD

        # Handle base cases
        if n <= 2:
            return n  
        
        return matrix_expo(n - 2)
```

#### Time Optimized Matrix Exponentiation

![image](https://leetcode.com/problems/domino-and-tromino-tiling/Documents/790/matrix_expo_optimization.svg)

```Python
class Solution:
    def numTilings(self, n: int) -> int:
        MOD = 10**9 + 7
        SQ_MATRIX = [[1, 1, 2], [1, 0, 0], [0, 1, 1]]  # Initialize square matrix
        SIZE = 3  # Width/Length of square matrix

        def matrix_product(m1, m2):  
            """Return product of 2 square matrices."""
            nonlocal MOD, SIZE
            # Result matrix `ans` will also be a square matrix with same dimension
            ans = [[0] * SIZE for _ in range(SIZE)]  
            for row in range(SIZE):
                for col in range(SIZE):
                    cur_sum = 0
                    for k in range(SIZE):
                        cur_sum = (cur_sum + m1[row][k] * m2[k][col]) % MOD
                    ans[row][col] = cur_sum
            return ans

        @cache  
        def matrix_expo(n):
            nonlocal SQ_MATRIX
            if n == 1:  # base case
                return SQ_MATRIX
            elif n % 2:  # If `n` is odd
                return matrix_product(matrix_expo(n - 1), SQ_MATRIX)
            else:  # If `n` is even
                return matrix_product(matrix_expo(n // 2), matrix_expo(n // 2))

        if n <= 2:
            return n

        # The answer will be cur[0][0] * f(2) + cur[0][1] * f(1) + cur[0][2] * p(2)
        ans = matrix_expo(n - 2)[0]
        return (ans[0] * 2 + ans[1] * 1 + ans[2] * 1) % MOD
```
