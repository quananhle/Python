## [1424. Diagonal Traverse II](https://leetcode.com/problems/diagonal-traverse-ii)

```Tag```: ```Matrix``` ```Depth-First Search``` ```Breadth-First Search``` ```Hash Map```

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

### Diagonal Property

![image](https://leetcode.com/problems/diagonal-traverse-ii/Figures/1424/1.png)

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N)$
- __Space Complexity__: $\mathcal{O}(N)$

```Python
class Solution:
    def findDiagonalOrder(self, nums: List[List[int]]) -> List[int]:
        groups = collections.defaultdict(list)
        ROWS = len(nums)
        for row in range(ROWS - 1, -1, -1):
            for col in range(len(nums[row])):
                diagonal = row + col
                groups[diagonal].append(nums[row][col])
        
        res = list()
        curr = 0

        while curr in groups:
            res.extend(groups[curr])
            curr += 1
        
        return res
```

### Optimized Breadth-First Search

![image](https://leetcode.com/problems/diagonal-traverse-ii/Figures/1424/2.png)

We start a BFS from ```0, 0```. At each node ```row, col```, we first push ```row + 1, col``` to the queue and then ```row, col + 1```. Note that we only add a square to the queue if it both exists and has not been visited yet.

How do we know if a square has been visited yet? We could use a hash set to keep track of visited squares, but there is a simpler way. We only need to consider the square ```row + 1, col``` (down) if we are at the start of a diagonal. Otherwise, for every other square on the diagonal, the square below it has already been visited by the right edge of the previous square.

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N)$
- __Space Complexity__: $\mathcal{O}(\sqrt{N})$


```Python
class Solution:
    def findDiagonalOrder(self, nums: List[List[int]]) -> List[int]:
        queue = collections.deque([(0, 0)])
        res = list()

        while queue:
            row, col = queue.popleft()
            res.append(nums[row][col])

            if col == 0 and row < len(nums) - 1:
                queue.append((row + 1, col))
            if col < len(nums[row]) - 1:
                queue.append((row, col + 1))
            
        return res
```
