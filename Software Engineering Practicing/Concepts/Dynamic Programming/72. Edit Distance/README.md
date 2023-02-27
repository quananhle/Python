## [72. Edit Distance](https://leetcode.com/problems/edit-distance/)

```Tag```: ```Dynamic Programming```

#### Difficulty: Hard

Given two strings ```word1``` and ```word2```, return _the minimum number of operations required to convert ```word1``` to ```word2```_.

You have the following three operations permitted on a word:

- Insert a character
- Delete a character
- Replace a character

---

__Example 1:__
```
Input: word1 = "horse", word2 = "ros"
Output: 3
Explanation: 
horse -> rorse (replace 'h' with 'r')
rorse -> rose (remove 'r')
rose -> ros (remove 'e')
```

__Example 2:__
```
Input: word1 = "intention", word2 = "execution"
Output: 5
Explanation: 
intention -> inention (remove 't')
inention -> enention (replace 'i' with 'e')
enention -> exention (replace 'n' with 'x')
exention -> exection (replace 'n' with 'c')
exection -> execution (insert 'u')
```

__Constraints:__

- ```0 <= word1.length, word2.length <= 500```
- ```word1``` and ```word2``` consist of lowercase English letters.

---

### The Framework

#### Top-Down Dynamic Programming (Recursion)

```Python

```
