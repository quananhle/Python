## [947. Most Stones Removed with Same Row or Column](https://leetcode.com/problems/most-stones-removed-with-same-row-or-column/)

```Tag```: ```Depth-First Search``` ```Breadth-First Search``` ```Union-Find```

#### Difficulty: Medium

On a 2D plane, we place ```n``` stones at some integer coordinate points. Each coordinate point may have at most one stone.

A stone can be removed if it shares either the same row or the same column as another stone that has not been removed.

Given an array ```stones``` of length ```n``` where ```stones[i]``` = [x<sub>i</sub>, y<sub>i</sub>] represents the location of the i<sup>th</sup> stone, return _the largest possible number of stones that can be removed_.

![image](https://user-images.githubusercontent.com/35042430/226275513-679fb335-4bc2-43ac-af2b-938269120094.png)

---

__Example 1:__
```
Input: stones = [[0,0],[0,1],[1,0],[1,2],[2,1],[2,2]]
Output: 5
Explanation: One way to remove 5 stones is as follows:
1. Remove stone [2,2] because it shares the same row as [2,1].
2. Remove stone [2,1] because it shares the same column as [0,1].
3. Remove stone [1,2] because it shares the same row as [1,0].
4. Remove stone [1,0] because it shares the same column as [0,0].
5. Remove stone [0,1] because it shares the same row as [0,0].
Stone [0,0] cannot be removed since it does not share a row/column with another stone still on the plane.
```

__Example 2:__
```
Input: stones = [[0,0],[0,2],[1,1],[2,0],[2,2]]
Output: 3
Explanation: One way to make 3 moves is as follows:
1. Remove stone [2,2] because it shares the same row as [2,0].
2. Remove stone [2,0] because it shares the same column as [0,0].
3. Remove stone [0,2] because it shares the same row as [0,0].
Stones [0,0] and [1,1] cannot be removed since they do not share a row/column with another stone still on the plane.
```

__Example 3:__
```
Input: stones = [[0,0]]
Output: 0
Explanation: [0,0] is the only stone on the plane, so you cannot remove it.
```

__Constraints:__

- ```1 <= stones.length <= 1000```
- 0 <= x<sub>i</sub>, y<sub>i</sub> <= 10<sup>4</sup>
- No two stones are at the same coordinate point.

---

![image](https://leetcode.com/problems/most-stones-removed-with-same-row-or-column/Figures/947/947A.png)

We need to find the number of connected components after building the graph. This is the typical graph problem that can be solved using Depth-First Search or Disjoint-Set Union.

### Depth-First Search

```Python
class Solution:
    def removeStones(self, stones: List[List[int]]) -> int:
        graph_row, graph_col = collections.defaultdict(list), collections.defaultdict(list)
        visited = set()

        # Build the adjacency graph
        for stone in stones:
            x, y = stone
            graph_row[x].append(y)
            graph_col[y].append(x)
        
        self.ans = 0
        def dfs(row, col):
            for next_col in graph_row[row]:
                # Check if the stone is not in visited
                if not (row, next_col) in visited:
                    # Add every stone visited during the DFS to the visited
                    visited.add((row, next_col))
                    # Every time a new DFS starts, increment the counter variable by 1
                    self.ans += 1
                    # Start a DFS from it
                    dfs(row, next_col)
            
            for next_row in graph_col[col]:
                # Check if the stone is not in visited
                if not(next_row, col) in visited:
                    # Add every stone visited during the DFS to the visited
                    visited.add((next_row, col))
                    # Every time a new DFS starts, increment the counter variable by 1
                    self.ans += 1
                    # Start a DFS from it
                    dfs(next_row, col)

        for row, col in stones:
            # Check if the stone is not in visited
            if not (row, col) in visited:
                # Add every stone visited during the DFS to the visited
                visited.add((row, col))
                # Start a DFS from it
                dfs(row, col)
        
        return self.ans
```

### Breadth-First Search

```Python
class Solution:
    def removeStones(self, stones: List[List[int]]) -> int:
        graph_row = collections.defaultdict(list)
        graph_col = collections.defaultdict(list)
        
        # Build the adjacency graph
        for row, col in stones:
            graph_row[row].append(col)
            graph_col[col].append(row)

        visited = set()

        ans = 0
        queue = collections.deque()

        for row, col in stones:
            if not (row, col) in visited:
                queue.append((row, col))

                while queue:
                    r, c = queue.popleft()
                    if (r, c) in visited:
                        continue

                    visited.add((r, c))
                    ans += 1

                    # Append all points which are in same row as (r, c)
                    for e in graph_row[r]:  
                        if e != c:
                            queue.append((r, e))

                    # Append all points which are in same column as (r, c)
                    for e in graph_col[c]:  
                        if e != r:
                            queue.append((e, c))

                    # Here are two line which make code time complexity O(n^2) to O(n)
                    # Check if any point covers its entire row and column points, then again no need to cover these points again.
                    graph_row[r].clear()
                    graph_col[c].clear()

                # Each component can not destroy it self completely, there is only one point always exist,
                ans -=1    

        return ans
```

### Union-Find

```Python
class UnionFind:
    def __init__(self, size):
        self.root = [i for i in range(size)]
        self.rank = [1] * size
        self.size = size
    
    def find(self, x):
        if x == self.root[x]:
            return x
        self.root[x] = self.find(self.root[x])
        return self.root[x]
    
    def union(self, x, y):
        root_x, root_y = self.find(x), self.find(y)
        if root_x != root_y:
            if self.rank[root_x] < self.rank[root_y]:
                self.root[root_x] = root_y
                self.rank[root_y] += root_x
            else:
                self.root[root_y] = root_x
                self.rank[root_x] += root_y
            self.size -= 1

    def get_count(self):
        return self.size


class Solution:
    def removeStones(self, stones: List[List[int]]) -> int:
        if not stones:
            return 0

        n = len(stones)
        uf = UnionFind(n)
        row_map = defaultdict(list)
        col_map = defaultdict(list)

        for idx, stone in enumerate(stones):
            row, col = stone
            row_map[row].append(idx)
            col_map[col].append(idx)

        for row in row_map:
            same_row = row_map[row]
            for i in range(len(same_row) - 1):
                uf.union(same_row[i], same_row[i + 1])

        for col in col_map:
            same_col = col_map[col]
            for j in range(len(same_col) - 1):
                uf.union(same_col[j], same_col[j + 1])

        distinct_region = 0
        for r in range(len(uf.root)):
            if uf.find(r) == r: 
                distinct_region += 1

        return n - distinct_region
```
