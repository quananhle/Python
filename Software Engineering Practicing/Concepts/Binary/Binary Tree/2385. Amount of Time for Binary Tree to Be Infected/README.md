## [2385. Amount of Time for Binary Tree to Be Infected](https://leetcode.com/problems/amount-of-time-for-binary-tree-to-be-infected)

```Tag```: ```Binary Tree``` ```Breadth-First Search``` ```Graph```

#### Difficulty: Medium

You are given the ```root``` of a binary tree with unique values, and an integer ```start```. At minute ```0```, an infection starts from the node with value ```start```.

Each minute, a node becomes infected if:

- The node is currently uninfected.
- The node is adjacent to an infected node.

Return _the number of minutes needed for the entire tree to be infected_.

![image](https://github.com/quananhle/Python/assets/35042430/a8180e94-b3e1-4006-8902-85fe5f2961aa)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2022/06/25/image-20220625231744-1.png)
```
Input: root = [1,5,3,null,4,10,6,9,2], start = 3
Output: 4
Explanation: The following nodes are infected during:
- Minute 0: Node 3
- Minute 1: Nodes 1, 10 and 6
- Minute 2: Node 5
- Minute 3: Node 4
- Minute 4: Nodes 9 and 2
It takes 4 minutes for the whole tree to be infected so we return 4.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2022/06/25/image-20220625231812-2.png)
```
Input: root = [1], start = 1
Output: 0
Explanation: At minute 0, the only node in the tree is infected so we return 0.
```

__Constraints:__

- The number of nodes in the tree is in the range $[1, 10^5]$.
- $1 \le Node.val \le 10^5$
- Each node has a unique value.
- A node with a value of ```start``` exists in the tree.

---

### Convert to Graph and Breadth-First Search

#### 1. Convert the binary tree to an undirected graph

A tree is a special kind of graph with a root and subtrees. We want to search the graph from any node, not just the root, and be able to traverse to all neighbors, including parents and children. An undirected graph is a set of vertices with edges that connect them. We will use a map to represent our graph, made up of integer vertices, and an adjacency list to record the edges.

We can define a function that converts our binary tree to an undirected graph by traversing the tree and creating a graph. The parameters are the current node and its parent. We traverse the tree with a preorder traversal, visiting first the root, then the left and right child, so we can log the parent of each node and make a connection to it. When we encounter a new right or left child, we add them to the adjacency list.

```Python
def convert(self, current: TreeNode, parent: int, tree_map: Dict[int, Set[int]]):
    if current is None:
        return
    if current.val not in tree_map:
        tree_map[current.val] = set()
    adjacent_list = tree_map[current.val]
    if parent != 0:
        adjacent_list.add(parent)
    if current.left:
        adjacent_list.add(current.left.val)
    if current.right:
        adjacent_list.add(current.right.val)
    self.convert(current.left, current.val, tree_map)
    self.convert(current.right, current.val, tree_map)
```

#### 2. Conduct a Breath First Search (BFS) to find the maximum distance between the start and other vertices.

We can find the maximum distance between the vertex with the value ```start``` and the rest of the vertices in our graph by using a BFS starting with the ```start```.

Standard Breadth-First Search

1. Add the first node to the queue
2. While the queue is not empty:
  - Remove the front node of the queue and mark it as visited.
  - Check whether all adjacent nodes have been visited. If they have not, add them to the queue

#### Complexity Analysis

- __Time Complexity__: $\mathcal{O}(n)$
- __Space Complexity__: $\mathcal{O}(n)$

