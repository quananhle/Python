## [1582. Special Positions in a Binary Matrix](https://leetcode.com/problems/special-positions-in-a-binary-matrix)

```Tag```: ```Matrix``` ```Array & String``` ```Hash Map```

#### Difficulty: Easy

Given an ```m x n``` binary matrix ```mat```, return _the number of special positions in ```mat```_.

A position ```(i, j)``` is called special if ```mat[i][j] == 1``` and all other elements in row ```i``` and column ```j``` are ```0``` (rows and columns are 0-indexed).

![image](https://github.com/quananhle/Python/assets/35042430/1a87ad98-5d6d-48cc-b8ae-78f3cfd5a3d4)

---

__Example 1:__

![image](https://github.com/quananhle/Python/assets/35042430/413ec753-7a29-4a25-b9ba-907bc2f0a360)
```
Input: mat = [[1,0,0],[0,0,1],[1,0,0]]
Output: 1
Explanation: (1, 2) is a special position because mat[1][2] == 1 and all other elements in row 1 and column 2 are 0.
```

__Example 2:__

![image](https://github.com/quananhle/Python/assets/35042430/1fb4db5d-e345-4355-9f21-5f15c7410694)
```
Input: mat = [[1,0,0],[0,1,0],[0,0,1]]
Output: 3
Explanation: (0, 0), (1, 1) and (2, 2) are special positions.
```

__Constraints:__

- $m == mat.length$
- $n == mat[i].length$
- $1 \le m, n \le 100$
- ```mat[i][j]``` is either ```0``` or ```1```.

---

### Brute Force

```Python

```

### Precompute

#### Two Passes

```Python
class Solution:
    def numSpecial(self, mat: List[List[int]]) -> int:
        ROWS, COLS = len(mat), len(mat[0])
        row_count, col_count = [0] * ROWS, [0] * COLS

        for row in range(ROWS):
            for col in range(COLS):
                if mat[row][col]:
                    row_count[row] += 1
                    col_count[col] += 1
        
        ans = 0
        for row in range(ROWS):
            for col in range(COLS):
                if mat[row][col]:
                    if row_count[row] == 1 and col_count[col] == 1:
                        ans += 1
        
        return ans
```

```Python
class Solution:
    def numSpecial(self, mat: List[List[int]]) -> int:
        ROWS, COLS = len(mat), len(mat[0])
        row_count, col_count = collections.defaultdict(int), collections.defaultdict(int)

        for row in range(ROWS):
            for col in range(COLS):
                if mat[row][col]:
                    row_count[row] += 1
                    col_count[col] += 1
        
        ans = 0
        for row in range(ROWS):
            for col in range(COLS):
                if mat[row][col]:
                    if row_count[row] == 1 and col_count[col] == 1:
                        ans += 1
        
        return ans
```

### ```zip()```

```Python
class Solution:
    def numSpecial(self, mat: List[List[int]]) -> int:
        rows = [row for row, val in enumerate(mat) if sum(val) == 1]
        cols = [col for col, val in enumerate(zip(*mat)) if sum(val) == 1]
        return sum(mat[row][col] for row in rows for col in cols)
```
