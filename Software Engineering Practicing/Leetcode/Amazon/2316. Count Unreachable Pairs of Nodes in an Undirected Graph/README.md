## [2316. Count Unreachable Pairs of Nodes in an Undirected Graph](https://leetcode.com/problems/count-unreachable-pairs-of-nodes-in-an-undirected-graph/)

```Tag```: ```Graph``` ```Depth-First Search``` ```Breadth-First Search```

#### Difficulty: Medium

You are given an integer ```n```. There is an __undirected__ graph with ```n``` nodes, numbered from ```0``` to ```n - 1```. You are given a 2D integer array edges where ```edges[i]``` = [a<sub>i</sub>, b<sub>i</sub>] denotes that there exists an __undirected__ edge connecting nodes a<sub>i</sub> and b<sub>i</sub>.

Return _the __number of pairs__ of different nodes that are __unreachable__ from each other_.

![image](https://user-images.githubusercontent.com/35042430/227667760-94946d5c-0277-4c5b-89a1-887df34844e7.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2022/05/05/tc-3.png)
```
Input: n = 3, edges = [[0,1],[0,2],[1,2]]
Output: 0
Explanation: There are no pairs of nodes that are unreachable from each other. Therefore, we return 0.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2022/05/05/tc-2.png)
```
Input: n = 7, edges = [[0,2],[0,5],[2,4],[1,6],[5,4]]
Output: 14
Explanation: There are 14 pairs of nodes that are unreachable from each other:
[[0,1],[0,3],[0,6],[1,2],[1,3],[1,4],[1,5],[2,3],[2,6],[3,4],[3,5],[3,6],[4,6],[5,6]].
Therefore, we return 14.
```

__Constraints:__

- 1 <= ```n``` <= 10<sup>5</sup>
- 0 <= ```edges.length``` <= 2 * 10<sup>5</sup>
- ```edges[i].length == 2```
- 0 <= a<sub>i</sub>, b<sub>i</sub> < n
- a<sub>i</sub> != b<sub>i</sub>
- There are no repeated ```edges```.

---

![image](https://leetcode.com/problems/count-unreachable-pairs-of-nodes-in-an-undirected-graph/Figures/2316/2316-1.png)

The first component consists of four nodes. Except for the nodes in their components, these four nodes cannot reach any other nodes. As a result, selecting any of the four nodes from the first component and any other node from the remaining components results in a pair of nodes that are unreachable to each other.

The total number of pairs of nodes with one node in the first component and the other node in any of the remaining components would be equal to the number of nodes in the first component multiplied by the total number of nodes except the first component's nodes, i.e., ```4 * (7 - 4) = 12``` pairs. This means that there are ```12``` pairs of nodes that are unreachable from each other, where one of the two nodes are in the first component.

```[[0,3], [0,1], [0,6], [2,3], [2,1], [2,6], [5,3], [5,1], [5,6], [4,3], [4,1], [4,6]]``` = ```12``` pairs

Let's move on to the second component, which has only one node. So, the number of unreachable pairs of nodes with one node in the second component would be the total number of nodes in the second component multiplied by the total number of nodes except the current component and the first component (we already covered pairs formed using nodes in the first component). It is ```1 * (7 - 4 - 1) = 2``` pairs.

```[[3,1], [3,6]]``` = ```2``` pairs

We have now covered all of the pairs formed with one node in the first component, as well as all of the pairs formed with one node in the second component. Because we only have a third component left, no more pairs of unreachable nodes can be formed. The total number of pairs required is ```12 + 2 = 14```.

So, to find the total number of pairs that are unreachable from each other, we must iterate over the graph and determine the size of each component. Then we multiply the number of nodes in the current component by the total number of nodes in the graph, ignoring nodes in the current component and previously visited components (we already covered pairs of nodes formed with one of the nodes in the previous components). To get the required answer, we add these number of pairs of nodes while iterating over all the components one by one, as calculated in the preceding example.

### Depth-First Search

__Algorithm__

1. Create an adjacency list where ```graph[x]``` contains all the neighbors of node ```x```.
2. Create a long variable ```pairs``` to count the number of unreachable node pairs. We initialize it with ```0```.
3. Create another long variable ```component``` to store the number of nodes in the current component. It is initialized with ```0```.
4. Create a third long variable ```remaining``` to keep track of the number of unvisited nodes in the graph after each DFS traversal. We initialize it with ```n```.
5. Create a ```visited``` set to keep track of ```nodes``` that have been visited.
6. Iterate through all of the nodes and for each node ```node``` check if it is visited or not. If node ```node``` is not visited, begin the DFS traversal:
    - We use the ```dfs``` function to perform the traversal. For each call, pass ```node``` as the parameters. We start with node ```node```.
    - Mark the ```node``` as visited and create a variable count to keep track of the number of nodes in this component. We initialize ```count``` to ```1``` to count ```node``` itself.
    - We iterate over all the neighbors of ```node```. If any ```neighbor``` is unvisited, we recursively call ```dfs``` passing ```neighbor``` as ```node```. We add the number of nodes visited by this ```dfs``` call to ```count```.
    - We return ```count``` after iterating over all the neighbors and store it in ```component```.
    - The number of unreachable pairs of nodes with one node in the current component and the other node in any other component except the current component and the previously visited components is ```size_of_component * (remaining_nodes - size_of_component)```. It is added to ```pairs```.
    - We decrement ```remaining``` by ```component``` because we have added all the required pairs of nodes with one of the nodes being in the current component and we don't want to add them again. As a result, we assume they are no longer present.
7. Return ```pairs```.

- __Time complexity__: ```O(n + e)```
- __Space complexity__: ```O(n + e)```

```Python
class Solution:
    def countPairs(self, n: int, edges: List[List[int]]) -> int:
        # Depth-First Search
        graph = collections.defaultdict(list)
        # Build the adjacency graph
        for u, v in edges:
            graph[u].append(v)
            graph[v].append(u)

        visited = set()
        pairs, component, remaining = 0, 0, n

        def dfs(node):
            count = 1
            visited.add(node)

            if not node in graph:
                return count

            for neighbor in graph[node]:
                if not neighbor in visited:
                    count += dfs(neighbor)
            
            return count

        for node in range(n):
            if not node in visited:
                component = dfs(node)
                pairs += component * (remaining - component)
                remaining -= component

        return pairs
```

### Breadth-First Search

```Python

```

### Union-Find

__Algorithm__

1. Create an instance of ```UnionFind``` of size ```n```, say ```uf(n)```.
2. Iterate over all of the graph's edges, ```edges```, and perform a ```union``` of both nodes connected by an edge.
3. Create a hash map, ```components```, to map a node that uniquely identifies a component to the size of the component. ```components[x]``` returns the number of nodes in the component that contains node x.
    - We iterate over all the nodes and for each ```node```, we increment ```components[find(node)]``` by ```1```.

![image](https://assets.leetcode.com/users/images/4e11f07f-2149-4d70-a59a-96625155fb8c_1656298312.1886868.png) ![image](https://assets.leetcode.com/users/images/481c5f08-f586-4676-a38d-6009a6c33d2d_1656298330.2230315.png)

4. Create a long variable ```number_of_paths``` to count the number of unreachable node pairs. We initialize it with ```0```.
5. Create another long variable ```remaining``` to keep track of the number of nodes that are left after visiting each component. We initialize it with ```n```.
6. We iterate over ```components``` and for each ```component_size``` in ```components```, we do the following:
    - Add all the pairs of nodes where one node is in the current component and the other node is in any other component except the current one and previously visited components. So, we perform ```number_of_paths += component_size * (remaining - component_size)```.
    - We decrement ```remaining``` by ```component_size``` because we have added all the required pairs of nodes with one of the nodes in the current component and we don't want to add it again. As a result, we assume they are no longer present.

![image](https://assets.leetcode.com/users/images/ea20dc61-99e2-4fda-9462-fbf1b56a0088_1656298454.765443.png)
![image](https://assets.leetcode.com/users/images/297a054d-fa26-4991-9973-972ad8e3f48a_1656298480.4827797.png)
![image](https://assets.leetcode.com/users/images/156554d6-53a3-442a-931b-67c4488c4d48_1656298549.5569212.png)

7. Return ```number_of_paths```.

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
    
    def get_size(self):
        return self.size
    
    def connected(self, x, y):
        return self.find(x) == self.find(y)

class Solution:
    def countPairs(self, n: int, edges: List[List[int]]) -> int:
        uf = UnionFind(n)

        for u, v in edges:
            uf.union(u, v)
        
        components = collections.defaultdict(int)
        for node in range(n):
            '''
            parent = uf.find(node)
            if parent in components:
                components[parent] += 1
            else:
                components[parent] = 1
            '''
            components[uf.find(node)] += 1
        
        number_of_paths, remaining = 0, n
        for component_size in components.values():
            number_of_paths += component_size * (remaining - component_size)
            remaining -= component_size
        
        return number_of_paths
```
