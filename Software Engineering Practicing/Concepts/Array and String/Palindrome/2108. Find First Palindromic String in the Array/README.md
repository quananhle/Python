## [2108. Find First Palindromic String in the Array](https://leetcode.com/problems/find-first-palindromic-string-in-the-array)

```Tag```: ```Array & String```

#### Difficulty: Easy

Given an array of strings ```words```, return _the first palindromic string in the array_. If there is no such string, return _an empty string ```""```_.

A string is palindromic if it reads the same forward and backward.

![image](https://github.com/quananhle/Python/assets/35042430/5faed57a-f9bc-4317-819c-a82af0732daf)

---

__Example 1:__
```
Input: words = ["abc","car","ada","racecar","cool"]
Output: "ada"
Explanation: The first string that is palindromic is "ada".
Note that "racecar" is also palindromic, but it is not the first.
```

__Example 2:__
```
Input: words = ["notapalindrome","racecar"]
Output: "racecar"
Explanation: The first and only string that is palindromic is "racecar".
```

__Example 3:__
```
Input: words = ["def","ghi"]
Output: ""
Explanation: There are no palindromic strings, so the empty string is returned.
```

__Constraints:__

- $1 \le words.length \le 100$
- $1 \le words[i].length \le 100$
- ```words[i]``` consists only of lowercase English letters.

---
