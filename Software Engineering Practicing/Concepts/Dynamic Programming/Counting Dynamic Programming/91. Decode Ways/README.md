## 91. Decode Ways

```Tag```: ```Dynamic Programming```

#### Difficulty: Medium

A message containing letters from ```A-Z``` can be __encoded__ into numbers using the following mapping:
```
'A' -> "1"
'B' -> "2"
...
'Z' -> "26"
```

To __decode__ an encoded message, all the digits must be grouped then mapped back into letters using the reverse of the mapping above (there may be multiple ways). For example, ```"11106"``` can be mapped into:

- ```"AAJF"``` with the grouping ```(1 1 10 6)```
- ```"KJF"``` with the grouping ```(11 10 6)```

Note that the grouping ```(1 11 06)``` is invalid because ```"06"``` cannot be mapped into ```'F'``` since ```"6"``` is different from ```"06"```.

Given a string ```s``` containing only digits, return _the __number of ways__ to decode it_.

The test cases are generated so that the answer fits in a __32-bit__ integer.

![image](https://user-images.githubusercontent.com/35042430/220204128-0d2c0ec9-a11a-4167-a24a-1a893bcc7b01.png)

---

__Example 1:__
```
Input: s = "12"
Output: 2
Explanation: "12" could be decoded as "AB" (1 2) or "L" (12).
```

__Example 2:__
```
Input: s = "226"
Output: 3
Explanation: "226" could be decoded as "BZ" (2 26), "VF" (22 6), or "BBF" (2 2 6).
```

__Example 3:__
```
Input: s = "06"
Output: 0
Explanation: "06" cannot be mapped to "F" because of the leading zero ("6" is different from "06").
```

__Constraints:__

- ```1 <= s.length <= 100```
- ```s``` contains only digits and may contain leading zero(s).

---

