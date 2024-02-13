## [276. Paint Fence](https://leetcode.com/problems/paint-fence)

```Tag```: ```Dynamic Programming```

#### Difficulty: Medium

You are painting a fence of ```n``` posts with ```k``` different colors. You must paint the posts following these rules:

- Every post must be painted __exactly one__ color.
- There __cannot__ be three or more __consecutive__ posts with the same color.

Given the two integers ```n``` and ```k```, return _the number of ways you can paint the fence_.

![image](https://user-images.githubusercontent.com/35042430/220183689-88bb2baf-cb55-49a5-a1b3-498ff2845cae.png)

---

Example 1:

![image](https://assets.leetcode.com/uploads/2021/02/28/paintfenceex1.png)
```
Input: n = 3, k = 2
Output: 6
Explanation: All the possibilities are shown.
Note that painting all the posts red or all the posts green is invalid because there cannot be three posts in a row with the same color.
```

__Example 2:__
```
Input: n = 1, k = 1
Output: 1
```

__Example 3:__
```
Input: n = 7, k = 2
Output: 42
```

__Constraints:__

- ```1 <= n <= 50```
- ```1 <= k <= 105```
- The testcases are generated such that the answer is in the range ```[0, 2^31 - 1]``` for the given ```n``` and ```k```.

---

A dynamic programming algorithm typically has 3 components. Learning these components is extremely valuable, as most dynamic programming problems can be solved this way.

- First, we need some function or array that represents the answer to the problem for a given state. For this problem, let's say that we have a function ```dp```, where ```dp(i)``` returns the number of ways to paint ```i``` posts. Because we only have one argument, this is a one-dimensional dynamic programming problem.

- Second, we need a way to transition between states, such as ```dp(3)``` and ```dp(4)```. This is called a __recurrence relation__ and figuring it out is usually the hardest part of solving a problem with dynamic programming.

![image](https://user-images.githubusercontent.com/35042430/220188990-179d012d-5083-404c-8369-7753e0a24f03.png)

- The third component is establishing __base cases__. If we have one post, there are ```k``` ways to paint it. If we have two posts, then there are ```k * k``` ways to paint it (since we are allowed to paint two posts in a row be the same color). Therefore, ```dp(1) = k```, ```dp(2) = k * k```.

### The Framework

#### Top-Down Dynamic Programming (Recursion)

```Python
class Solution:
    def numWays(self, n: int, k: int) -> int:
        # Top-Down DP (Recursion)
        memo = collections.defaultdict(int)

        def dp(i):
            # Base case
            # Check if there is only 1 post, number of ways = number of k
            if i == 1:
                return i * k
            # Check if there are 2 posts, number of ways = k * k
            if i == 2:
                return k * k
            
            if i in memo:
                return memo[i]

            # Recurrence relation
            # Less 1 paint from k to paint every time
            # Paint the current post different color than the previous post: (k - 1) * dp(i - 1)
            # Paint the current post same color as the previous post: (k - 1) * dp(i - 2)
            memo[i] = (k - 1) * (dp(i - 1) + dp(i - 2))

            return memo[i]

        return dp(n)
```

```Python
class Solution:
    def numWays(self, n: int, k: int) -> int:
        # Top-Down DP (Recursion)
        @lru_cache(None)
        def dp(i):
            # Base case
            # Check if there is only 1 post, number of ways = number of k
            if i == 1:
                return i * k
            # Check if there are 2 posts, number of ways = k * k
            if i == 2:
                return k * k

            # Recurrence relation
            # Less 1 paint from k to paint every time
            # Paint the current post different color than the previous post: (k - 1) * dp(i - 1)
            # Paint the current post same color as the previous post: (k - 1) * dp(i - 2)
            i = (k - 1) * (dp(i - 1) + dp(i - 2))

            return i

        return dp(n)
```

#### Bottom-Up Dynamic Programming (Tabulation)

```Python
class Solution:
    def numWays(self, n: int, k: int) -> int:
        # Bottom-Up DP (Tabulation)
        dp = collections.defaultdict(int)

        dp[1], dp[2] = k, k**2

        for i in range(3, n + 1):

            dp[i] = (k - 1) * (dp[i - 1] + dp[i - 2])
        
        return dp[n]
```

#### Optimized Space Dynamic Programming (Tabulation)

```Python
class Solution:
    def numWays(self, n: int, k: int) -> int:
        if n == 1:
            return k

        two_prev_posts = k
        one_prev_post = k**2

        for i in range(3, n + 1):
            tmp = one_prev_post
            one_prev_post = (k - 1) * (two_prev_posts + one_prev_post)
            two_prev_posts = tmp

        return one_prev_post
```
