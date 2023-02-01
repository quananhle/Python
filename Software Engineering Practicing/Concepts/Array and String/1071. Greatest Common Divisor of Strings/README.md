## 1071. Greatest Common Divisor of Strings

```Tag```: ```String```

#### Difficulty: Easy

For two strings ```s``` and ```t```, we say ```"t divides s"``` iff ```s = t + ... + t``` (i.e., ```t``` is concatenated with itself one or more times).

Given two strings ```str1``` and ```str2```, return _the largest string ```x``` such that ```x``` divides both ```str1``` and ```str2```_.

![image](https://user-images.githubusercontent.com/35042430/215970545-4684fa06-a2f0-40ba-8c00-94fcf5037e59.png)

---

__Example 1:__
```
Input: str1 = "ABCABC", str2 = "ABC"
Output: "ABC"
```

__Example 2:__
```
Input: str1 = "ABABAB", str2 = "ABAB"
Output: "AB"
```

__Example 3:__
```
Input: str1 = "LEET", str2 = "CODE"
Output: ""
```

__Constraints:__

- ```1 <= str1.length, str2.length <= 1000```
- ```str1``` and ```str2``` consist of English uppercase letters.

---
