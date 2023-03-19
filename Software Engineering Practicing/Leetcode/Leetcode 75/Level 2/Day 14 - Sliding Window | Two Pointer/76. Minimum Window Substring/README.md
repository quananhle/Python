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

![image](https://leetcode.com/problems/minimum-window-substring/Figures/76/76_Minimum_Window_Substring_1.png)

### Sliding Window

__Algorithm__

1. We start with two pointers, ```left``` and ```right``` initially pointing to the first element of the string ```S```.

2. We use the ```right``` pointer to expand the window until we get a desirable window i.e. a window that contains all of the characters of ```T```.

3. Once we have a window with all the characters, we can move the ```left``` pointer ahead one by one. If the window is still a desirable one we keep on updating the minimum window size.

4. If the window is not desirable any more, we repeat step 2 onwards.

![image](https://leetcode.com/problems/minimum-window-substring/Figures/76/76_Minimum_Window_Substring_2.png)

The above steps are repeated until we have looked at all the windows. The smallest window is returned.

![image](https://leetcode.com/problems/minimum-window-substring/Figures/76/76_Minimum_Window_Substring_3.png)

```Pythton

```


__Follow up__: Could you find an algorithm that runs in ```O(m + n)``` time?
