## [199. Binary Tree Right Side View](https://leetcode.com/problems/binary-tree-right-side-view/)

```Tag```: ```Binary Tree``` ```Breadth-First Search``` ```Depth-First Search``` ```Morris Algorithm```

#### Difficulty: Medium

Given the ```root``` of a binary tree, imagine yourself standing on the __right side__ of it, return _the values of the nodes you can see ordered from top to bottom_.

![image](https://user-images.githubusercontent.com/35042430/225530535-3c3550d8-6f1d-4fbc-b8e3-715afd6e3ff1.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/02/14/tree.jpg)
```
Input: root = [1,2,3,null,5,null,4]
Output: [1,3,4]
```

__Example 2:__
```
Input: root = [1,null,3]
Output: [1,3]
```

__Example 3:__
```
Input: root = []
Output: []
```

__Constraints:__

- The number of nodes in the tree is in the range ```[0, 100]```.
- ```-100 <= Node.val <= 100```

---

![image](https://leetcode.com/problems/binary-tree-right-side-view/Figures/199_rewrite/traversals.png)

![image](https://leetcode.com/problems/binary-tree-right-side-view/Figures/199_rewrite/dfs_bfs2.png)

```
Which approach to choose, BFS or DFS?
```

The problem is to return a list of last elements from all levels, so it's the way more natural to implement BFS here.

Time complexity is the same ```O(N)``` both for DFS and BFS since one has to visit all nodes.

Space complexity is ```O(H)``` for DFS and ```O(D)``` for BFS, where ```H``` is a tree height, and ```D``` is a tree diameter. They both result in ```O(N)``` space in the worst-case scenarios: skewed tree for DFS and complete tree for BFS.

BFS wins for this problem, so let's use the opportunity to check out three different BFS implementations with the queue.

__BFS implementation:__

All three implementations use the queue in a standard BFS way:

- Push the root into the queue.
- Pop-out a node from the _left_.
- Push the _left_ child into the queue, and then push the _right_ child.

![image](https://leetcode.com/problems/binary-tree-right-side-view/Figures/199_rewrite/implem2.png)

__Three BFS approaches__

The difference is how to find the end of the level, i.e. the rightmost element:

- Two queues, one for the previous level and one for the current.
- One queue with sentinel to mark the end of the level.
- One queue + level size measurement.

---

### BFS: Two Queues

![image](https://leetcode.com/problems/binary-tree-right-side-view/Figures/199_rewrite/levels.png)

__Algorithm__

- Initiate the list of the right side view ```rightside```.
- Initiate two queues: one for the current level, and one for the next. Add root into ```nextLevel``` queue.
- While ```nextLevel``` queue is not empty:

  - Initiate the current level: ```currLevel = nextLevel```, and empty the next level ```nextLevel```.
  - While current level queue is not empty:
    - Pop out a node from the current level queue.
    - Add first left and then right child node into ```nextLevel``` queue.
  - Now ```currLevel``` is empty, and the node we have in hands is the last one, and makes a part of the right side view. Add it into ```rightside```.

- Return ```rightside```.

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def rightSideView(self, root: Optional[TreeNode]) -> List[int]:
        if not root:
            return []
        
        next_level = collections.deque([root])
        ans = list()

        while next_level:
            curr_level = next_level
            next_level = collections.deque()

            while curr_level:
                node = curr_level.popleft()
                if node.left:
                    next_level.append(node.left)
                if node.right:
                    next_level.append(node.right)
            
            # When current level ran out of node, the current node is the last node and is the rightmost node
            ans.append(node.val)
        
        return ans
```

### BFS: One Queue + Sentinel

![image](https://leetcode.com/problems/binary-tree-right-side-view/Figures/199_rewrite/sentinel.png)

__Algorithm__

- Initiate the list of the right side view ```rightside```.
- Initiate the queue by adding a root. Add ```null``` sentinel to mark the end of the first level.
- Initiate the current node as ```root```.
- While queue is not empty:

  - Save the previous node ```prev = curr``` and pop the current node from the queue ```curr = queue.poll()```.
  - While the current node is not ```null```:
    - Add first left and then right child node into the queue.
    - Update both previous and current nodes: ```prev = curr```, ```curr = queue.poll()```.
  - Now the current node is null, i.e. we reached the end of the current level. Hence the previous node is the rightmost one and makes a part of the right side view. Add it into ```rightside```.
  - If the queue is not empty, push the null node as a sentinel, to mark the end of the next level.

- Return ```rightside```.

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def rightSideView(self, root: Optional[TreeNode]) -> List[int]:
        if not root:
            return []

        queue = collections.deque([root, None])
        ans = list()

        curr = root
        while queue:
            prev, curr = curr, queue.popleft()
            while curr:
                if curr.left:
                    queue.append(curr.left)
                if curr.right:
                    queue.append(curr.right)

                prev, curr = curr, queue.popleft()

            # When the current level is finished, prev is the rightmost node
            ans.append(prev.val)
            # Add a sentinel to mark the end of the current level
            if queue:
                queue.append(None)
        
        return ans
```

### BFS: One Queue + Level Size Measurements

![image](https://leetcode.com/problems/binary-tree-right-side-view/Figures/199_rewrite/length.png)

__Algorithm__

- Initiate the list of the right side view ```rightside```.
- Initiate the queue by adding a root.
- While the queue is not empty:

  - Write down the length of the current level: ```levelLength = queue.size()```.
  - Iterate over ```i``` from ```0``` to ```level_length - 1```:
    - Pop the current node from the queue: ```node = queue.poll()```.
    - If ```i == levelLength - 1```, then it's the last node in the current level, push it to ```rightsize``` list.
    - Add first _left_ and then _right_ child node into the queue.

- Return ```rightside```.

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def rightSideView(self, root: Optional[TreeNode]) -> List[int]:
        if not root:
            return []
        
        queue = collections.deque([(root)])
        ans = list()

        while queue:
            n = len(queue)
            for i in range(n):
                node = queue.popleft()
                # Check if it is the rightmost node
                if i == n - 1:
                    ans.append(node.val)
                
                if node.left:
                    queue.append(node.left)
                if node.right:
                    queue.append(node.right)
        
        return ans
```
