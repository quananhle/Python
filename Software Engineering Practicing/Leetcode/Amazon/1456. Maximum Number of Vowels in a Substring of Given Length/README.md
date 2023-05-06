## [1456. Maximum Number of Vowels in a Substring of Given Length](https://leetcode.com/problems/maximum-number-of-vowels-in-a-substring-of-given-length/)

```Tag```: ```Sliding Window```

#### Difficulty: Medium

Given a string ```s``` and an integer ```k```, return _the maximum number of vowel letters in any substring of ```s``` with length ```k```_.

__Vowel letters__ in English are ```'a'```, ```'e'```, ```'i'```, ```'o'```, and ```'u'```.

![image](https://user-images.githubusercontent.com/35042430/236581371-82156d4a-b797-46b5-aa50-9344dfa866d5.png)

---

__Example 1:__
```
Input: s = "abciiidef", k = 3
Output: 3
Explanation: The substring "iii" contains 3 vowel letters.
```

__Example 2:__
```
Input: s = "aeiou", k = 2
Output: 2
Explanation: Any substring of length 2 contains 2 vowels.
```

__Example 3:__
```
Input: s = "leetcode", k = 3
Output: 2
Explanation: "lee", "eet" and "ode" contain 2 vowels.
```

__Constraints:__

- 1 <= ```s.length``` <= 10<sup>5</sup>
- ```s``` consists of lowercase English letters.
- ```1 <= k <= s.length```

---

### Sliding Window

#### Naive Approach (Time Limit Exceeded)

```Python
class Solution:
    def maxVowels(self, s: str, k: int) -> int:
        VOWELS = {'a', 'e', 'i', 'o', 'u'}
        ans = 0
        n = len(s)

        for start in range(n - k + 1):
            curr = 0
            end = start + k
            for c in s[start:end]:
                if c in VOWELS:
                    curr += 1
            ans = max(ans, curr)

        return ans 
```
