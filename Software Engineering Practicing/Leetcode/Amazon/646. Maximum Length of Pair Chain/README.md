## [646. Maximum Length of Pair Chain](https://leetcode.com/problems/maximum-length-of-pair-chain/)

```Tag```: ```Dynamic Programming``` ```Binary Search``` ```Greedy```

#### Difficulty: Medium

You are given an array of ```n``` pairs ```pairs``` where $pairs[i] = [left_i, right_i]$ and $left_i < right_i$.

A pair $p_2 = [c, d]$ follows a pair $p_1 = [a, b]$ if ```b < c```. A chain of pairs can be formed in this fashion.

Return _the length longest chain which can be formed_.

You do not need to use up all the given intervals. You can select pairs in any order.

![image](https://github.com/quananhle/Python/assets/35042430/f05da717-f931-4c1f-8484-6d29331eb975)

---

__Example 1:__
```
Input: pairs = [[1,2],[2,3],[3,4]]
Output: 2
Explanation: The longest chain is [1,2] -> [3,4].
```

__Example 2:__
```
Input: pairs = [[1,2],[7,8],[4,5]]
Output: 3
Explanation: The longest chain is [1,2] -> [4,5] -> [7,8].
```

__Constraints:__

- $n == pairs.length$
- $1 \le n \le 1000$
- $-1000 \le left_i \lt right_i \le 1000$

---

### The Framework

#### Top-Down Dynamic Programming

![image](https://leetcode.com/problems/maximum-length-of-pair-chain/Figures/646/646-1.png)

#### Complexity Analysis:

- __Time Complexity__: $O(n^2)$.
- __Space Complexity__: $O(n)$.

```Python
class Solution:
    def findLongestChain(self, pairs: List[List[int]]) -> int:
        n = len(pairs)
        pairs.sort(key=lambda x:x[0])
        ans = 0

        # Minimum length of chain is 1 pair
        memo = collections.defaultdict(lambda:1)

        def dp (i, curr_upper):
            if i in memo:
                return memo[i]

            # Check every interval starting after the current interval in a already sorted list
            for j in range(i + 1, n):
                next_lower, next_upper = pairs[j][0], pairs[j][1]
                if curr_upper < next_lower:
                    memo[i] = max(memo[i], 1 + dp(j, next_upper))
            
            return memo[i]

        # Check every interval
        for i in range(n):
            ans = max(ans, dp(i, pairs[i][1]))
        
        return ans
```

```Python
class Solution:
    def findLongestChain(self, pairs: List[List[int]]) -> int:
        n = len(pairs)
        pairs.sort(key=lambda x:x[0])
        ans = 0

        @lru_cache(maxsize=None)
        def dp (i, curr_upper):
            # Minimum length of chain is 1 pair
            ans = 1

            for j in range(i + 1, n):
                next_lower, next_upper = pairs[j][0], pairs[j][1]
                if curr_upper < next_lower:
                    ans = max(ans, 1 + dp(j, next_upper))
            
            return ans

        for i in range(n):
            ans = max(ans, dp(i, pairs[i][1]))
        
        return ans
```

#### Top-Down Dynamic Programming w/ Binary Search

```Python
class Solution:
    def findLongestChain(self, pairs: List[List[int]]) -> int:
        n = len(pairs)
        pairs.sort(key=lambda x:x[0])
        ans = 0

        # Minimum length of chain is 1 pair
        memo = collections.defaultdict(lambda:1)

        def binary_search(i):
            lo, hi = i + 1, n - 1
            while lo <= hi:
                mi = lo + (hi - lo) // 2

                if pairs[i][1] < pairs[mi][0]:
                    hi = mi - 1
                else:
                    lo = mi + 1
                
            return lo

        def dp (i):
            # Base case
            if i == n:
                return 0

            if i in memo:
                return memo[i]

            # DP Transition: skip or take the current interval
            skip = dp(i + 1)
            take = 1 + dp(binary_search(i))

            memo[i] = max(skip, take)
            
            return memo[i]

        return dp(0)
```

#### Bottom-Up Dynamic Programming

#### Complexity Analysis:

- __Time Complexity__: $O(n^2)$.
- __Space Complexity__: $O(n)$.

```Python
class Solution:
    def findLongestChain(self, pairs: List[List[int]]) -> int:
        n = len(pairs)
        pairs.sort(key=lambda x:x[0])

        # Minimum length of chain is 1 pair
        ans = 1
        dp = collections.defaultdict(lambda:1)

        for i in range(n - 1, -1, -1):
            for j in range(i + 1, n):
                curr_upper, next_lower = pairs[i][1], pairs[j][0]
                if curr_upper < next_lower:
                    dp[i] = max(dp[i], 1 + dp[j])
            
            ans = max(ans, dp[i])
        
        return ans
```

---

### Greedy

#### Complexity Analysis:

- __Time Complexity__: $O(n \cdot \log n)$.
- __Space Complexity__: $O(1)$.

```Python
class Solution:
    def findLongestChain(self, pairs: List[List[int]]) -> int:
        n = len(pairs)
        pairs.sort(key=lambda x:x[1])
        ans = 0
        curr = float("-inf")

        for pair in pairs:
            if curr < pair[0]:
                ans += 1
                curr = pair[1]

        return ans
```
