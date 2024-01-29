## [1074. Number of Submatrices That Sum to Target](https://leetcode.com/problems/number-of-submatrices-that-sum-to-target)

```Tag```: ```Prefix Sum``` ```Matrix```

#### Difficulty: Hard

Given a ```matrix``` and a ```target```, return _the number of non-empty submatrices that sum to ```target```_.

A submatrix ```x1```, ```y1```, ```x2```, ```y2``` is the set of all cells ```matrix[x][y]``` with $x_1 \le x \le x_2$ and $y_1 \le y \le y_2$.

Two submatrices ```(x1, y1, x2, y2)``` and ```(x1', y1', x2', y2')``` are different if they have some coordinate that is different: for example, if $x_1 \neq x_1'$.

![image](https://github.com/quananhle/Python/assets/35042430/bd0897ca-2a04-43f1-a8b9-1192c1aae50a)

#### Similar Problems:

- [Number of Subarrays that Sum to Target](https://leetcode.com/problems/subarray-sum-equals-k/)
- [Subarray Sum Equals k](https://leetcode.com/problems/subarray-sum-equals-k/)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/09/02/mate1.jpg)
```
Input: matrix = [[0,1,0],[1,1,1],[0,1,0]], target = 0
Output: 4
Explanation: The four 1x1 submatrices that only contain 0.
```

__Example 2:__
```
Input: matrix = [[1,-1],[-1,1]], target = 0
Output: 5
Explanation: The two 1x2 submatrices, plus the two 2x1 submatrices, plus the 2x2 submatrix.
```

__Example 3:__
```
Input: matrix = [[904]], target = 0
Output: 0
```

__Constraints:__

- $1 \le matrix.length \le 100$
- $1 \le matrix[0].length \le 100$
- $-1000 \le matrix[i] \le 1000$
- $-10^8 \le target \le 10^8$

---

### Prerequisites

#### 2D Prefix Sum

![image](https://leetcode.com/problems/number-of-submatrices-that-sum-to-target/Figures/1074/1d_prefix3.png)

> In 2D the idea is basically the same: prefix sum $P_{mn}$ is a sum of the current value with the integers above or on the left.

$P_{mn} = \sum\limits_{i = 0}^{i = m}\sum\limits_{j = 0}^{j = n}{x_{ij}}$

![image](https://leetcode.com/problems/number-of-submatrices-that-sum-to-target/Figures/1074/2d_prefix.png)

```Python
# compute 2D prefix sum
for i in range(1, r + 1):
    for j in range(1, c + 1):
        ps[i][j] = ps[i - 1][j] + ps[i][j - 1] - ps[i - 1][j - 1] + matrix[i - 1][j - 1]
```

#### Reduce 2D Problem to 1D

![image](https://leetcode.com/problems/number-of-submatrices-that-sum-to-target/Figures/1074/all_matrices3.png)

```Python
h = defaultdict(int)
h[0] = 1

for col in range(1, c + 1):
    # current 1D prefix sum  
    curr_sum = ps[r2][col] - ps[r1 - 1][col]
    
    # add subarrays which sum up to (curr_sum - target)
    count += h[curr_sum - target]
    
    # save current prefix sum
    h[curr_sum] += 1
```

### Approach 1: Number of Subarrays that Sum to Target: Horizontal 1D Prefix Sum

```Python
class Solution:
    def numSubmatrixSumTarget(self, matrix: List[List[int]], target: int) -> int:
        ROWS, COLS = len(matrix), len(matrix[0])
        ans = 0

        # Compute 2D prefix sum
        prefix_sum_2D = collections.defaultdict(int)
        for row in range(1, ROWS + 1):
            for col in range(1, COLS + 1):
                prefix_sum_2D[(row, col)] = prefix_sum_2D[(row - 1, col)] + prefix_sum_2D[(row, col - 1)] - prefix_sum_2D[(row - 1, col - 1)] + matrix[row - 1][col - 1]
            
        # Flatten 2D matrix to 1D array
        for r1 in range(1, ROWS + 1):
            for r2 in range(r1, ROWS + 1):
                h = collections.defaultdict(int)
                h[0] = 1

                for col in range(1, COLS + 1):
                    # Current 1D prefix sum
                    curr_sum = prefix_sum_2D[(r2, col)] - prefix_sum_2D[(r1 - 1, col)]
                    # Add subarray if curr_sum - target == 0
                    ans += h[(curr_sum - target)]
                    # Save current prefix sum
                    h[curr_sum] += 1

        return ans
```
