## [76. Minimum Window Substring](https://leetcode.com/problems/minimum-window-substring/)

```Tag```: ```Two Pointers``` ```Sliding Window```

#### Difficulty: Hard

Given two strings ```s``` and ```t``` of lengths ```m``` and ```n``` respectively, return _the minimum window substring of ```s``` such that every character in ```t``` (including duplicates) is included in the window_. If there is no such substring, return _the empty string ```""```_.

The testcases will be generated such that the answer is unique.

![image](https://user-images.githubusercontent.com/35042430/225948578-136cbb33-3dde-453d-a5bc-fb65fca9cd2d.png)

---

__Example 1:__
```
Input: s = "ADOBECODEBANC", t = "ABC"
Output: "BANC"
Explanation: The minimum window substring "BANC" includes 'A', 'B', and 'C' from string t.
```

__Example 2:__
```
Input: s = "a", t = "a"
Output: "a"
Explanation: The entire string s is the minimum window.
```

__Example 3:__
```
Input: s = "a", t = "aa"
Output: ""
Explanation: Both 'a's from t must be included in the window.
Since the largest window of s only has one 'a', return empty string.
```

__Constraints:__

- ```m == s.length```
- ```n == t.length```
- ```1 <= m, n <= 10^5```
- ```s``` and ```t``` consist of uppercase and lowercase English letters.
 
---




__Follow up__: Could you find an algorithm that runs in ```O(m + n)``` time?
