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

### Divide and Conquer

__Time Complexity__: ```0(NlogN)```, perform binary search operation while traversing every row of the matrix

__Space Complexity__: ```O(logN)```, extra memory to keep up recursion stack

```Python
class Solution:
    def searchMatrix(self, matrix: List[List[int]], target: int) -> bool:
        if not matrix:
            return False
        
        def search(left, up, right, down):
            if left > right or up > down:
                return False
            
            elif target < matrix[up][left] or target > matrix[down][right]:
                return False
            
            mid = left + (right - left) // 2

            row = up
            while row <= down and matrix[row][mid] <= target:
                if matrix[row][mid] == target:
                    return True
                row += 1
            
            return search(left, row, mid - 1, down) or search(mid + 1, up, right, row - 1)
        
        return search(0, 0, len(matrix[0]) - 1, len(matrix) - 1)
```

### Search Space Reduction

#### Algorithms

Because the rows are sorted from left-to-right, we know that every value to the right of the current value is larger. Therefore, if the current value is already larger than target, we know that every value to its right will also be too large. A very similar argument can be made for the columns, so this manner of search will always find target in the matrix (if it is present).

![image](https://user-images.githubusercontent.com/35042430/217356242-01cf01bc-2d13-4b61-a511-24072e539720.png)
```
row -= 1
```
![image](https://user-images.githubusercontent.com/35042430/217356282-b0c32d85-a459-48a9-818e-2beb181cd193.png)
```
row -= 1
```
![image](https://user-images.githubusercontent.com/35042430/217356341-186bb63e-c70f-468d-bc43-4266d9711527.png)
```
col += 1
```
![image](https://user-images.githubusercontent.com/35042430/217356419-46796d38-c0a6-4342-aadc-dd0b1f246fbf.png)
```
col += 1
```
![image](https://user-images.githubusercontent.com/35042430/217356465-670b72ac-8b62-4574-b3e6-4b712e5b9f9a.png)
```
row -= 1
```
![image](https://user-images.githubusercontent.com/35042430/217356506-7698bfac-c26b-4a17-bbd6-4564f095ce65.png)

__Time Complexity__: ```0(N + M)```, traverse the total length of rows and columns at worst

__Space Complexity__: ```O(1)```, constant memory space for pointers

```Python
class Solution:
    def searchMatrix(self, matrix: List[List[int]], target: int) -> bool:
        if not len(matrix) or not len(matrix[0]):
            return False
        
        ROWS, COLS = len(matrix), len(matrix[0])

        # Start the pointer from "bottom-left" of the matrix as integers are sorted in ascending order form left - right, top - bottom
        '''
        matrix[left][top] is the smallest element
        matrix[right][bottom] is the largest element
        '''

        row, col = ROWS - 1, 0
        
        # Traverse from bottom-up and left-right
        while col < COLS and row >= 0:
            if matrix[row][col] > target:
                # Move up
                row -= 1
            elif matrix[row][col] < target:
                # Move right
                col += 1
            else:
                return True

        return False
```
