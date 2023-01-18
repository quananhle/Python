## 202. Happy Number

```Tag```: ```Hash Set```

#### Difficulty: Easy

Write an algorithm to determine if a number ```n``` is happy.

A __happy number__ is a number defined by the following process:

- Starting with any positive integer, replace the number by the sum of the squares of its digits.
- Repeat the process until the number equals 1 (where it will stay), or it __loops endlessly in a cycle__ which does not include 1.
- Those numbers for which this process ends in 1 are happy.

Return _```true``` if n is a happy number, and ```false``` if not_.

![image](https://user-images.githubusercontent.com/35042430/213296655-e5f5a784-252e-4e67-a5b5-f4bbbd284353.png)

---

__Example 1:__
```
Input: n = 19
Output: true
Explanation:
12 + 92 = 82
82 + 22 = 68
62 + 82 = 100
12 + 02 + 02 = 1
```

__Example 2:__
```
Input: n = 2
Output: false
```

__Constraints:__
```
1 <= n <= 231 - 1
```

---
