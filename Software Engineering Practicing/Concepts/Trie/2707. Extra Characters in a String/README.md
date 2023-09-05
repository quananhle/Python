## [2707. Extra Characters in a String](https://leetcode.com/problems/extra-characters-in-a-string)

```Tag```: ```Dynamic Programming``` ```Trie```

#### Difficulty: Medium

You are given a 0-indexed string ```s``` and a dictionary of words ```dictionary```. You have to break ```s``` into one or more non-overlapping substrings such that each substring is present in ```dictionary```. There may be some extra characters in ```s``` which are not present in any of the substrings.

Return _the minimum number of extra characters left over if you break up ```s``` optimally_.

--- 

__Example 1__:
```
Input: s = "leetscode", dictionary = ["leet","code","leetcode"]
Output: 1
Explanation: We can break s in two substrings: "leet" from index 0 to 3 and "code" from index 5 to 8. There is only 1 unused character (at index 4), so we return 1.
```

__Example 2__:
```
Input: s = "sayhelloworld", dictionary = ["hello","world"]
Output: 3
Explanation: We can break s in two substrings: "hello" from index 3 to 7 and "world" from index 8 to 12. The characters at indices 0, 1, 2 are not used in any substring and thus are considered as extra characters. Hence, we return 3.
```

__Constraints__:

- $1 \le s.length \le 50$
- $1 \le dictionary.length \le 50$
- $1 \le dictionary[i].length \le 50$
- ```dictionary[i]``` and ```s``` consists of only lowercase English letters
- ```dictionary``` contains distinct words

---

### The Framework

#### Top-Down Dynamic Programming

The recurrence relation in the ```dp``` function is as follows:

- If the ```curr``` index reaches the end of the string (curr == n), indicating that we have considered all characters in ```s```, the function returns ```0```, as no extra characters are needed.
- If the ```curr``` index is not at the end of the string, the function considers two possibilities:
    - Counting the current character at ```curr``` as an extra character by recursively calling ```dp``` with the next index ```(curr + 1)```. This corresponds to the case where the current character is not part of any valid word in the dictionary. The result is incremented by ```1```, as we are counting the current character as an extra.
    - Iterating over all possible ```next``` indices from ```curr``` to the end of the string. For each ```next```, the function checks if the substring ```s[curr:next+1]``` exists in ```dictionary```. We can convert ```dictionary``` to a set before starting the ```DP``` to make these checks more efficient. If it does, the function recursively calls ```dp``` with the next index after the valid word's ```next``` index, ```next + 1```. The result is updated to the minimum value between the current minimum and the value returned from the recursive call.

![image](https://leetcode.com/problems/extra-characters-in-a-string/Figures/2707/FigA.png)

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N^{3})$
- __Space Complexity__: $\mathcal{O}(N + M \cdot K)$

```Python
class Solution:
    def minExtraChar(self, s: str, dictionary: List[str]) -> int:
        n, words = len(s), set(dictionary)
        memo = collections.defaultdict()

        def dp(curr):
            # Base case
            if curr == n:
                return 0
            
            if curr in memo:
                return memo[curr]

            # DP Transtions: 
            ans = dp(curr + 1) + 1

            for next in range(curr, n):
                word = s[curr:next + 1]
                if word in words:
                    ans = min(ans, dp(next + 1))

            memo[curr] = ans
            
            return ans
        
        return dp(0)
```

```Python
class Solution:
    def minExtraChar(self, s: str, dictionary: List[str]) -> int:
        n, words = len(s), set(dictionary)

        @functools.lru_cache(maxsize=None)
        def dp(curr):
            # Base case
            if curr == n:
                return 0

            # DP Transtions: 
            ans = dp(curr + 1) + 1

            for next in range(curr, n):
                word = s[curr:next + 1]
                if word in words:
                    ans = min(ans, dp(next + 1))
            
            return ans
        
        return dp(0)
```

#### Bottom-Up Dynamic Programming

```Python
class Solution:
    def minExtraChar(self, s: str, dictionary: List[str]) -> int:
        n = len(s)
        words = set(dictionary)
        dp = [0] * (n + 1)

        for curr in range(n - 1, -1, -1):
            dp[curr] = 1 + dp[curr + 1]
            for next in range(curr, n):
                word = s[curr:next + 1]
                if word in words:
                    dp[curr] = min(dp[curr], dp[next + 1])
        
        return dp[0]
```

```Python
class Solution:
    def minExtraChar(self, s: str, dictionary: List[str]) -> int:
        n = len(s)
        words = set(dictionary)
        dp = [0] + [float('inf')] * n

        for curr in range(1, n + 1):
            dp[curr] = dp[curr - 1] + 1
            for word in dictionary:
                m = len(word)
                if s[curr - m:curr] == word:
                    dp[curr] = min(dp[curr], dp[curr - m])
        
        return dp[n]
```

---

### Trie

#### Top-Down Dynamic Programming with Trie

```Python

```

#### Bottom-Up Dynamic Programming with Trie

```Python

```
