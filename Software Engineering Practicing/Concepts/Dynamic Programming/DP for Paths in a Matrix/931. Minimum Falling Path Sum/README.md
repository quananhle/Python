## 931. Minimum Falling Path Sum

```Tag```: ```Dynamic Programming```

#### Difficulty: Medium

Given an ```n x n``` array of integers ```matrix```, return _the __minimum sum__ of any __falling path__ through ```matrix```_.

A __falling path__ starts at any element in the first row and chooses the element in the next row that is either directly below or diagonally left/right. Specifically, the next element from position ```(row, col)``` will be ```(row + 1, col - 1)```, ```(row + 1, col)```, or ```(row + 1, col + 1)```.

![image](https://user-images.githubusercontent.com/35042430/220773219-7dfb7975-8782-4538-8e71-78204286846e.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/11/03/failing1-grid.jpg)
```
Input: matrix = [[2,1,3],[6,5,4],[7,8,9]]
Output: 13
Explanation: There are two falling paths with a minimum sum as shown.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2021/11/03/failing2-grid.jpg)
```
Input: matrix = [[-19,57],[-40,-5]]
Output: -59
Explanation: The falling path with a minimum sum is shown.
```

__Constraints:__

- ```n == matrix.length == matrix[i].length```
- ```1 <= n <= 100```
- ```-100 <= matrix[i][j] <= 100```

---

### The Framework

#### Top-Down Dynamic Programming

```Python

```
