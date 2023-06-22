## [1214. Two Sum BSTs](https://leetcode.com/problems/two-sum-bsts/)

```Tag```: ```Binary Search Tree``` ```Hash Map``` ```Depth-First Search``` ```Two Pointers``` ```Morris Traversal```

#### Difficulty: Medium

Given the roots of two binary search trees, ```root1``` and ```root2```, return _```true``` if and only if there is a node in the first tree and a node in the second tree whose values sum up to a given integer ```target```_.

![image](https://github.com/quananhle/Python/assets/35042430/3c75f628-a575-4094-b5eb-88200a7f7b8f)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/02/10/ex1.png)
```
Input: root1 = [2,1,4], root2 = [1,0,3], target = 5
Output: true
Explanation: 2 and 3 sum up to 5.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2021/02/10/ex2.png)
```
Input: root1 = [0,-10,10], root2 = [5,1,7,0,2], target = 18
Output: false
```

__Constraints__:

- The number of nodes in each tree is in the range ```[1, 5000]```.
- ```-10^9 <= Node.val, target <= 10^9```

---

### Iterative Inorder Traversal

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def twoSumBSTs(self, root1: Optional[TreeNode], root2: Optional[TreeNode], target: int) -> bool:
        stack1, stack2 = list(), list()
        memo = collections.defaultdict(int)

        while stack1 or root1:
            while root1:
                stack1.append(root1)
                root1 = root1.left
            root1 = stack1.pop()
            if not root1.val in memo:
                memo[target - root1.val] = root1.val
            root1 = root1.right
        
        while stack2 or root2:
            while root2:
                stack2.append(root2)
                root2 = root2.left
            root2 = stack2.pop()
            if root2.val in memo:
                return True
            root2 = root2.right
        
        return False
```

---

### Approach 1: Brute Force

Suppose we perform a preorder traversal of ```root1```.

![image](https://leetcode.com/problems/two-sum-bsts/Figures/1214/1.png)

Similarly, we can store the value of each node of ```root2``` in ```stack2```.

![image](https://leetcode.com/problems/two-sum-bsts/Figures/1214/2.png)

Now we need to try every pair of values from ```stack1``` and ```stack2```. It requires a nested iteration.

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def twoSumBSTs(self, root1: Optional[TreeNode], root2: Optional[TreeNode], target: int) -> bool:
        def dfs(node, stack):
            if not node:
                return None
            
            stack.append(node.val)
            dfs(node.left, stack)
            dfs(node.right, stack)

        stack1, stack2 = list(), list()
        dfs(root1, stack1)
        dfs(root2, stack2)

        for n1 in stack1:
            for n2 in stack2:
                if n1 + n2 == target:
                    return True
                
        return False
```


