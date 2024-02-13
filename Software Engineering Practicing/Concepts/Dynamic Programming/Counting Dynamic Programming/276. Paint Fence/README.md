## [276. Paint Fence](https://leetcode.com/problems/paint-fence)

```Tag```: ```Dynamic Programming``` ```Recursion```

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

### Brute Foce

```Python
class Solution:
    def numWays(self, n: int, k: int) -> int:
        if n == 1:
            return k
        elif n == 2:
            return k * k
        else:
            return (k - 1) * (self.numWays(n - 1, k) + self.numWays(n - 2, k))
```

```Python
class Solution:
    def numWays(self, n: int, k: int) -> int:
        def total_ways(curr_fence, paints):
            # Base cases:
            # If there is only 1 fence, number of ways to paint = number of k paints
            if curr_fence == 1:
                return paints
            # If there are 2 fences, number of ways to paint = number of k paints * k
            elif curr_fence == 2:
                return paints * paints
            # If there are 3 or more fences, there are two ways:
            #   - Choose the differenet paint
            #   - Chose the same paint, as long as (curr_fence-2)th fence has different paint
            else:
                return (paints - 1) * (total_ways(curr_fence - 1, paints) + total_ways(curr_fence - 2, paints))

        return total_ways(n, k)
```

A dynamic programming algorithm typically has 3 components. Learning these components is extremely valuable, as most dynamic programming problems can be solved this way.

- First, we need some function or array that represents the answer to the problem for a given state. For this problem, let's say that we have a function ```dp```, where ```dp(i)``` returns the number of ways to paint ```i``` posts. Because we only have one argument, this is a one-dimensional dynamic programming problem.

- Second, we need a way to transition between states, such as ```dp(3)``` and ```dp(4)```. This is called a __recurrence relation__ and figuring it out is usually the hardest part of solving a problem with dynamic programming.

![image](https://user-images.githubusercontent.com/35042430/220188990-179d012d-5083-404c-8369-7753e0a24f03.png)

- The third component is establishing __base cases__. If we have one post, there are ```k``` ways to paint it. If we have two posts, then there are ```k * k``` ways to paint it (since we are allowed to paint two posts in a row be the same color). Therefore, ```dp(1) = k```, ```dp(2) = k * k```.

### Dynamic Programming Framework

![image](https://leetcode.com/problems/paint-fence/Figures/276/276_1.png)

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

        @functools.lru_cache(maxsize=None)
        def dp(curr_post):
            # Base case
            if curr_post == 1:
                return k
            if curr_post == 2:
                return k * k
            
            # DP Transitions: choose the same paint or choose the different paint for the current post?
            # - Choose the different paint, move on to the next post
            diff = (k - 1) * dp(curr_post - 1)
            # - Choose the same paint, iff (curr_post-2)th post has different color than (curr_post-1)th fence
            same = (k - 1) * dp(curr_post - 2) 
            
            # Add two scenarios together
            return diff + same
        
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
