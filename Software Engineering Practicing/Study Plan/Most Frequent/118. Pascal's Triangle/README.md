## [118. Pascal's Triangle](https://leetcode.com/problems/pascals-triangle)

```Tag```: ```Dynamic Programming```

#### Difficulty: Easy

Given an integer ```numRows```, return the first numRows of __Pascal's triangle__.

In __Pascal's triangle__, each number is the sum of the two numbers directly above it as shown:

![image](https://user-images.githubusercontent.com/35042430/209506348-fe24205d-1158-4810-aa05-0bcd7ac84df4.png)

---

![image](https://upload.wikimedia.org/wikipedia/commons/0/0d/PascalTriangleAnimated2.gif)

__Example 1:__
```
Input: numRows = 5
Output: [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]
```

__Example 2:__
```
Input: numRows = 1
Output: [[1]]
```

__Constraints:__

- $1 \le numRows \le 30$


---

### Dynamic Programming

```Python
class Solution:
    def generate(self, numRows: int) -> List[List[int]]:
        res = [[1] * i for i in range(1, numRows+1)]

        for i in range(2, len(res)):
            for j in range(1, len(res[i-1])):
                res[i][j] = res[i-1][j-1] + res[i-1][j]

        return res
```

```Python
class Solution:
    def generate(self, numRows: int) -> List[List[int]]:
        res = [[1] * n for n in range(1, numRows + 1)]
        
        for row in range(2, numRows):
            for col in range(1, row): 
                res[row][col] = res[row - 1][col - 1] + res[row - 1][col]
        
        return res
```
