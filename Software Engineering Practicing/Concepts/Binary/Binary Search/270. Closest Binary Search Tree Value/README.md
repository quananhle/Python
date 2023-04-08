## [270. Closest Binary Search Tree Value](https://leetcode.com/problems/closest-binary-search-tree-value)

```Tag```: ```Binary Search Tree``` ```Binary Search```

#### Difficulty: Easy

Given the ```root``` of a binary search tree and a ```target``` value, return _the value in the BST that is closest to the ```target```_. If there are multiple answers, print the smallest.

![image](https://user-images.githubusercontent.com/35042430/230703768-0bbc7309-fa3b-484b-974d-7ffd53db6527.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/03/12/closest1-1-tree.jpg)
```
Input: root = [4,2,5,1,3], target = 3.714286
Output: 4
```

__Example 2:__
```
Input: root = [1], target = 4.428571
Output: 1
```

__Constraints:__

- The number of ```nodes``` in the tree is in the range ```[1, 10^4]```.
- ```0 <= Node.val <= 10^9```
- ```-10^9 <= target <= 10^9```

---

![image](https://leetcode.com/problems/closest-binary-search-tree-value/Figures/270/dummy.png)

### Binary Search Tree Inorder Traversal

#### Iterative Inorder Traversal

![image](https://leetcode.com/problems/closest-binary-search-tree-value/Figures/270/iteration.png)

- __Time complexity__: ```O(k)``` in the average case and ```O(H + k)``` in the worst case, where ```k``` is an index of closest element. It's known that average case is a balanced tree, in that case ```stack``` always contains a few elements, and hence one does ```2k``` operations to go to k<sup>th</sup> element in inorder traversal (```k``` times to push into ```stack``` and then ```k``` times to pop out of stack). That results in ```O(k)``` time complexity. The worst case is a completely unbalanced tree, then you first push ```H``` elements into ```stack``` and then pop out ```k``` elements, that results in ```O(H + k)``` time complexity.

![image](https://leetcode.com/problems/closest-binary-search-tree-value/Figures/270/unbalanced.png)

- __Space complexity__: up to ```O(H)``` to keep the stack in the case of non-balanced tree.

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def closestValue(self, root: Optional[TreeNode], target: float) -> int:
        if not root:
            return None

        difference = float("inf")
        ans = 0
        
        stack = list()
        
        while stack or root:
            while root:
                stack.append(root)
                root = root.left
            root = stack.pop()
            if abs(root.val - target) < difference:
                difference = abs(root.val - target)
                ans = root.val
            root = root.right
        
        return ans
```

#### Recursive Inorder Traversal

- __Time complexity__: ```O(N)```
- __Space complexity__: ```O(N)```

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def closestValue(self, root: Optional[TreeNode], target: float) -> int:
        if not root:
            return None

        def inorder(node):
            if not node:
                return []

            return inorder(node.left) + [node.val] + inorder(node.right)
        
        return min(inorder(root), key=lambda x: abs(target - x))
```
