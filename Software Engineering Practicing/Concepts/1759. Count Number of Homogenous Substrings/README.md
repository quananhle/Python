## [1759. Count Number of Homogenous Substrings](https://leetcode.com/problems/count-number-of-homogenous-substrings)

```Tag```:

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
- $s consists of lowercase letters.$

---
