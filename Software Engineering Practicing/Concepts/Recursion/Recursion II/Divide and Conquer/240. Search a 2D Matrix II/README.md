## 240. Search a 2D Matrix II

```Tag```: ```Recursion``` ```Depth-First Search``` ```Breadth-First Seach```

#### Difficulty: Medium

Write an efficient algorithm that searches for a value ```target``` in an ```m x n``` integer matrix ```matrix```. This matrix has the following properties:

- Integers in each row are sorted in ascending from left to right.
- Integers in each column are sorted in ascending from top to bottom.

![image](https://user-images.githubusercontent.com/35042430/217305837-d23c2e9a-a548-443d-bd46-3df02c53eebb.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/11/24/searchgrid2.jpg)
```
Input: matrix = [[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]], target = 5
Output: true
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2020/11/24/searchgrid.jpg)
```
Input: matrix = [[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]], target = 20
Output: false
```

__Constraints:__

- ```m == matrix.length```
- ```n == matrix[i].length```
- ```1 <= n, m <= 300```
- -10<sup>9</sup> <= ```matrix[i][j]``` <= 10<sup>9</sup>
- All the integers in each row are __sorted__ in ascending order.
- All the integers in each column are __sorted__ in ascending order.
- -10<sup>9</sup> <= ```target``` <= 10<sup>9</sup>

---

### Depth-First Seach

#### Recursive Approach

```Python
class Solution:
    def searchMatrix(self, matrix: List[List[int]], target: int) -> bool:
        self.found = False

        ROWS, COLS = len(matrix), len(matrix[0])
        visited = set()
        DIRECTIONS = [(1,0), (0,1)]

        def dfs(row, col):
            if not (0 <= row < ROWS and 0 <= col < COLS) or (row, col) in visited or self.found: 
                return
            visited.add((row, col))
            if target == matrix[row][col]:
                self.found = True
                return
            else:
                [dfs(row + x, col + y) for x, y in DIRECTIONS]

        dfs(0, 0)

        return self.found
```

#### Iterative Depth-First Search

```Python
class Solution:
    def searchMatrix(self, matrix: List[List[int]], target: int) -> bool:
        found = False

        ROWS, COLS = len(matrix), len(matrix[0])
        visited = set()
        DIRECTIONS = [(1,0), (0,1)]
        stack = [(0,0)]

        while stack:
            row, col = stack.pop()
            if not (0 <= row < ROWS and 0 <= col < COLS) or (row, col) in visited:
                continue
            visited.add((row, col))
            if matrix[row][col] == target:
                found = True
                break
            for x, y in DIRECTIONS:
                stack.append([row + x, col + y])

        return found
```

### Breadth-First Search

#### Iterative Approach

```Python
class Solution:
    def searchMatrix(self, matrix: List[List[int]], target: int) -> bool:
        found = False

        ROWS, COLS = len(matrix), len(matrix[0])
        visited = set()
        DIRECTIONS = [(1,0), (0,1)]
        queue = collections.deque([(0,0)])

        while queue:
            row, col = queue.popleft()
            if not (0 <= row < ROWS and 0 <= col < COLS) or (row, col) in visited:
                continue
            visited.add((row, col))
            if matrix[row][col] == target:
                found = True
                break
            for x, y in DIRECTIONS:
                queue.append([row + x, col + y])

        return found
```

### Binary Search

__Time Complexity__: ```0(N*M)```, traversing through the matrix to build array costs ```N*M```, sort operations takes NlogN

__Space Complexity__: ```O(N*M)```, extra memory for flattening matrix

```Python
class Solution:
    def searchMatrix(self, matrix: List[List[int]], target: int) -> bool:
        # Binary Search
        # Flatten the 2D matrix into 1D list
        '''
        array = [col for row in matrix for col in row]
        '''
        nums = list(chain.from_iterable(matrix))
        nums.sort()
        self.found = False

        def binary_search(lo, hi):
            if lo <= hi:
                mid = lo + (hi - lo) // 2
                
                if nums[mid] == target:
                    self.found = True
                    return
                elif nums[mid] > target:
                    binary_search(lo, mid - 1)
                else:
                    binary_search(mid + 1, hi)
        
        binary_search(0, len(nums) - 1)

        return self.found
```

__Time Complexity__: ```0(NlogN)```, perform binary search operation while traversing every row of the matrix

__Space Complexity__: ```O(1)```, constant memory space for pointers

```Python
class Solution:
    def searchMatrix(self, matrix: List[List[int]], target: int) -> bool:
        self.found = False
        ROWS, COLS = len(matrix), len(matrix[0])

        def binary_search(row, lo, hi):
            if lo <= hi:
                mid = lo + (hi - lo) // 2
                if matrix[row][mid] == target:
                    self.found = True
                    return
                elif matrix[row][mid] > target:
                    binary_search(row, lo, mid - 1)
                else:
                    binary_search(row, mid + 1, hi)

        for row in range(ROWS):
            binary_search(row, 0, len(matrix[row])- 1)
            if self.found:
                return True

        return False
```

### Brute Force

__Time Complexity__: ```0(N*M)```, nested loop through rows and columns of the matrix

__Space Complexity__: ```O(1)```, constant memory space for pointers

```Python
class Solution:
    def searchMatrix(self, matrix: List[List[int]], target: int) -> bool:
        for row in matrix:
            if target in row:
                return True
        return False
```

```Python
class Solution:
    def searchMatrix(self, matrix: List[List[int]], target: int) -> bool:
        ROWS, COLS = len(matrix), len(matrix[0])
        for row in range(ROWS):
            for col in range(COLS):
                if matrix[row][col] == target:
                    return True
        return False
```
