## 1443. Minimum Time to Collect All Apples in a Tree

```Tag```: ```Tree``` ```Graph``` ```Depth-First Search```

#### Difficulty: Medium

Given an undirected tree consisting of ```n``` vertices numbered from ```0``` to ```n-1```, which has some apples in their vertices. You spend 1 second to walk over one edge of the tree. Return _the minimum time in seconds you have to spend to collect all apples in the tree, starting at vertex ```0``` and coming back to this vertex_.

The edges of the undirected tree are given in the array ```edges```, where ```edges[i]``` = [a<sub>i</sub>, b<sub>i</sub>] means that exists an edge connecting the vertices a<sub>i</sub> and b<sub>i</sub>. Additionally, there is a boolean array ```hasApple```, where ```hasApple[i] = true``` means that vertex ```i``` has an apple; otherwise, it does not have any apple.

![image](https://user-images.githubusercontent.com/35042430/211757670-1989050f-9f39-4449-8162-f193b71d3ce8.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/04/23/min_time_collect_apple_1.png)
```
Input: n = 7, edges = [[0,1],[0,2],[1,4],[1,5],[2,3],[2,6]], hasApple = [false,false,true,false,true,true,false]
Output: 8 
Explanation: The figure above represents the given tree where red vertices have an apple. One optimal path to collect all apples is shown by the green arrows.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2020/04/23/min_time_collect_apple_2.png)
```
Input: n = 7, edges = [[0,1],[0,2],[1,4],[1,5],[2,3],[2,6]], hasApple = [false,false,true,false,false,true,false]
Output: 6
Explanation: The figure above represents the given tree where red vertices have an apple. One optimal path to collect all apples is shown by the green arrows.  
```

__Example 3:__
```
Input: n = 7, edges = [[0,1],[0,2],[1,4],[1,5],[2,3],[2,6]], hasApple = [false,false,false,false,false,false,false]
Output: 0
```

__Constraints:__
```
1 <= n <= 105
edges.length == n - 1
edges[i].length == 2
0 <= ai < bi <= n - 1
fromi < toi
hasApple.length == n
```

---

![image](https://leetcode.com/problems/minimum-time-to-collect-all-apples-in-a-tree/solutions/2864715/Figures/1443/1443-1.png)

### Depth-First Search

![image](https://leetcode.com/problems/minimum-time-to-collect-all-apples-in-a-tree/solutions/2864715/Figures/1443/1443-3.png)

```Python
class Solution:
    def minTime(self, n: int, edges: List[List[int]], hasApple: List[bool]) -> int:
        # Depth-First Search
        ## Traverse all vertices in a “graph”
        visited = set()
        # Build adjacency list
        # The difference between tree and graph is that tree doesn't contain any cycles in it, however since this tree is undirected, a node's neighbor nodes will also contain its parent node
        tree = collections.defaultdict(list)
        for x, y in edges:
            tree[x].append(y)
            tree[y].append(x)

        def dfs(curr, parents):
            ans = 0
            if not curr in visited:
                visited.add(curr)
                # Travel from the root to all the nodes that has apples
                for neighbors in tree[curr]:
                    # Check if the child is equal to the parent, make sure not going back to check the parents node
                    if neighbors != parents:
                        # Visit all the child nodes to calculate the time it takes. If neither the child nor its subtree has apples, we don't need to include the time to visit this child, as we will consider we never visited this child's subtree
                        child_time = dfs(neighbors, curr)
                        # Check if child_time != 0, indicating subtree of child has apples, and check if child has apple
                        # Case 1: res != 0, this means we have found some apples down the tree
                        # Case 2: hasApple[node]==True, this means the current node has apple
                        if child_time != 0 or hasApple[neighbors]:
                            # Walk to the tree and back cost 2 seconds => weight = 2
                            ans += child_time + 2
            return ans
        # Start a DFS traversal with root node 0 and parent as None
        return dfs(0, None)
```
