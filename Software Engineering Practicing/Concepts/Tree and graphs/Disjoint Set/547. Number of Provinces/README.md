## 547. Number of Provinces

```Tag```: ```Depth-First Search``` ```Breadth-First Search``` ```Union-Find```

### Difficulty: Medium

There are ```n``` cities. Some of them are connected, while some are not. If city ```a``` is connected directly with city ```b```, and city ```b``` is connected directly with city ```c```, then city ```a``` is connected indirectly with city ```c```.

A province is a group of directly or indirectly connected cities and no other cities outside of the group.

You are given an ```n x n``` matrix ```isConnected``` where ```isConnected[i][j] = 1``` if the i<sup>th</sup> city and the j<sup>th</sup> city are directly connected, and ```isConnected[i][j] = 0``` otherwise.

Return _the total number of __provinces___.

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/12/24/graph1.jpg)
```
Input: isConnected = [[1,1,0],[1,1,0],[0,0,1]]
Output: 2
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2020/12/24/graph2.jpg)
```
Input: isConnected = [[1,0,0],[0,1,0],[0,0,1]]
Output: 3
```

__Constraints:__
```
1 <= n <= 200
n == isConnected.length
n == isConnected[i].length
isConnected[i][j] is 1 or 0.
isConnected[i][i] == 1
isConnected[i][j] == isConnected[j][i]
```

---

### Depth-First Search

The given matrix can be viewed as the __Adjacency Matrix__ of a graph. By viewing the matrix in such a manner, our problem reduces to the problem of __finding the number of connected components in an undirected graph__.

![image](https://user-images.githubusercontent.com/35042430/211258836-93da295a-a309-4311-a2e2-eb2fcf183d9f.png)

```Python
class Solution:
    def findCircleNum(self, isConnected: List[List[int]]) -> int:
        # Depth-First Search
        #### Time Complexity: O(N^2), traverse through the entire 2D array
        #### Space Complexity: O(N), extra memory space required to build visited
        ROWS, COLS = len(isConnected), len(isConnected[0])
        visited = [0] * ROWS

        def dfs(row):
            for col in range(COLS):
                if isConnected[row][col] == 1 and visited[col] == 0:
                    visited[col] = 1
                    dfs(col)

        count = 0
        for row in range(ROWS):
            if visited[row] == 0:
                dfs(row)
                count += 1
        return count
```

### Breadth-First Search

```Python
class Solution:
    def findCircleNum(self, isConnected: List[List[int]]) -> int:
        # Breath-First Search
        #### Time Complexity: O(N^2), traverse through the entire 2D array
        #### Space Complexity: O(N), extra memory space required to build visited  
        ROWS, COLS = len(isConnected), len(isConnected[0])
        visited = [0] * ROWS
        queue = collections.deque()
        count = 0
        for row in range(ROWS):
            if visited[row] == 0:
                queue.append(row)
                while queue:
                    row = queue.pop()
                    visited[row] = 1
                    for col in range(COLS):
                        if isConnected[row][col] == 1 and visited[col] == 0:
                            queue.append(col)
                count += 1
        return count
```

### Union-Find

```Python
class Solution:
    def findCircleNum(self, isConnected: List[List[int]]) -> int:
            # Union Find
            #### Time Complexity: O(N^3), union and find take o(N) time while traversing through the entire 2D array
            #### Space Complexity: O(N), extra memory space required to build root        
            ROWS, COLS = len(isConnected), len(isConnected[0])
            root = [-1] * ROWS

            def find(x):   
                if root[x] == -1:
                    return x
                return find(root[x])

            def union(x, y):
                root_x = find(x)
                root_y = find(y)
                if root_x != root_y:
                    root[root_x] = root_y

            for row in range(ROWS):
                for col in range(COLS):
                    if isConnected[row][col] == 1 and row != col:
                        union(row, col)
            count = 0
            for row in range(ROWS):
                if root[row] == -1:
                    count += 1
            return count
```

