## [2272. Substring With Largest Variance](https://leetcode.com/problems/substring-with-largest-variance/)

```Tag```:

#### Difficulty: Hard

The variance of a string is defined as the largest difference between the number of occurrences of any ```2``` characters present in the string. Note the two characters may or may not be the same.

Given a string ```s``` consisting of lowercase English letters only, return _the largest variance possible among all substrings of ```s```_.

__A substring is a contiguous sequence of characters within a string__.

![image](https://github.com/quananhle/Python/assets/35042430/0f25768b-5916-437d-9299-f89ae69175e6)

---

__Example 1:__
```
Input: s = "aababbb"
Output: 3
Explanation:
All possible variances along with their respective substrings are listed below:
- Variance 0 for substrings "a", "aa", "ab", "abab", "aababb", "ba", "b", "bb", and "bbb".
- Variance 1 for substrings "aab", "aba", "abb", "aabab", "ababb", "aababbb", and "bab".
- Variance 2 for substrings "aaba", "ababbb", "abbb", and "babb".
- Variance 3 for substring "babbb".
Since the largest possible variance is 3, we return it.
```

__Example 2:__
```
Input: s = "abcde"
Output: 0
Explanation:
No letter occurs more than once in s, so the variance of every substring is 0.
```

__Constraints:__

- $1 <= s.length <= 10^{4}$
- ```s``` consists of lowercase English letters.

---


