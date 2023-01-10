## 797. All Paths From Source to Target

```Tag```: ```Dynamic Programming``` ```Backtracking```

#### Difficulty: Medium

Given a directed acyclic graph __(DAG)__ of ```n``` nodes labeled from ```0``` to ```n - 1```, find all possible paths from node ```0``` to node ```n - 1``` and return them in __any order__.

The graph is given as follows: ```graph[i]``` is a list of all nodes you can visit from node ```i``` (i.e., there is a directed edge from node ```i``` to node ```graph[i][j]```).

![image](https://user-images.githubusercontent.com/35042430/211102834-b52d5575-88ef-40c8-bbff-ddf79e735f29.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/09/28/all_1.jpg)
```
Input: graph = [[1,2],[3],[3],[]]
Output: [[0,1,3],[0,2,3]]
Explanation: There are two paths: 0 -> 1 -> 3 and 0 -> 2 -> 3.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2020/09/28/all_2.jpg)
```
Input: graph = [[4,3,1],[3,2,4],[3],[4],[]]
Output: [[0,4],[0,3,4],[0,1,3,4],[0,1,2,3,4],[0,1,4]]
```

__Constraints:__
```
n == graph.length
2 <= n <= 15
0 <= graph[i][j] < n
graph[i][j] != i (i.e., there will be no self-loops).
All the elements of graph[i] are unique.
The input graph is guaranteed to be a DAG.
```

---

### Backtracking

__Time Complexity__: O(2<sup>N</sup> * N), 2<sup>N−1</sup> - 1 paths while traversing through the entire graph

__Space Complexity__: O(N), extra memory space to keep up the size of the recursion stack until last node reached

```Python
class Solution:
    def allPathsSourceTarget(self, graph: List[List[int]]) -> List[List[int]]:
        # Backtracking
        target = len(graph) - 1
        res = list()

        def backtrack(curr, path):
            # Check if target reached
            if curr == target:
                res.append(list(path))
            else:
                for node in graph[curr]:
                    path.append(node)
                    backtrack(node, path)
                    # After the path found, pop out the path to start another path
                    path.pop()
        path = [0]
        backtrack(0, path)
        return res
```

### Top-Down Dynamic Programming

__Time Complexity__: O(2<sup>N</sup> * N), there are at most 2<sup>N−1</sup> - 1 paths while traversing through the entire graph

__Space Complexity__: O(2<sup>N</sup> * N),  since at most we could have 2<sup>N−1</sup> − 1 paths as the results and each path can contain up to ```N``` nodes

```Python
class Solution:
    def allPathsSourceTarget(self, graph: List[List[int]]) -> List[List[int]]:
        # Top-Down Dynamic Programming
        target = len(graph) - 1

        @lru_cache(maxsize = None)
        def dp(curr):
            if curr == target:
                return [[target]]

            res = list()
            for node in graph[curr]:
                for path in dp(node):
                    res.append([curr] + path)

            return res

        return dp(0)
```
