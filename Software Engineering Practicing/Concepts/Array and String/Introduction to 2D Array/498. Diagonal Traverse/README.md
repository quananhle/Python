## [498. Diagonal Traverse](https://leetcode.com/problems/diagonal-traverse)

```Tag```: ```Array``` ```Stack``` ```Depth-First Search``` 

#### Difficulty: Medium

Given an ```m x n``` matrix ```mat```, return _an array of all the elements of the array in a diagonal order_.

![image](https://github.com/quananhle/Python/assets/35042430/89f70c8b-4340-41d8-a949-2ca154f8d1cf)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/04/10/diag1-grid.jpg)
```
Input: mat = [[1,2,3],[4,5,6],[7,8,9]]
Output: [1,2,4,7,5,3,6,8,9]
```

__Example 2:__
```
Input: mat = [[1,2],[3,4]]
Output: [1,2,3,4]
```

__Constraints:__
```
m == mat.length
n == mat[i].length
1 <= m, n <= 104
1 <= m * n <= 104
-105 <= mat[i][j] <= 105
```

---

### Hash Table

The sum of row and col of all the cells in the same diagonal are equal

```Python
class Solution:
    def findDiagonalOrder(self, mat: List[List[int]]) -> List[int]:
        ROWS, COLS = len(mat), len(mat[0])
        res = list()        
        memo = collections.defaultdict(list)
        
        for row in range(ROWS):
            for col in range(COLS):
                '''
                if not row + col in memo:
                    memo[row+col] = [mat[row][col]]
                else:
                    memo[row+col].append(mat[row][col])
                '''
                memo[row+col].append(mat[row][col])
        for key,val in memo.items():
            if key % 2 != 0:
                for num in val:
                    res.append(num)
            else:
                for num in val[::-1]:
                    res.append(num)
        return res
```

### Depth-First Search

#### Traverse by column first, then row

![image](https://leetcode.com/problems/diagonal-traverse/solutions/459889/Figures/498/img1.png)

```Python
class Solution:
    def findDiagonalOrder(self, mat: List[List[int]]) -> List[int]:
        # Move diagonally from top-down and right-left
        DIRECTIONS = [(1,-1)]
        ROWS, COLS = len(mat), len(mat[0])
        res = list()
        visited = set()
        change_direction = True
        
        def dfs(row, col, queue):
            if not (0 <= row < ROWS and 0 <= col < COLS and not (row, col) in visited):
                return
            queue.append(mat[row][col])
            visited.add((row, col))
            [dfs(row + x, col + y, queue) for x, y in DIRECTIONS]
        
        for row in range(ROWS):
            for col in range(COLS):
                if not (row, col) in visited:
                    queue = list()
                    dfs(row, col, queue)

                    """
                    /  /  /  
                    [1,2,3] /
                    [4,5,6] /
                    [7,8,9]
                    Traverse by column and check diagonally. If no next column, move to next row
                    [[1], [2,4], [3,5,7], [6,8], [9]]
                    """

                    if change_direction:
                        res += queue[::-1]
                        # change_direction = False                       
                    else:
                        res += queue
                        # change_direction = True
                    change_direction = not change_direction
        return res
```
     
#### Traverse by row first, then column

```Python
class Solution:
    def findDiagonalOrder(self, mat: List[List[int]]) -> List[int]:
        # Move diagonally from bottom-up and left-right
        DIRECTIONS = [(-1,1)]
        ROWS, COLS = len(mat), len(mat[0])
        visited = set()
        res = list()
        cd = False

        def dfs (row, col, arr):
            if not (0 <= row < ROWS and 0 <= col < COLS and not (row, col) in visited):
                return
            arr.append(mat[row][col])
            visited.add((row, col))
            [dfs(row + dx, col + dy, arr) for dx, dy in DIRECTIONS]
        
        for col in range(COLS):
            for row in range(ROWS):
                if (row, col) in visited:
                    continue
                arr = list()
                dfs(row, col, arr)
                
                """
                  [1,2,3]
                / [4,5,6]
                / [7,8,9]
                /  /  /
                Traverse by row and check diagonally. If no next row, move to next column
                [[1], [2,4], [3,5,7], [6,8], [9]]
                """
                    
                if cd:
                    res += arr[::-1]
                else:
                    res += arr
                cd = not cd
        
        return res
```
