## [727. Minimum Window Subsequence](https://leetcode.com/problems/minimum-window-subsequence/)

```Tag```: ```Dynamic Programming``` ```Sliding Window``` ```Greedy```

#### Difficulty: Hard

Given strings ```s1``` and ```s2```, return _the minimum contiguous substring part of ```s1```, so that ```s2``` is a subsequence of the part_.

If there is no such window in ```s1``` that covers all characters in ```s2```, return the empty string ```""```. If there are multiple such minimum-length windows, return the one with __the left-most starting index__.

![image](https://user-images.githubusercontent.com/35042430/233907015-a7a3df6c-7837-4634-ac65-ce2901730a9e.png)

---

__Example 1:__
```
Input: s1 = "abcdebdde", s2 = "bde"
Output: "bcde"
Explanation: 
"bcde" is the answer because it occurs before "bdde" which has the same length.
"deb" is not a smaller window because the elements of s2 in the window must occur in order.
```

__Example 2:__
```
Input: s1 = "jmeqksfrsdcmsiwvaovztaqenprpvnbstl", s2 = "u"
Output: ""
```

__Constraints:__

- 1 <= ```s1.length``` <= 2 * 10<sup>4</sup>
- 1 <= ```s2.length``` <= 100
- ```s1``` and ```s2``` consist of lowercase English letters.

---

### The Framework

#### Top-Down Dynamic Programming

```Python

```

#### Bottom-Up Dynamic Programming

```Python

```
