## 103. Binary Tree Zigzag Level Order Traversal

```Tag```: ```Binary Tree``` ```Depth-First Search``` ```Breadth-First Search``` ```Queue``` ```Stack``` ```Recursion```

#### Difficulty: Medium

Given the ```root``` of a binary tree, return _the zigzag level order traversal of its nodes' values_. (i.e., from left to right, then right to left for the next level and alternate between).

![image](https://user-images.githubusercontent.com/35042430/219906380-80d3dff1-02dd-4ca5-b15a-ebe727931741.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/02/19/tree1.jpg)
```
Input: root = [3,9,20,null,null,15,7]
Output: [[3],[20,9],[15,7]]
```

__Example 2:__
```
Input: root = [1]
Output: [[1]]
```

__Example 3:__
```
Input: root = []
Output: []
```

__Constraints:__

- The number of nodes in the tree is in the range ```[0, 2000]```.
- ```-100 <= Node.val <= 100```

---

### Depth-First Search

#### Recursive

Using hash map to keep track of the node of each level of the tree, then using add element to list and reverse at every odd index

- Time complexity: ```0(N)```, recursively traverse through every node of root

- Space complexity: ```O(N)```, recursive call stack builds up to n nodes and hash table contains n nodes of root

```Python
class Solution:
    def zigzagLevelOrder(self, root: Optional[TreeNode]) -> List[List[int]]:
        if not root:
            return None

        level_order = collections.defaultdict(list)
        res = list()

        def dfs(node, level):
            level_order[level].append(node.val)
            
            if node.left:
                dfs(node.left, level + 1)
            if node.right:
                dfs(node.right, level + 1)

        dfs(root, 0)
        
        for key, val in level_order.items():
            if key % 2 != 0:
                res.append(val[:][::-1])
            else:
                res.append(val[:])
        return res
```

#### Iteartive

- Time complexity: ```0(N)```, iteratively traverse through every node of root

- Space complexity: ```O(N)```, stack and hash table contains n nodes of root

```Python
class Solution:
    def zigzagLevelOrder(self, root: Optional[TreeNode]) -> List[List[int]]:
        if not root:
            return None
        
        level_order = collections.defaultdict(list)
        stack = [(root, 0)]
        res = list()

        while stack:
            node, level = stack.pop()
            level_order[level].append(node.val)
            if node.right:
                stack.append((node.right, level + 1))
            if node.left:
                stack.append((node.left, level + 1))
        
        for key, val in level_order.items():
            if key % 2 != 0:
                res.append(val[:][::-1])
            else:
                res.append(val[:])
        return res
```

