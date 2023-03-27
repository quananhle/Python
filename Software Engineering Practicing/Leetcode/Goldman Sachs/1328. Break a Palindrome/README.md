## [1328. Break a Palindrome](https://leetcode.com/problems/break-a-palindrome/)

```Tag```: ```Greedy```

#### Difficulty: Medium

Given a palindromic string of lowercase English letters ```palindrome```, replace __exactly one__ character with any lowercase English letter so that the resulting string is __not__ a palindrome and that it is the __lexicographically smallest__ one possible.

Return _the resulting string. If there is no way to replace a character to make it not a palindrome, return an __empty string___.

A string ```a``` is lexicographically smaller than a string ```b``` (of the same length) if in the first position where ```a``` and ```b``` differ, ```a``` has a character strictly smaller than the corresponding character in ```b```. For example, ```"abcc"``` is lexicographically smaller than ```"abcd"``` because the first position they differ is at the fourth character, and ```'c'``` is smaller than ```'d'```.

![image](https://user-images.githubusercontent.com/35042430/228003149-f71b460e-dbb2-402c-ae37-4e59eac40b60.png)

---

__Example 1:__
```
Input: palindrome = "abccba"
Output: "aaccba"
Explanation: There are many ways to make "abccba" not a palindrome, such as "zbccba", "aaccba", and "abacba".
Of all the ways, "aaccba" is the lexicographically smallest.
```

__Example 2:__
```
Input: palindrome = "a"
Output: ""
Explanation: There is no way to replace a single character to make "a" not a palindrome, so return an empty string.
```

__Constraints:__

- ```1 <= palindrome.length <= 1000```
- ```palindrome``` consists of only lowercase English letters.

---

