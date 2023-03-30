## [87. Scramble String](https://leetcode.com/problems/scramble-string/)

```Tag```:

#### Difficulty: Hard

We can scramble a string s to get a string t using the following algorithm:

If the length of the string is 1, stop.

If the length of the string is > 1, do the following:
- Split the string into two non-empty substrings at a random index, i.e., if the string is ```s```, divide it to ```x``` and ```y``` where ```s = x + y```.
- Randomly decide to swap the two substrings or to keep them in the same order. i.e., after this step, ```s``` may become ```s = x + y``` or ```s = y + x```.
- Apply step 1 recursively on each of the two substrings ```x``` and ```y```.

Given two strings ```s1``` and ```s2``` of the same length, return _```true``` if ```s2``` is a scrambled string of ```s1```, otherwise, return ```false```_.

![image](https://user-images.githubusercontent.com/35042430/228712444-385b8984-a848-4f22-9d7b-3849dde16383.png)

---

__Example 1:__
```
Input: s1 = "great", s2 = "rgeat"
Output: true
Explanation: One possible scenario applied on s1 is:
"great" --> "gr/eat" // divide at random index.
"gr/eat" --> "gr/eat" // random decision is not to swap the two substrings and keep them in order.
"gr/eat" --> "g/r / e/at" // apply the same algorithm recursively on both substrings. divide at random index each of them.
"g/r / e/at" --> "r/g / e/at" // random decision was to swap the first substring and to keep the second substring in the same order.
"r/g / e/at" --> "r/g / e/ a/t" // again apply the algorithm recursively, divide "at" to "a/t".
"r/g / e/ a/t" --> "r/g / e/ a/t" // random decision is to keep both substrings in the same order.
The algorithm stops now, and the result string is "rgeat" which is s2.
As one possible scenario led s1 to be scrambled to s2, we return true.
```

__Example 2:__
```
Input: s1 = "abcde", s2 = "caebd"
Output: false
```

__Example 3:__
```
Input: s1 = "a", s2 = "a"
Output: true
```

__Constraints:__

- ```s1.length == s2.length```
- ```1 <= s1.length <= 30```
- ```s1``` and ```s2``` consist of lowercase English letters.

---

### The Framework

#### Top-Down Dynamic Programming

```Python
class Solution:
    def isScramble(self, s1: str, s2: str) -> bool:
        @lru_cache(None)
        def dp(s1, s2):
            # Base cases
            if not sorted(s1) == sorted(s2):
                return False
            if len(s1) == 1:
                return True
            
            for i in range(1, len(s1)):
                if dp(s1[:i], s2[-i:]) and dp(s1[i:], s2[:-i]) or dp(s1[:i], s2[:i]) and dp(s1[i:], s2[i:]):
                    return True
            
            return False

        return dp(s1, s2)
```

```Python


```
