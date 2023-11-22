## [1424. Diagonal Traverse II](https://leetcode.com/problems/diagonal-traverse-ii)

```Tag```: ```Matrix``` ```Depth-First Search``` ```Breadth-First Search```

#### Difficulty: Medium

Given a 2D integer array ```nums```, return _all elements of ```nums``` in diagonal order as shown in the below images_.

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/04/08/sample_1_1784.png)
```
Input: nums = [[1,2,3],[4,5,6],[7,8,9]]
Output: [1,4,2,7,5,3,8,6,9]
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2020/04/08/sample_2_1784.png)
```
Input: nums = [[1,2,3,4,5],[6,7],[8],[9,10,11],[12,13,14,15,16]]
Output: [1,6,2,8,7,3,9,4,12,10,5,13,11,14,15,16]
```

__Constraints:__

- $1 \le nums.length \le 10^5$
- $1 \le nums[i].length \le 10^5$
- $1 \le sum(nums[i].length) \le 10^5$
- $1 \le nums[i][j] \le 10^5$

---

### Brute Force

#### Depth-First Search (Time Limit Exceeded)

```Python
class Solution:
    def findDiagonalOrder(self, nums: List[List[int]]) -> List[int]:
        longest = 0
        for row in nums:
            longest = max(longest, len(row))
        
        for row in nums:
            if len(row) < longest:
                row += [0] * (longest - len(row))

        ROWS, COLS = len(nums), len(nums[0])
        DIRECTIONS = [(-1, 1)]
        res = list()

        def dfs(row, col):
            if not (0 <= row < ROWS and 0 <= col < COLS):
                return
            
            if nums[row][col] != 0:
                res.append(nums[row][col])
            [dfs(row + dx, col + dy) for dx, dy in DIRECTIONS]
        
        for row in range(ROWS):
            dfs(row, 0)
        for col in range(1, COLS):
            dfs(row, col)

        return res
```
