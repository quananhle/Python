## 17. Letter Combinations of a Phone Number

```Tag```: ```Recursion```

#### Difficulty: Medium

Given a string containing digits from ```2-9``` inclusive, return all possible letter combinations that the number could represent. Return the answer in any order.

A mapping of digits to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.

![image](https://assets.leetcode.com/uploads/2022/03/15/1200px-telephone-keypad2svg.png)

![image](https://user-images.githubusercontent.com/35042430/217920480-109d7aee-9eec-4d09-90d5-bb30af6cbf0d.png)

---

__Example 1:__
```
Input: digits = "23"
Output: ["ad","ae","af","bd","be","bf","cd","ce","cf"]
```

__Example 2:__
```
Input: digits = ""
Output: []
```

__Example 3:__
```
Input: digits = "2"
Output: ["a","b","c"]
```

__Constraints:__

- ```0 <= digits.length <= 4```
- ```digits[i]``` is a digit in the range ```['2', '9']```.

---
