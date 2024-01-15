## [1347. Minimum Number of Steps to Make Two Strings Anagram](https://leetcode.com/problems/minimum-number-of-steps-to-make-two-strings-anagram)

```Tag```: ```Array & String``` ```Hash Map```

#### Difficulty: Medium

You are given two strings of the same length ```s``` and ```t```. In one step you can choose any character of ```t``` and replace it with another character.

Return _the minimum number of steps to make ```t``` an anagram of ```s```_.

An Anagram of a string is a string that contains the same characters with a different (or the same) ordering.

![image](https://github.com/quananhle/Python/assets/35042430/103e1806-3005-4dd3-b4ce-8a208622c9c9)

---

__Example 1:__
```
Input: s = "bab", t = "aba"
Output: 1
Explanation: Replace the first 'a' in t with b, t = "bba" which is anagram of s.
```

__Example 2:__
```
Input: s = "leetcode", t = "practice"
Output: 5
Explanation: Replace 'p', 'r', 'a', 'i' and 'c' from t with proper characters to make t anagram of s.
```

__Example 3:__
```
Input: s = "anagram", t = "mangaar"
Output: 0
Explanation: "anagram" and "mangaar" are anagrams. 
```

__Constraints:__

- $1 \le s.length \le 5 * 10^4$
- $s.length == t.length$
- ```s``` and ```t``` consist of lowercase English letters only.

---

### Hash Map

![image](https://leetcode.com/problems/minimum-number-of-steps-to-make-two-strings-anagram/Figures/1347/1347A.png)

```Python
class Solution:
    def minSteps(self, s: str, t: str) -> int:
        counter = [0] * 26

        for i in range(len(s)):
            counter[ord(s[i]) - ord('a')] += 1
            counter[ord(t[i]) - ord('a')] -= 1
        
        ans = 0
        for i in range(26):
            ans += max(0, counter[i])

        return ans
```
