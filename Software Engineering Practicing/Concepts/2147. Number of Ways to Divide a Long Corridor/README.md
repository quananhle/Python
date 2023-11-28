## [2147. Number of Ways to Divide a Long Corridor](https://leetcode.com/problems/number-of-ways-to-divide-a-long-corridor)

```Tag```: ```Dynamic Programming``` ```Math```

#### Difficulty: Hard

Along a long library corridor, there is a line of seats and decorative plants. You are given a 0-indexed string ```corridor``` of length ```n``` consisting of letters ```'S'``` and ```'P'``` where each ```'S'``` represents a seat and each ```'P'``` represents a plant.

One room divider has already been installed to the left of index ```0```, and another to the right of index ```n - 1```. Additional room dividers can be installed. For each position between indices ```i - 1``` and ```i``` ($1 \le i \le n - 1$), at most one divider can be installed.

Divide the corridor into non-overlapping sections, where each section has exactly two seats with any number of plants. There may be multiple ways to perform the division. Two ways are different if there is a position with a room divider installed in the first way but not in the second way.

Return _the number of ways to divide the corridor_. Since the answer may be very large, return it modulo $10^9 + 7$. If there is no way, return ```0```.

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/12/04/1.png)
```
Input: corridor = "SSPPSPS"
Output: 3
Explanation: There are 3 different ways to divide the corridor.
The black bars in the above image indicate the two room dividers already installed.
Note that in each of the ways, each section has exactly two seats.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2021/12/04/2.png)
```
Input: corridor = "PPSPSP"
Output: 1
Explanation: There is only 1 way to divide the corridor, by not installing any additional dividers.
Installing any would create some section that does not have exactly two seats.
```

__Example 3:__

![image](https://assets.leetcode.com/uploads/2021/12/12/3.png)
```
Input: corridor = "S"
Output: 0
Explanation: There is no way to divide the corridor because there will always be a section that does not have exactly two seats.
```

__Constraints:__

- $n == corridor.length$
- $1 \le n \le 10^5$
- ```corridor[i]``` is either ```'S'``` or ```'P'```.

---

### Dynamic Programming Framework

#### Top-Down Dynamic Programming (Memory Limit Exceeded)

```Python
class Solution:
    def numberOfWays(self, corridor: str) -> int:
        n = len(corridor)
        MOD = 10**9 + 7
        memo = collections.defaultdict(int)

        def dp(i, curr):
            # Base case: at the end of the corridor, check for the current section
            if i >= n:
                return 1 if curr == 2 else 0
            
            if (i, curr) in memo:
                return memo[(i, curr)]

            # DP Transitions: does the current section have 2 seats?
            if curr == 2:
                # If encounter 'S', close the current section and start a new section from the current i with 1 'S'
                if corridor[i] == 'S':
                    ways = dp(i + 1, 1)
                # Otherwise, encounter 'P', two ways to divide the corridor:
                #      - 1. Close the current section and start a new section from the current i with 0 'S'
                #      - 2. Keep expanding the current section with 2 'S'
                else:
                    ways = (dp(i + 1, 0) + dp(i + 1, 2)) % MOD
            else:
                # If encounter 'S', keep expanding the section, add 1 'S' to the current section
                if corridor[i] == 'S':
                    ways = dp(i + 1, curr + 1)
                # Otherwise, encounter 'P', keep expanding the section with the current number of 'S'
                else:
                    ways = dp(i + 1, curr)
            
            memo[(i, curr)] = ways
            return ways
        
        return dp(0, 0)
```

```Python
class Solution:
    def numberOfWays(self, corridor: str) -> int:
        n = len(corridor)
        MOD = 10**9 + 7

        @functools.lru_cache(maxsize=None)
        def dp(i, curr):
            # Base case: at the end of the corridor, check for the current section
            if i >= n:
                return 1 if curr == 2 else 0
            
            # DP Transitions: does the current section have 2 seats?
            if curr == 2:
                # If encounter 'S', close the current section and start a new section from the current i with 1 'S'
                if corridor[i] == 'S':
                    ways = dp(i + 1, 1)
                # Otherwise, encounter 'P', two ways to divide the corridor:
                #      - 1. Close the current section and start a new section from the current i with 0 'S'
                #      - 2. Keep expanding the current section with 2 'S'
                else:
                    ways = (dp(i + 1, 0) + dp(i + 1, 2)) % MOD
            else:
                # If encounter 'S', keep expanding the section, add 1 'S' to the current section
                if corridor[i] == 'S':
                    ways = dp(i + 1, curr + 1)
                # Otherwise, encounter 'P', keep expanding the section with the current number of 'S'
                else:
                    ways = dp(i + 1, curr)
            
            return ways
        
        return dp(0, 0)
```

#### Bottom-Up Dynamic Programming

![image](https://github.com/quananhle/Python/assets/35042430/765faaaf-c351-4117-94b6-64a58dbd4365)

```Python
class Solution:
    def numberOfWays(self, corridor: str) -> int:
        n = len(corridor)
        MOD = 10**9 + 7
        dp = collections.defaultdict(int)

        dp[(n, 0)], dp[(n, 1)], dp[(n, 2)] = 0, 0, 1

        for i in range(n - 1, -1, -1):
            if corridor[i] == 'S':
                dp[(i, 0)] = dp[(i + 1, 1)]
                dp[(i, 1)] = dp[(i + 1, 2)]
                dp[(i, 2)] = dp[(i + 1, 1)]
            else:
                dp[(i, 0)] = dp[(i + 1, 0)]
                dp[(i, 1)] = dp[(i + 1, 1)]
                dp[(i, 2)] = (dp[(i + 1, 0)] + dp[(i + 1, 2)]) % MOD
            
        return dp[(0, 0)]
```

#### Space-Optimized Dynamic Programming

```Python
class Solution:
    def numberOfWays(self, corridor: str) -> int:
        n = len(corridor)
        MOD = 10**9 + 7

        zero, one, two = 0, 0, 1

        for thing in corridor:
            if thing == 'S':
                zero = one
                one, two = two, one
            else:
                two = (two + zero) % MOD
        
        return zero
```

---

### Combinatoric

```Python
class Solution:
    def numberOfWays(self, corridor: str) -> int:
        MOD = 10**9 + 7
        indices = list()
        for i, thing in enumerate(corridor):
            if thing == 'S':
                indices.append(i)
        
        if len(indices) == 0 or len(indices) % 2 == 1:
            return 0
    
        ways = 1

        previous_pair_end, current_pair_start = 1, 2
        while current_pair_start < len(indices):
            ways = ways * (indices[current_pair_start] - indices[previous_pair_end])
            ways %= MOD
            previous_pair_end += 2; current_pair_start += 2
        
        return ways
```

#### Space-Optimized Combinatoric

```Python

```
