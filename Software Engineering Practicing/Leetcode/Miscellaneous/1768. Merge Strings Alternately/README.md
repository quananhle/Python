## [1768. Merge Strings Alternately](https://leetcode.com/problems/merge-strings-alternately/)

```Tag```: ```Two Pointers```

#### Difficulty: Easy

You are given two strings ```word1``` and ```word2```. Merge the strings by adding letters in alternating order, starting with ```word1```. If a string is longer than the other, append the additional letters onto the end of the merged string.

Return _the merged string_.

![image](https://user-images.githubusercontent.com/35042430/232670032-0cce1aa5-b1e3-4024-bc37-f97f9b564f1f.png)

---

__Example 1:__
```
Input: word1 = "abc", word2 = "pqr"
Output: "apbqcr"
Explanation: The merged string will be merged as so:
word1:  a   b   c
word2:    p   q   r
merged: a p b q c r
```

__Example 2:__
```
Input: word1 = "ab", word2 = "pqrs"
Output: "apbqrs"
Explanation: Notice that as word2 is longer, "rs" is appended to the end.
word1:  a   b 
word2:    p   q   r   s
merged: a p b q   r   s
```

__Example 3:__
```
Input: word1 = "abcd", word2 = "pq"
Output: "apbqcd"
Explanation: Notice that as word1 is longer, "cd" is appended to the end.
word1:  a   b   c   d
word2:    p   q 
merged: a p b q c   d
```

__Constraints:__

- ```1 <= word1.length, word2.length <= 100```
- ```word1``` and ```word2``` consist of lowercase English letters.

---

### Two Pointers

```Python
class Solution:
    def mergeAlternately(self, word1: str, word2: str) -> str:
        m, n = len(word1), len(word2)
        res = list()
        i, j = 0, 0

        while i < m and j < n:
            res.append(word1[i])
            res.append(word2[j])
            i += 1
            j += 1
        
        if i < m:
            res.append(word1[i:])
        elif j < n:
            res.append(word2[j:])

        return "".join(res)
```

### One Liner

```Python
class Solution:
    def mergeAlternately(self, word1: str, word2: str) -> str:
        return "".join(c for pair in zip_longest(word1, word2, fillvalue='') for c in pair)
```

### One Pointer

```Python
class Solution:
    def mergeAlternately(self, word1: str, word2: str) -> str:
        res = list()
        n = max(len(word1), len(word2))
        
        for i in range(n):
            if i < len(word1):
                res.append(word1[i])
            if i < len(word2):
                res.append(word2[i])
        
        return "".join(res)
```
