## [279. Perfect Squares](https://leetcode.com/problems/perfect-squares)

```Tag```: ```Queue``` ```Breadth-First Search``` ```Dynamic Programming``` ```Greedy``` ```Math```

#### Difficulty: Medium

Given an integer ```n```, return _the least number of perfect square numbers that sum to ```n```_.

A __perfect square__ is an integer that is the square of an integer; in other words, it is the product of some integer with itself. For example, ```1```, ```4```, ```9```, and ```16``` are perfect squares while ```3``` and ```11``` are not.

![image](https://github.com/quananhle/Python/assets/35042430/145597b7-f55c-4cdc-a1cd-0273e49cee7e)

---

__Example 1:__
```
Input: n = 12
Output: 3
Explanation: 12 = 4 + 4 + 4.
```

__Example 2:__
```
Input: n = 13
Output: 2
Explanation: 13 = 4 + 9.
```
 
__Constraints:__

- $1 \le n \le 10^4$

---

### Brute Force

#### Recursion

```Python
        square_nums = [i**2 for i in range(1, int(math.sqrt(n))+1)]

        def helper(k):
            if k in square_nums:
                return 1
            ans = math.inf

            for square in square_nums:
                if k < square:
                    break
                new_num = helper(k - square) + 1
                ans = min(ans, new_num)
            
            return ans

        return helper(n)
```

### Dynamic Programming Framework

#### Top-Down Dynamic Programming

```Python
class Solution:
    def numSquares(self, n: int) -> int:
        @functools.lru_cache(maxsize=None)
        def dp(remaining):
            # Base cases
            if remaining == 0:
                return 0
            if remaining < 0:
                return math.inf
            
            # DP Transitions
            return 1 + min(dp(remaining - (i**2)) for i in range(1, int(math.sqrt(n)) + 1))
        
        return dp(n)
```

### Breadth-First Search

```Python
class Solution:
    def numSquares(self, n: int) -> int:
        # Breadth-First Search
        #### Time Complexity: O(N^(h/2)), h the height of the N-ary tree
        #### Space Complexity: O(N^(h/2)), number of nodes in N-ary tree
        """
        # square_nums = [i * i for i in range(1, int(n**0.5) + 1)]
        square_nums = [i * i for i in range(1, int(math.sqrt(n)) + 1)]

        count = 0
        queue = {n}
        while queue:
            count += 1
            next_queue = set()
            for remainder in queue:
                for square_num in square_nums:
                    if remainder == square_num:
                        return count
                    elif remainder < square_num:
                        continue
                    else:
                        next_queue.add(remainder - square_num)
            queue = next_queue
```

### Dynamic Programming with Tabulations

```Python
class Solution:
    def numSquares(self, n: int) -> int:
        # Dynamic Programming with Tabulations
        #### Time Complexity: O(N * N^(1/2)), traverse through list of square numbers, which takes at most square root N, while traversing through the size of input n
        #### Space Complexity: O(N), extra space required to build memo
        square_nums = [i**2 for i in range(1, int(math.sqrt(n)+1))]
        memo = [float('inf')] * (n + 1)
        memo[0] = 0
        for i in range(1, n+1):
            for square_num in square_nums:
                if i < square_num:
                    continue
                memo[i] = min(memo[i], memo[i-square_num] + 1)
        print (memo)
        return memo[-1]
```
