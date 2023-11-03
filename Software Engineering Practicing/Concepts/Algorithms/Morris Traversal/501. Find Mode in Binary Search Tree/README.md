## [501. Find Mode in Binary Search Tree](https://leetcode.com/problems/find-mode-in-binary-search-tree)

```Tag```: ```Binary Search Tree``` ```Depth-First Search``` ```Breadth-First Search``` ```Hash Map``` 

#### Difficulty: Easy

Given the ```root``` of a binary search tree (BST) with duplicates, return _all the mode(s) (i.e., the most frequently occurred element) in it_.

If the tree has more than one mode, return them in any order.

Assume a BST is defined as follows:

- The left subtree of a node contains only nodes with keys less than or equal to the node's key.
- The right subtree of a node contains only nodes with keys greater than or equal to the node's key.
- Both the left and right subtrees must also be binary search trees.

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/03/11/mode-tree.jpg)
```
Input: root = [1,null,2,2]
Output: [2]
```

__Example 2:__
```
Input: root = [0]
Output: [0]
```

__Constraints:__

- The number of nodes in the tree is in the range $[1, 10^4]$.
- $-10^5 \le Node.val \le 105$
 
---

### In-order Traversal

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(n)$
- __Space Complexity__: $\mathcal{O}(n)$

#### Iterative In-order Traversal

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def findMode(self, root: Optional[TreeNode]) -> List[int]:
        stack = list()
        freq = collections.Counter()

        while stack or root:
            while root:
                stack.append(root)
                root = root.left
            root = stack.pop()
            freq[root.val] = freq.get(root.val, 0) + 1
            root = root.right

        res = list()
        highest_frequency = max(freq.values())
        for key, val in freq.items():
            if val == highest_frequency:
                res.append(key)
        
        return res
```

### Depth-First Search

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(n)$
- __Space Complexity__: $\mathcal{O}(n)$

#### Recursive DFS

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def findMode(self, root: Optional[TreeNode]) -> List[int]:
        freq = collections.defaultdict(int)
        res = list()

        def dfs(node):
            if not node:
                return None
            
            freq[node.val] = 1 + freq.get(node.val, 0)
            dfs(node.left)
            dfs(node.right)
        
        dfs(root)
        highest_frequency = max(freq.values())
        for key, val in freq.items():
            if val == highest_frequency:
                res.append(key)
        
        return res
```

#### Iterative DFS

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def findMode(self, root: Optional[TreeNode]) -> List[int]:
        stack = [root]
        freq = collections.defaultdict(int)
        res = list()

        while stack:
            node = stack.pop()
            freq[node.val] = 1 + freq.get(node.val, 0)

            if node.left: stack.append(node.left)
            if node.right: stack.append(node.right)

        highest_frequency = max(freq.values())
        for key, val in freq.items():
            if val == highest_frequency:
                res.append(key)
        
        return res
```

### Breadth-First Search

![image](https://leetcode.com/problems/find-mode-in-binary-search-tree/Figures/501/bfs.png)

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(n)$
- __Space Complexity__: $\mathcal{O}(n)$

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def findMode(self, root: Optional[TreeNode]) -> List[int]:
        queue = collections.deque([(root)])
        freq = collections.defaultdict(int)
        res = list()

        while queue:
            n = len(queue)

            for _ in range(n):
                node = queue.popleft()
                freq[node.val] = 1 + freq.get(node.val, 0)

                if node.left: queue.append(node.left)
                if node.right: queue.append(node.right)

        highest_frequency = max(freq.values())
        for key, val in freq.items():
            if val == highest_frequency:
                res.append(key)
        
        return res
```

---

### Binay Search Tree Property

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(n)$
- __Space Complexity__: $\mathcal{O}(n)$

#### Recursive Inorder Traversal

![image](https://github.com/quananhle/Python/assets/35042430/3a379fe5-13c5-4bf0-9971-84dff49b5ef9)

So far, we have not taken advantage of the fact that the input tree is a binary search tree (with duplicates). The first three approaches would work for any binary tree.

If you perform an inorder DFS traversal on a binary search tree (BST), you will handle the nodes in sorted order. Why?

Recall that in a BST, all nodes to the left are less than the current node and all nodes to the right are greater than the current node. In an inorder traversal, we handle all the nodes on the left first, then the current node, then all the nodes to the right.

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def findMode(self, root: Optional[TreeNode]) -> List[int]:
        nums = list()

        def dfs(node):
            if not node:
                return None
            
            # Inorder traversal
            dfs(node.left)
            nums.append(node.val)
            dfs(node.right)

        dfs(root)
        max_streak = curr_streak = curr = 0
        res = list()

        for num in nums:
            if num == curr:
                curr_streak += 1
            else:
                curr_streak = 1
                curr = num
            
            if max_streak < curr_streak:
                res = list()
                max_streak = curr_streak
            
            if curr_streak == max_streak:
                res.append(num)
            
        return res
```

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def findMode(self, root: Optional[TreeNode]) -> List[int]:
        max_streak = cur_streak = curr = 0
        res = list()

        def dfs(node):
            nonlocal max_streak, cur_streak, curr, res
            # Base case
            if not node:
                return None
            
            # Inorder traversal
            dfs(node.left)

            num = node.val
            if num == curr:
                cur_streak += 1
            else:
                curr = num
                cur_streak = 1
            
            if max_streak < cur_streak:
                res = list()
                max_streak = cur_streak
            
            if max_streak == cur_streak:
                res.append(num)
            
            dfs(node.right)

        dfs(root)
        return res
```

#### Iterative Inorder Traversal

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def findMode(self, root: Optional[TreeNode]) -> List[int]:
        stack = list()
        nums = list()

        while stack or root:
            while root:
                stack.append(root)
                root = root.left
            root = stack.pop()
            nums.append(root.val)
            root = root.right

        res = list()
        longest_streak = current_streak = curr = 0

        for num in nums:
            if curr == num:
                current_streak += 1
            else:
                current_streak = 1
                curr = num
            
            if longest_streak < current_streak:
                res = list()
                longest_streak = current_streak
            
            if longest_streak == current_streak:
                res.append(num)
        
        return res
```

---

__Follow up__: Could you do that without using any extra space? (Assume that the implicit stack space incurred due to recursion does not count).

### Morris Traversal

#### Intuition

![image](https://leetcode.com/problems/find-mode-in-binary-search-tree/Figures/501/10.png)

In the above tree, we start at the root and move to the left child. Once we are finished fully handling the left subtree, we then handle the root, and finally the right subtree. The reason we use extra stack space during DFS is to "remember" the root and right subtree. Think about it: if we move to ```root.left```, how can we get back to ```root``` and thus ```root.right```?

![image](https://leetcode.com/problems/find-mode-in-binary-search-tree/Figures/501/11.png)

Furthermore, when we are the green node, how do we get back to the blue nodes? Let's assign each node a friend. A node's friend is the rightmost node in the left subtree. That is, to find the friend of ```node```, we first do ```node = node.left```, then do ```node = node.right``` until there is no right child.

![image](https://leetcode.com/problems/find-mode-in-binary-search-tree/Figures/501/12.png)

You may notice that some nodes will not have a friend. Namely, a node will not have a friend if it does not have a left child.

![image](https://leetcode.com/problems/find-mode-in-binary-search-tree/Figures/501/13.png)

Morris traversal takes advantage of the following facts:

> All friends are unique. That is, a node cannot be the friend of more than one node.
>
> Friend nodes do not have the right children. This is because, by definition, we find friend nodes by traversing right until there is no right child.

![image](https://leetcode.com/problems/find-mode-in-binary-search-tree/Figures/501/14.png)

![image](https://leetcode.com/problems/find-mode-in-binary-search-tree/Figures/501/15.png)

![image](https://leetcode.com/problems/find-mode-in-binary-search-tree/Figures/501/16.png)

#### Algorithm

![image](https://leetcode.com/problems/find-mode-in-binary-search-tree/Figures/501/17.png)

![image](https://leetcode.com/problems/find-mode-in-binary-search-tree/Figures/501/18.png)

![image](https://leetcode.com/problems/find-mode-in-binary-search-tree/Figures/501/19.png)

![image](https://leetcode.com/problems/find-mode-in-binary-search-tree/Figures/501/20.png)

![image](https://leetcode.com/problems/find-mode-in-binary-search-tree/Figures/501/21.png)

![image](https://leetcode.com/problems/find-mode-in-binary-search-tree/Figures/501/22.png)

![image](https://leetcode.com/problems/find-mode-in-binary-search-tree/Figures/501/25.png)

![image](https://leetcode.com/problems/find-mode-in-binary-search-tree/Figures/501/26.png)

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(n)$
- __Space Complexity__: $\mathcal{O}(1)$



```Python

```
