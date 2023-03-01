## [422. Valid Word Square](https://leetcode.com/problems/valid-word-square/)

```Tag```: ```Matrix```

#### Difficulty: Easy

Given an array of strings ```words```, return _```true``` if it forms a valid word square_.

A sequence of strings forms a valid __word square__ if the k<sup>th</sup> row and column read the same string, where ```0 <= k < max(numRows, numColumns)```.

![image](https://user-images.githubusercontent.com/35042430/222055960-6492ee13-ce02-4aad-95b9-e0b469dcff6a.png)

---
 
__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/04/09/validsq1-grid.jpg)
```
Input: words = ["abcd","bnrt","crmy","dtye"]
Output: true
Explanation:
The 1st row and 1st column both read "abcd".
The 2nd row and 2nd column both read "bnrt".
The 3rd row and 3rd column both read "crmy".
The 4th row and 4th column both read "dtye".
Therefore, it is a valid word square.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2021/04/09/validsq2-grid.jpg)
```
Input: words = ["abcd","bnrt","crm","dt"]
Output: true
Explanation:
The 1st row and 1st column both read "abcd".
The 2nd row and 2nd column both read "bnrt".
The 3rd row and 3rd column both read "crm".
The 4th row and 4th column both read "dt".
Therefore, it is a valid word square.
```

__Example 3:__

![image](https://assets.leetcode.com/uploads/2021/04/09/validsq3-grid.jpg)
```
Input: words = ["ball","area","read","lady"]
Output: false
Explanation:
The 3rd row reads "read" while the 3rd column reads "lead".
Therefore, it is NOT a valid word square.
```

__Constraints:__

- ```1 <= words.length <= 500```
- ```1 <= words[i].length <= 500```
- ```words[i]``` consists of only lowercase English letters.

---

```Python
class Solution:
    def validWordSquare(self, words: List[str]) -> bool:
        rows = len(words)
        for row in range(rows):
            cols = len(words[row])
            for col in range(cols):
                if col >= rows or row >= len(words[col]) or words[row][col] != words[col][row]:
                    return False
        return True
```

```Python
class Solution:
    def validWordSquare(self, words: List[str]) -> bool:
        try:
            for i in range(len(words)):
                for j in range(len(words[i])):
                    if words[i][j] != words[j][i]:
                        return False
            return True
        except IndexError:
            return False
```
