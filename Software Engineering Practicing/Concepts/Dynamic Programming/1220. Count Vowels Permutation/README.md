## [1220. Count Vowels Permutation](https://leetcode.com/problems/count-vowels-permutation/)

```Tag```: ```Dynamic Programming```

#### Difficulty: Hard

Given an integer ```n```, your task is to count how many strings of length ```n``` can be formed under the following rules:

- Each character is a lower case vowel (```'a'```, ```'e'```, ```'i'```, ```'o'```, ```'u'```)
- Each vowel ```'a'``` may only be followed by an ```'e'```.
- Each vowel ```'e'``` may only be followed by an ```'a'``` or an ```'i'```.
- Each vowel ```'i'``` may not be followed by another ```'i'```.
- Each vowel ```'o'``` may only be followed by an ```'i'``` or a ```'u'```.
- Each vowel ```'u'``` may only be followed by an ```'a'```.

Since the answer may be too large, return it modulo ```10^9 + 7```.

![image](https://github.com/quananhle/Python/assets/35042430/77127f9f-2f4c-403c-b5e8-632cd5a20dca)

---

__Example 1:__
```
Input: n = 1
Output: 5
Explanation: All possible strings are: "a", "e", "i" , "o" and "u".
```

__Example 2:__
```
Input: n = 2
Output: 10
Explanation: All possible strings are: "ae", "ea", "ei", "ia", "ie", "io", "iu", "oi", "ou" and "ua".
```

__Example 3:__
```
Input: n = 5
Output: 68
```

__Constraints:__

- ```1 <= n <= 2 * 10^4```

---

![image](https://leetcode.com/problems/count-vowels-permutation/Figures/1220/1220-Page-1.png)

_Figure 1. Visualization of the rules._

![image](https://leetcode.com/problems/count-vowels-permutation/Figures/1220/1220-Page-2.png)

_Figure 2. Putting the rules together._

```
aCountNew = eCount + iCount + uCount
eCountNew = aCount + iCount
iCountNew = eCount + oCount
oCountNew = iCount
uCountNew = iCount + oCount
```

### The Framework

#### Top-Down Dynamic Programming (Recursion)

- __Time complexity__: ```O(N)```. This is because there are ```N``` recursive calls to each vowel. Therefore, the total number of function calls to dp is ```5⋅N```, which leads to time complexity of ```O(N)```. Initializations will take ```O(1)``` time. Putting them together, this solution takes ```O(N)``` time.

- __Space complexity__: ```O(N)```. This is because ```O(5⋅N)``` space is required for memoization. Furthermore, the size of the system stack used by recursion calls will be ```O(N)```. Putting them together, this solution uses ```O(N)``` space.

```Python
class Solution:
    def countVowelPermutation(self, n: int) -> int:
        # Top-Down DP (Recursion)
        MOD = 10**9 + 7
        @lru_cache(None)
        def dp(i, vowel):
            # Base case
            total = 1
            
            # Recurrence relation
            if i > 1:
                if vowel == 'a':
                    total = (dp(i - 1, 'e') + dp(i - 1, 'i') + dp(i - 1, 'u')) % MOD
                elif vowel == 'e':
                    total = (dp(i - 1, 'a') + dp(i - 1, 'i')) % MOD
                elif vowel == 'i':
                    total = (dp(i - 1, 'e') + dp(i - 1, 'o')) % MOD
                elif vowel == 'o':
                    total = (dp(i - 1, 'i')) % MOD
                else:
                    total = (dp(i - 1, 'i') + dp(i - 1, 'o')) % MOD
            
            return total

        return sum(dp(n, vowel) for vowel in 'aeiou') % MOD
```

#### Bottom-Up Dynamic Programming (Tabulation)

```Python
class Solution:
    def countVowelPermutation(self, n: int) -> int:
        MOD = 10**9 + 7
        
        dp = [[1] * (n + 1) for _ in range(5)]

        for i in range(1, n):
            dp[0][i] = (dp[1][i - 1] + dp[2][i - 1] + dp[4][i - 1]) % MOD
            dp[1][i] = (dp[0][i - 1] + dp[2][i - 1]) % MOD
            dp[2][i] = (dp[1][i - 1] + dp[3][i - 1]) % MOD
            dp[3][i] = (dp[2][i - 1]) % MOD
            dp[4][i] = (dp[2][i - 1] + dp[3][i - 1]) % MOD

        return sum(dp[vowel][n - 1] for vowel in range(len('aeiou'))) % MOD
```

#### Optimized Space Bottom-Up Dynamic Programming 

Since the i<sup>th</sup> element in each array only depends on the (i - 1)<sup>th</sup> element in some of the arrays. Therefore, the space complexity can be optimized by using five long variables (instead of 5 arrays of length n) to store the counts.

```Python
class Solution:
    def countVowelPermutation(self, n: int) -> int:
        a = e = i = o = u = 1
        MOD = 10**9 + 7

        for _ in range(1, n):
            a_count = (e + i + u) % MOD
            e_count = (a + i) % MOD
            i_count = (e + o) % MOD
            o_count = (i) % MOD
            u_count = (i + o) % MOD

            a, e, i, o, u = a_count, e_count, i_count, o_count, u_count
            
        return (a + e + i + o + u) % MOD
```

```Python
class Solution:
    def countVowelPermutation(self, n: int) -> int:
        a = e = i = o = u = 1
        
        MOD = 10**9 + 7

        for _ in range(1, n):
        
            a, e, i, o, u = (e + u + i) % MOD, (a + i) % MOD, (e + o) % MOD, i % MOD, (o + i) % MOD
            
        return (a + e + i + o + u) % MOD
```
