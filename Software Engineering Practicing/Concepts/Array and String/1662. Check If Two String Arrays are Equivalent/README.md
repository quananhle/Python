## [1662. Check If Two String Arrays are Equivalent](https://leetcode.com/problems/check-if-two-string-arrays-are-equivalent)

```Tag```: ```Array & String```

#### Difficulty: Easy

Given two string arrays ```word1``` and ```word2```, return _```True``` if the two arrays represent the same string, and ```False``` otherwise_.

A string is represented by an array if the array elements concatenated in order forms the string.

![image](https://github.com/quananhle/Python/assets/35042430/2fd60c9e-3861-45ac-b793-5e8ef7a5e998)

---

__Example 1:__
```
Input: word1 = ["ab", "c"], word2 = ["a", "bc"]
Output: true
Explanation:
word1 represents string "ab" + "c" -> "abc"
word2 represents string "a" + "bc" -> "abc"
The strings are the same, so return true.
```

__Example 2:__
```
Input: word1 = ["a", "cb"], word2 = ["ab", "c"]
Output: false
```

__Example 3:__
```
Input: word1  = ["abc", "d", "defg"], word2 = ["abcddefg"]
Output: true
```

__Constraints:__

- $1 \le word1.length, word2.length \le 10^3$
- $1 \le word1[i].length, word2[i].length \le 10^3$
- $1 \le sum(word1[i].length), sum(word2[i].length) \le 10^3$
- ```word1[i]``` and ```word2[i]``` consist of lowercase letters.

---
