## 392. Is Subsequence

#### Difficulty: Easy

Given two strings ```s``` and ```t```, return ```true``` if ```s``` is a __subsequence__ of ```t```, or ```false``` otherwise.

A __subsequence__ of a string is a new string that is formed from the original string by deleting some (can be none) of the characters without disturbing the relative positions of the remaining characters. (i.e., ```"ace"``` is a __subsequence__ of ```"abcde"``` while ```"aec"``` is not).

![image](https://user-images.githubusercontent.com/35042430/205380949-977ed83a-4f51-44f1-86d3-6411153715d2.png)

---

__Example 1:__
```
Input: s = "abc", t = "ahbgdc"
Output: true
```

__Example 2:__
```
Input: s = "axc", t = "ahbgdc"
Output: false
```

__Constraints:__
```
0 <= s.length <= 100
0 <= t.length <= 104
s and t consist only of lowercase English letters.
```

#### Follow up: Suppose there are lots of incoming ```s```, say ```s1, s2, ..., sk``` where ```k >= 109```, and you want to check one by one to see if ```t``` has its subsequence. In this scenario, how would you change your code?
