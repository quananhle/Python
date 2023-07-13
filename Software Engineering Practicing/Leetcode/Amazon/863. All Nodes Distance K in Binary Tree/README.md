## [863. All Nodes Distance K in Binary Tree](https://leetcode.com/problems/all-nodes-distance-k-in-binary-tree/)

```Tag```: ```Binary Tree``` ```Depth-First Search``` ```Breadth-First Search``` ```Hash Map``` 

#### Difficulty: Medium

Given the ```root``` of a binary tree, the value of a target node ```target```, and an integer ```k```, return _an array of the values of all nodes that have a distance ```k```9 from the target node_.

You can return the answer in any order.

![image](https://github.com/quananhle/Python/assets/35042430/0af0e5aa-1d98-4fb9-b8e9-996c1f5b8f92)

---

__Example 1:__

![image](https://s3-lc-upload.s3.amazonaws.com/uploads/2018/06/28/sketch0.png)
```
Input: root = [3,5,1,6,2,0,8,null,null,7,4], target = 5, k = 2
Output: [7,4,1]
Explanation: The nodes that are a distance 2 from the target node (with value 5) have values 7, 4, and 1.
```

__Example 2:__
```
Input: root = [1], target = 1, k = 3
Output: []
```

__Constraints:__

- The number of nodes in the tree is in the range $[1, 500]$.
- $0 <= Node.val <= 500$
- All the values ```Node.val``` are unique.
- ```target``` is the value of one of the nodes in the tree.
- $0 <= k <= 1000$

---

![image](https://leetcode.com/problems/all-nodes-distance-k-in-binary-tree/Figures/863/1.png)

### Depth-First Search

#### Parent Pointer

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

class Solution:
    def distanceK(self, root: TreeNode, target: TreeNode, k: int) -> List[int]:
        def find_parent(curr, parent):
            if not curr:
                return None
            curr.parent = parent
            find_parent(curr.left, curr)
            find_parent(curr.right, curr)
        
        find_parent(root, None)

        res = list()
        visited = set()

        def dfs(node, distance):
            if not node or node in visited:
                return
            
            visited.add(node)
            if not distance:
                res.append(node.val)
                return
            
            dfs(node.parent, distance - 1)
            dfs(node.left, distance - 1)
            dfs(node.right, distance - 1)

        dfs(target, k)

        return res
```

#### Equivalent Graph

![image](https://leetcode.com/problems/all-nodes-distance-k-in-binary-tree/Figures/863/5.png)

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

class Solution:
    def distanceK(self, root: TreeNode, target: TreeNode, k: int) -> List[int]:
        graph = collections.defaultdict(list)

        def build_graph(curr, parent):
            if curr and parent:
                graph[curr.val].append(parent.val)
                graph[parent.val].append(curr.val)
            if curr.left:
                build_graph(curr.left, curr)
            if curr.right:
                build_graph(curr.right, curr)
        
        build_graph(root, None)
        
        res = list()
        visited = set([target.val])

        def dfs(node, distance):
            if distance == k:
                res.append(node)
                return
            for neighbor in graph[node]:
                if not neighbor in visited:
                    visited.add(neighbor)
                    dfs(neighbor, distance + 1)
                
        dfs(target.val, 0)
        
        return res
```

### Breadth-First Search

#### Equivalent Graph

![image](https://leetcode.com/problems/all-nodes-distance-k-in-binary-tree/Figures/863/6.png)

```Python
class Solution:
    def distanceK(self, root: TreeNode, target: TreeNode, k: int) -> List[int]:
        graph = collections.defaultdict(list)
        # Recursively build the undirected graph from the given binary tree.
        def build_graph(cur, parent):
            if cur and parent:
                graph[cur.val].append(parent.val)
                graph[parent.val].append(cur.val)
            if cur.left:
                build_graph(cur.left, cur)
            if cur.right:
                build_graph(cur.right, cur) 
        build_graph(root, None)
        
        answer = []
        visited = set([target.val])

        # Add the target node to the queue with a distance of 0
        queue = collections.deque([(target.val, 0)])
        while queue:
            cur, distance = queue.popleft()

            # If the current node is at distance k from target,
            # add it to the answer list and continue to the next node.
            if distance == k:
                answer.append(cur)
                continue

            # Add all unvisited neighbors of the current node to the queue.
            for neighbor in graph[cur]:
                if neighbor not in visited:
                    visited.add(neighbor)
                    queue.append((neighbor, distance + 1))
                    
        return answer
```
