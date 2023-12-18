## [2482. Difference Between Ones and Zeros in Row and Column](https://leetcode.com/problems/difference-between-ones-and-zeros-in-row-and-column)

```Tag```: ```Matrix``` ```Array & String``` ```Math```

#### Difficulty: Medium

You are given a __0-indexed__ ```m x n``` binary matrix ```grid```.

A __0-indexed__ ```m x n``` difference matrix ```diff``` is created with the following procedure:

- Let the number of ones in the $i^{th}$ row be $onesRow_i$.
- Let the number of ones in the $j^{th}$ column be $onesCol_j$.
- Let the number of zeros in the $i^{th}$ row be $zerosRow_i$.
- Let the number of zeros in the $j^{th}$ column be $zerosCol_j$.
- $diff[i][j] = onesRow_i + onesCol_j - zerosRow_i - zerosCol_j$

Return _the difference matrix ```diff```_.

![image](https://github.com/quananhle/Python/assets/35042430/b6e3d89a-46fc-4e8d-af88-6fd50433111a)

---

__Example 1:__

![image](https://github.com/quananhle/Python/assets/35042430/a8481b52-3922-4afb-ba6a-325139c4181b)
```
Input: grid = [[0,1,1],[1,0,1],[0,0,1]]
Output: [[0,0,4],[0,0,4],[-2,-2,2]]
Explanation:
- diff[0][0] = onesRow0 + onesCol0 - zerosRow0 - zerosCol0 = 2 + 1 - 1 - 2 = 0 
- diff[0][1] = onesRow0 + onesCol1 - zerosRow0 - zerosCol1 = 2 + 1 - 1 - 2 = 0 
- diff[0][2] = onesRow0 + onesCol2 - zerosRow0 - zerosCol2 = 2 + 3 - 1 - 0 = 4 
- diff[1][0] = onesRow1 + onesCol0 - zerosRow1 - zerosCol0 = 2 + 1 - 1 - 2 = 0 
- diff[1][1] = onesRow1 + onesCol1 - zerosRow1 - zerosCol1 = 2 + 1 - 1 - 2 = 0 
- diff[1][2] = onesRow1 + onesCol2 - zerosRow1 - zerosCol2 = 2 + 3 - 1 - 0 = 4 
- diff[2][0] = onesRow2 + onesCol0 - zerosRow2 - zerosCol0 = 1 + 1 - 2 - 2 = -2
- diff[2][1] = onesRow2 + onesCol1 - zerosRow2 - zerosCol1 = 1 + 1 - 2 - 2 = -2
- diff[2][2] = onesRow2 + onesCol2 - zerosRow2 - zerosCol2 = 1 + 3 - 2 - 0 = 2
```

__Example 2:__

![image](https://github.com/quananhle/Python/assets/35042430/64a3fd9c-6b4f-4728-a111-b05039e1f2c0)
```
Input: grid = [[1,1,1],[1,1,1]]
Output: [[5,5,5],[5,5,5]]
Explanation:
- diff[0][0] = onesRow0 + onesCol0 - zerosRow0 - zerosCol0 = 3 + 2 - 0 - 0 = 5
- diff[0][1] = onesRow0 + onesCol1 - zerosRow0 - zerosCol1 = 3 + 2 - 0 - 0 = 5
- diff[0][2] = onesRow0 + onesCol2 - zerosRow0 - zerosCol2 = 3 + 2 - 0 - 0 = 5
- diff[1][0] = onesRow1 + onesCol0 - zerosRow1 - zerosCol0 = 3 + 2 - 0 - 0 = 5
- diff[1][1] = onesRow1 + onesCol1 - zerosRow1 - zerosCol1 = 3 + 2 - 0 - 0 = 5
- diff[1][2] = onesRow1 + onesCol2 - zerosRow1 - zerosCol2 = 3 + 2 - 0 - 0 = 5
```

__Constraints:__

- $m == grid.length$
- $n == grid[i].length$
- $1 \le m, n \le 10^5$
- $1 \le m \cdot n \le 10^5$
- ```grid[i][j]``` is either ```0``` or ```1```.

---

### Array & String

![image](https://github.com/quananhle/Python/assets/35042430/d24a70ca-7852-427c-89bf-2180905cc21a)

```Python

```

### Hash Map

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(M \cdot N)$
- __Space Complexity__: $\mathcal{O}(M + N)$

```Python
class Solution:
    def onesMinusZeros(self, grid: List[List[int]]) -> List[List[int]]:
        ROWS, COLS = len(grid), len(grid[0])
        ones_row = collections.defaultdict(int)
        ones_col = collections.defaultdict(int)

        for i in range(ROWS):
            for j in range(COLS):
                ones_row[i] += grid[i][j]
                ones_col[j] += grid[i][j]
        
        res = [[None] * COLS for _ in range(ROWS)]
        for i in range(ROWS):
            for j in range(COLS):
                res[i][j] = 2 * ones_row[i] + 2 * ones_col[j] - ROWS - COLS
        
        return res
```
