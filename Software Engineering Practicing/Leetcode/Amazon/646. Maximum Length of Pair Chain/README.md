## [646. Maximum Length of Pair Chain](https://leetcode.com/problems/maximum-length-of-pair-chain/)

```Tag```: ```Dynamic Programming``` ```Binary Search```

#### Difficulty: Medium

You are given an array of ```n``` pairs ```pairs``` where $pairs[i] = [left_i, right_i]$ and $left_i < right_i$.

A pair $p_2 = [c, d]$ follows a pair $p_1 = [a, b]$ if ```b < c```. A chain of pairs can be formed in this fashion.

Return _the length longest chain which can be formed_.

You do not need to use up all the given intervals. You can select pairs in any order.

![image](https://github.com/quananhle/Python/assets/35042430/93fe27e4-db8d-45fc-a192-63992ce0bffe)

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
