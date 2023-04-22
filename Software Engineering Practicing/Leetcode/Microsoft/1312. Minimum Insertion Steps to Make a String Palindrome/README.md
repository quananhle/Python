## [1312. Minimum Insertion Steps to Make a String Palindrome](https://leetcode.com/problems/minimum-insertion-steps-to-make-a-string-palindrome/)

```Tag```: ```Dynamic Programming```

#### Difficulty: Hard

Given a string ```s```. In one step you can insert any character at any index of the string.

Return _the minimum number of steps to make ```s``` palindrome_.

A Palindrome String is one that reads the same backward as well as forward.

![image](https://user-images.githubusercontent.com/35042430/233757671-46e302d1-0163-483d-85bc-b9999c701adc.png)

---

__Example 1:__
```
Input: s = "zzazz"
Output: 0
Explanation: The string "zzazz" is already palindrome we do not need any insertions.
```

__Example 2:__
```
Input: s = "mbadm"
Output: 2
Explanation: String can be "mbdadbm" or "mdbabdm".
```

__Example 3:__
```
Input: s = "leetcode"
Output: 5
Explanation: Inserting 5 characters the string becomes "leetcodocteel".
```

__Constraints:__

- ```1 <= s.length <= 500```
- ```s``` consists of lowercase English letters.

---

### The Framework

#### Top-Down Dynamic Programming

![image](https://leetcode.com/problems/minimum-insertion-steps-to-make-a-string-palindrome/Figures/1312/1312-1.png)

- __Time Complexity__: O(n<sup>2</sup>)
- __Space Complexity__: O(n<sup>2</sup>)

```Python
class Solution:
    def minInsertions(self, s: str) -> int:
        n = len(s)
        memo = collections.defaultdict(int)
        
        def dp(left, right):
            # Base case
            if left >= right:
                return 0

            if (left, right) in memo:
                return memo[(left, right)]

            if s[left] == s[right]:
                memo[(left, right)] = dp(left + 1, right - 1)
            else:
                memo[(left, right)] = 1 + min(dp(left + 1, right), dp(left, right - 1))

            return memo[(left, right)]

        return dp(0, n - 1)
```

```Python
class Solution:
    def minInsertions(self, s: str) -> int:
        n = len(s)

        @lru_cache(None)
        def dp(left, right):
            # Base case
            if left >= right:
                return 0
            elif s[left] == s[right]:
                return dp(left + 1, right - 1)
            else:
                return 1 + min(dp(left + 1, right), dp(left, right - 1))

        return dp(0, n - 1)
```

#### Bottom-Up Dynamic Programming

- __Time Complexity__: O(n<sup>2</sup>)
- __Space Complexity__: O(n<sup>2</sup>)

```Python
class Solution:
    def minInsertions(self, s: str) -> int:
        n = len(s)
        dp = [[0] * (n + 1) for _ in range(n + 1)]

        for left in range(n - 1, -1, -1):
            for right in range(left, n):
                if s[left] == s[right]:
                    dp[left][right] = dp[left + 1][right - 1]
                else:
                    dp[left][right] = 1 + min(dp[left + 1][right], dp[left][right - 1])

        return dp[0][n - 1]
```

#### Optimized Space Bottom-Up Dynamic Programming

- __Time Complexity__: O(n<sup>2</sup>)
- __Space Complexity__: O(n)

```Python
class Solution:
    def minInsertions(self, s: str) -> int:
        n = len(s)
        dp = [0] * (n + 1)

        for left in range(n - 1, -1, -1):
            prev = 0
            for right in range(left, n):
                tmp = dp[right]
                if s[left] == s[right]:
                    dp[right] = prev
                else:
                    dp[right] = 1 + min(dp[right], dp[right - 1])
                prev = tmp
        
        return dp[n - 1]
```
