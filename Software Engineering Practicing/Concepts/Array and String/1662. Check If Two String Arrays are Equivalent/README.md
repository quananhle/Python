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

### Two Pointers

```Python
class Solution:
    def arrayStringsAreEqual(self, word1: List[str], word2: List[str]) -> bool:
        i = j = 0
        c1 = c2 = 0
        n, m = len(word1), len(word2)

        while i < n and j < m:
            if word1[i][c1] != word2[j][c2]:
                return False
            c1 += 1; c2 += 1

            if c1 == len(word1[i]):
                i += 1
                c1 = 0
            
            if c2 == len(word2[j]):
                j += 1
                c2 = 0

        return i == n and j == m
```

### String Concatenation

```Python
class Solution:
    def arrayStringsAreEqual(self, word1: List[str], word2: List[str]) -> bool:
        str1 = str2 = ""

        for word in word1:
            str1 += word
        for word in word2:
            str2 += word 

        return str1 == str2
```

#### One-Liner

```Python
class Solution:
    def arrayStringsAreEqual(self, word1: List[str], word2: List[str]) -> bool:
        return "".join(word1) == "".join(word2)
```
