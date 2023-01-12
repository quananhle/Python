## 1519. Number of Nodes in the Sub-Tree With the Same Label

```Tag```: ```Depth-First Search``` ```Counter``` ```Graph``` ```Tree```

#### Difficulty: Medium

You are given a tree (i.e. a connected, undirected graph that has no cycles) consisting of ```n``` nodes numbered from ```0``` to ```n - 1``` and exactly ```n - 1``` ```edges```. The root of the tree is the node ```0```, and each node of the tree has a label which is a lower-case character given in the string ```labels``` (i.e. The node with the number ```i``` has the label ```labels[i]```).

The ```edges``` array is given on the form ```edges[i]``` = [a<sub>i</sub>, b<sub>i</sub>], which means there is an edge between nodes a<sub>i</sub> and b<sub>i</sub> in the tree.

Return _an array of size n where ```ans[i]``` is the number of nodes in the subtree of the i<sup>th</sup> node which have the same label as node ```i```.

A subtree of a tree ```T``` is the tree consisting of a node in ```T``` and all of its descendant nodes.

![image](https://user-images.githubusercontent.com/35042430/211972209-18f6303f-4322-4f72-b520-260d0264feee.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/07/01/q3e1.jpg)
```
Input: n = 7, edges = [[0,1],[0,2],[1,4],[1,5],[2,3],[2,6]], labels = "abaedcd"
Output: [2,1,1,1,1,1,1]
Explanation: Node 0 has label 'a' and its sub-tree has node 2 with label 'a' as well, thus the answer is 2. Notice that any node is part of its sub-tree.
Node 1 has a label 'b'. The sub-tree of node 1 contains nodes 1,4 and 5, as nodes 4 and 5 have different labels than node 1, the answer is just 1 (the node itself).
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2020/07/01/q3e2.jpg)
```
Input: n = 4, edges = [[0,1],[1,2],[0,3]], labels = "bbbb"
Output: [4,2,1,1]
Explanation: The sub-tree of node 2 contains only node 2, so the answer is 1.
The sub-tree of node 3 contains only node 3, so the answer is 1.
The sub-tree of node 1 contains nodes 1 and 2, both have label 'b', thus the answer is 2.
The sub-tree of node 0 contains nodes 0, 1, 2 and 3, all with label 'b', thus the answer is 4.
```

__Example 3:__

![image](https://assets.leetcode.com/uploads/2020/07/01/q3e3.jpg)
```
Input: n = 5, edges = [[0,1],[0,2],[1,3],[0,4]], labels = "aabab"
Output: [3,2,1,1,1]
```

__Constraints:__
```
1 <= n <= 105
edges.length == n - 1
edges[i].length == 2
0 <= ai, bi < n
ai != bi
labels.length == n
labels is consisting of only of lowercase English letters.
```

---

### Depth-First Search

```Python
class Solution:
    def countSubTrees(self, n: int, edges: List[List[int]], labels: str) -> List[int]:
        # Depth-First Search
        #### Time Complexity : O(26∗N) = O(N), each node is visited by the dfs function once, and constructing hashmap (counter) will be at most 26, since there are at most 26 lowercase English letters 
        #### Space Complexity: O(26∗N) = O(N), adjacecency list and output array take 0(N) memory space, and O(N) space memory to keep the recursion stack and 26 factors for each node
        res = [0] * n
        visited = set()
        # Build the adjacency tree
        tree = collections.defaultdict(list)
        for x, y in edges:
            # Since the tree is undirected, need both directions between vertices
            tree[x].append(y)
            tree[y].append(x)
            
        freq = collections.defaultdict(int)
        
        def dfs(curr=0, parent=None):
            prev = freq[labels[curr]]
            freq[labels[curr]] += 1
            next_nodes = tree[curr]
            for node in next_nodes:
                # Check iff node is not its parent node
                if node != parent:
                    dfs(node, curr)
            res[curr] = freq[labels[curr]] - prev
            
        dfs()
        return res
```
```Python
class Solution:
    def countSubTrees(self, n: int, edges: List[List[int]], labels: str) -> List[int]:
        # Depth-First Search
        #### Time Complexity : O(26∗N) = O(N), each node is visited by the dfs function once, and constructing hashmap (counter) will be at most 26, since there are at most 26 lowercase English letters 
        #### Space Complexity: O(26∗N) = O(N), adjacecency list and output array take 0(N) memory space, and O(N) space memory to keep the recursion stack and 26 factors for each node
        res = [0] * n
        visited = set()
        # Build the adjacency tree
        tree = collections.defaultdict(list)
        for x, y in edges:
            # Since the tree is undirected, need both directions between vertices
            tree[x].append(y)
            tree[y].append(x)
            
        def dfs(curr=0, parent=None):
            # Using counter to store the count of each letters in the sub-tree rooted at the current node.
            count = collections.Counter()
            for next_node in tree[curr]:
                # Check iff node is not its parent node
                if next_node != parent:
                    # Update count with the letters' frequency in the children nodes
                    count += dfs(next_node, curr)
            # Increment frequency of the current label by 1
            count[labels[curr]] += 1
            # Update the result
            res[curr] = count[labels[curr]]
            return count    

        dfs()
        return res
```


        
