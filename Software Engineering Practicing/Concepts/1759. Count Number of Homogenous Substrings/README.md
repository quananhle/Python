## [1759. Count Number of Homogenous Substrings](https://leetcode.com/problems/count-number-of-homogenous-substrings)

```Tag```: ```Array & String``` ```Sliding Window```

#### Difficulty: Medium

Given a string s, return the number of homogenous substrings of s. Since the answer may be too large, return it modulo 109 + 7.

A string is homogenous if all the characters of the string are the same.

A substring is a contiguous sequence of characters within a string.

---

__Example 1:__
```
Input: s = "abbcccaa"
Output: 13
Explanation: The homogenous substrings are listed as below:
"a"   appears 3 times.
"aa"  appears 1 time.
"b"   appears 2 times.
"bb"  appears 1 time.
"c"   appears 3 times.
"cc"  appears 2 times.
"ccc" appears 1 time.
3 + 1 + 2 + 1 + 3 + 2 + 1 = 13.
```

__Example 2:__
```
Input: s = "xy"
Output: 2
Explanation: The homogenous substrings are "x" and "y".
```

__Example 3:__
```
Input: s = "zzzzz"
Output: 15
```

__Constraints:__

- $1 \le s.length \le 10^5$
- ```s``` consists of lowercase letters.

---

![image](https://github.com/quananhle/Python/assets/35042430/d0fd0301-2656-463f-a70e-70551f99cb1e)

###

```Python
class Solution:
    def countHomogenous(self, s: str) -> int:
        n = len(s)
        ans = 0
        curr_streak = 0
        MOD = 10**9 + 7

        for i in range(n):
            if i == 0 or s[i] == s[i - 1]:
                curr_streak += 1
            else:
                curr_streak = 1
            
            ans = (ans + curr_streak) % MOD

        return ans
```

### Sliding Window

```Python
class Solution:
    def countHomogenous(self, s: str) -> int:
        n = len(s)
        start = 0
        MOD = 10**9 + 7
        ans = 0

        for end in range(n):
            left, right = s[start], s[end]
            if left == right:
                ans += end - start + 1
            else:
                start = end
                ans += 1
        
        return ans % MOD
```
