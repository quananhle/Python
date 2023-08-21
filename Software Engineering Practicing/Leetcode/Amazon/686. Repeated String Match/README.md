## [686. Repeated String Match](https://leetcode.com/problems/repeated-string-match/)

```Tag```: ```Array & String```

#### Difficulty: Medium

Given two strings ```a``` and ```b```, return _the minimum number of times you should repeat string ```a``` so that string ```b``` is a substring of it_. If it is impossible for ```b```​​​​​​ to be a substring of ```a``` after repeating it, return ```-1```.

Notice: string ```"abc"``` repeated ```0``` times is ```""```, repeated ```1``` time is ```"abc"``` and repeated ```2``` times is ```"abcabc"```.

![image](https://github.com/quananhle/Python/assets/35042430/a2550b49-8f82-430b-9f5b-3b4008a09fb6)

---

__Example 1:__
```
Input: a = "abcd", b = "cdabcdab"
Output: 3
Explanation: We return 3 because by repeating a three times "abcdabcdabcd", b is a substring of it.
```

__Example 2:__
```
Input: a = "a", b = "aa"
Output: 2
```

__Constraints:__

- 1 \le a.length, b.length \le 10^{4}$
- ```a``` and ```b``` consist of lowercase English letters.

---
