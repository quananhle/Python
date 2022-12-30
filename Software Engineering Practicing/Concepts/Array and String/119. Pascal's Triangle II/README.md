## 119. Pascal's Triangle II

```Tag```: ```Dynamic Programming```

#### Difficulty: Easy

Given an integer ```rowIndex```, return the ```rowIndex```<sup>th</sup> __(0-indexed)__ row of the __Pascal's triangle__.

In __Pascal's triangle__, each number is the sum of the two numbers directly above it as shown:

![image](https://upload.wikimedia.org/wikipedia/commons/0/0d/PascalTriangleAnimated2.gif)

![image](https://user-images.githubusercontent.com/35042430/210032763-ca5de1be-1133-4093-a58d-8c79922be9da.png)

---

__Example 1:__
```
Input: rowIndex = 3
Output: [1,3,3,1]
```

__Example 2:__
```
Input: rowIndex = 0
Output: [1]
```

__Example 3:__
```
Input: rowIndex = 1
Output: [1,1]
```

__Constraints:__
```
0 <= rowIndex <= 33
```

---

### Brute Force with Nested Loop

```Python
class Solution:
    def getRow(self, rowIndex: int) -> List[int]:
        res = [[1] * (i + 1) for i in range(rowIndex + 1)]
        for i in range(2, len(res)):
            for j in range(1, len(res[i])-1):
                res[i][j] = res[i-1][j] + res[i-1][j-1]
        return res[rowIndex]
```

```Python

```
__Follow up__: Could you optimize your algorithm to use only ```O(rowIndex)``` extra space?
