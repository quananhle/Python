## [1312. Minimum Insertion Steps to Make a String Palindrome](https://leetcode.com/problems/minimum-insertion-steps-to-make-a-string-palindrome/)

```Tag```:

#### Difficulty: Hard

Given a string ```s```. In one step you can insert any character at any index of the string.

Return _the minimum number of steps to make ```s``` palindrome_.

A Palindrome String is one that reads the same backward as well as forward.

![image](https://user-images.githubusercontent.com/35042430/233757671-46e302d1-0163-483d-85bc-b9999c701adc.png)

---

__Example 1:__
```
Input: s = "zzazz"
Output: 0
Explanation: The string "zzazz" is already palindrome we do not need any insertions.
```

__Example 2:__
```
Input: s = "mbadm"
Output: 2
Explanation: String can be "mbdadbm" or "mdbabdm".
```

__Example 3:__
```
Input: s = "leetcode"
Output: 5
Explanation: Inserting 5 characters the string becomes "leetcodocteel".
```

__Constraints:__

- ```1 <= s.length <= 500```
- ```s``` consists of lowercase English letters.

---
