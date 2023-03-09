## [1055. Shortest Way to Form String](https://leetcode.com/problems/shortest-way-to-form-string/)

```Tag```: ```Two Pointers``` ```Greedy``` ```Matrix```

#### Difficulty: Medium

A __subsequence__ of a string is a new string that is formed from the original string by deleting some (can be none) of the characters without disturbing the relative positions of the remaining characters. (i.e., ```"ace"``` is a subsequence of ```"abcde"``` while ```"aec"``` is not).

Given two strings ```source``` and ```target```, return _the minimum number of __subsequences__ of ```source``` such that their concatenation equals ```target```_. If the task is impossible, return ```-1```.

![image](https://user-images.githubusercontent.com/35042430/224107689-43e27f6e-cdc9-4b0b-90ff-7ca65071405b.png)

---

__Example 1:__
```
Input: source = "abc", target = "abcbc"
Output: 2
Explanation: The target "abcbc" can be formed by "abc" and "bc", which are subsequences of source "abc".
```

__Example 2:__
```
Input: source = "abc", target = "acdbc"
Output: -1
Explanation: The target string cannot be constructed from the subsequences of source string due to the character "d" in target string.
```

__Example 3:__
```
Input: source = "xyz", target = "xzyxz"
Output: 3
Explanation: The target string can be constructed as follows "xz" + "y" + "xz".
```

__Constraints:__

- ```1 <= source.length, target.length <= 1000```
- ```source``` and ```target``` consist of lowercase English letters.

---

