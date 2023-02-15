## Framework for DP Problems

### The Framework

To solve a DP problem, we need to combine 3 things:

#### 1. A function or data structure that will compute/contain the answer to the problem for every given state.
#### 2. A recurrence relation to transition between states.
#### 3. Base cases, so that our recurrence relation doesn't go on infinitely.

Problem [Climbing Stairs](https://leetcode.com/problems/climbing-stairs/) as an example, with a top-down (recursive) implementation

#### Top-down Implementation

```Python
class Solution:
    def climbStairs(self, n: int) -> int:
        #### Time complexity: O(n)
        def dp(i):
            if i <= 2: 
                return i
            if i not in memo:
                # Instead of just returning dp(i - 1) + dp(i - 2), calculate it once and then
                # store the result inside a hashmap to refer to in the future.
                memo[i] = dp(i - 1) + dp(i - 2)
            
            return memo[i]
        
        memo = {}
        return dp(n)
```

```
You may notice that a hashmap is overkill for caching here, and an array can be used instead. This is true, 
but using a hashmap isn't necessarily bad practice as some DP problems will require one, and they're hassle-free 
to use as you don't need to worry about sizing an array correctly. Furthermore, when using top-down DP, some 
problems do not require us to solve every single subproblem, in which case an array may use more memory than a hashmap.
```

#### Bottom-Up Implementation

```Python
    def climbStairs(self, n: int) -> int:
        if n == 1:
            return 1
            
        # An array that represents the answer to the problem for a given state
        dp = [0] * (n + 1)
        dp[1] = 1 # Base cases
        dp[2] = 2 # Base cases
        
        for i in range(3, n + 1):
            dp[i] = dp[i - 1] + dp[i - 2] # Recurrence relation

        return dp[n]
```

---

### Multidimensional DP

The following are common things to look out for in DP problems that require a state variable:

1. An index along some input. This is usually used if an input is given as an array or string. This has been the sole state variable for all the problems that we've looked at so far, and it has represented the answer to the problem if the input was considered only up to that index - for example, if the input is 
```nums = [0, 1, 2, 3, 4, 5, 6]```, then ```dp(4)``` would represent the answer to the problem for the input ```nums = [0, 1, 2, 3, 4]```

2. A second index along some input. Sometimes, you need two index state variables, say ```i``` and ```j```. In some questions, these variables represent the answer to the original problem if you considered the input starting at index ```i``` and ending at index ```j```. Using the same example above, ```dp(1, 3)``` would solve the problem for the input ```nums = [1, 2, 3]```, if the original input was ```[0, 1, 2, 3, 4, 5, 6]```

3. Explicit numerical constraints given in the problem. For example, ```"you are only allowed to complete k transactions"```, or ```"you are allowed to break up to 
k obstacles"```, etc.

4. Variables that describe statuses in a given state. For example ```"true if currently holding a key, false if not"```, ```"currently holding k packages"``` etc.

5. Some sort of data like a tuple or bitmask used to indicate things being "visited" or "used". For example, "bitmask is a mask where the i<sup>th</sup> bit indicates if the i<sup>th</sup> city has been visited". Note that mutable data structures like arrays cannot be used - typically, only immutable data structures like numbers and strings can be hashed, and therefore memoized.

---

### Top-down to Bottom-up

__Usually__ a __top-down algorithm__ is easier to implement than the equivalent __bottom-up__ algorithm. With that being said, it is useful to know how to take a completed top-down algorithm and convert it to bottom-up. There's a number of reasons for this: first, in an interview, if you solve a problem with top-down, you may be asked to rewrite your solution in an iterative manner (using bottom-up) instead. Second, as we mentioned before, bottom-up usually is __more efficient__ than top-down in terms of runtime.

![image](https://user-images.githubusercontent.com/35042430/218861062-78dd5765-e3cb-4c36-9ebb-a40d334a5a12.png)
