## 221. Maximal Square

```Tag```: ```Dynamic Programming```

#### Difficulty: Medium

Given an ```m x n``` binary ```matrix``` filled with ```0```'s and ```1```'s, _find the largest square containing only ```1```'s and return its area_.

![image](https://user-images.githubusercontent.com/35042430/219122468-77912fa5-52f5-45df-b9cd-0595000c9930.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/11/26/max1grid.jpg)
```
Input: matrix = [["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]]
Output: 4
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2020/11/26/max2grid.jpg)
```
Input: matrix = [["0","1"],["1","0"]]
Output: 1
```

__Example 3:__
```
Input: matrix = [["0"]]
Output: 0
```

__Constraints:__

- ```m == matrix.length```
- ```n == matrix[i].length```
- ```1 <= m, n <= 300```
- ```matrix[i][j]``` is ```'0'``` or ```'1'```.

---

