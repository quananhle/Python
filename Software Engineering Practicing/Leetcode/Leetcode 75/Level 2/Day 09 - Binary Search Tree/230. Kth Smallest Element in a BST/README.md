## [230. Kth Smallest Element in a BST](https://leetcode.com/problems/kth-smallest-element-in-a-bst/)

```Tag```: ```Binary Search Tree```

#### Difficulty: Medium

Given the root of a binary search tree, and an integer k, return the kth smallest value (1-indexed) of all the values of the nodes in the tree.
 
![image](https://user-images.githubusercontent.com/35042430/224215477-934eb5e3-7852-4b60-90f5-ef945e6bd048.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/01/28/kthtree1.jpg)
```
Input: root = [3,1,4,null,2], k = 1
Output: 1
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2021/01/28/kthtree2.jpg)
```
Input: root = [5,3,6,2,4,null,null,1], k = 3
Output: 3
```

__Constraints:__

- The number of nodes in the tree is ```n```.
- ```1 <= k <= n <= 10^4```
- ```0 <= Node.val <= 10^4```
 
---

### Iterator Inorder Traversal

![image](https://leetcode.com/problems/kth-smallest-element-in-a-bst/Figures/230/iteration.png)

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def kthSmallest(self, root: Optional[TreeNode], k: int) -> int:
        stack = list()
        count = k
        
        while stack or root:
            while root:
                stack.append(root)
                root = root.left
            root = stack.pop()
            if count == 1:
                break
            count -= 1
            root = root.right

        return root.val
```

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def kthSmallest(self, root: Optional[TreeNode], k: int) -> int:
        stack = list()
        count = k
        
        while stack or root:
            while root:
                stack.append(root)
                root = root.left
            root = stack.pop()
            count -= 1
            if not count:
                return root.val
            root = root.right
```

### Recursive Inorder Traversal

![image](https://leetcode.com/problems/kth-smallest-element-in-a-bst/Figures/230/inorder.png)

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def kthSmallest(self, root: Optional[TreeNode], k: int) -> int:
        def inorder(node):
            return inorder(node.left) + [node.val] + inorder(node.right) if node else []
        
        return inorder(root)[k - 1]
```

__Follow up__: If the BST is modified often (i.e., we can do insert and delete operations) and you need to find the kth smallest frequently, how would you optimize?

That's a design question, basically we're asked to implement a structure which contains a BST inside and optimises the following operations :

- Insert

- Delete

- Find k<sup>th</sup> smallest

A double linked list would provide:

- ```O(H)``` time for the insert and delete.

- ```O(k)``` for the search of kth smallest.

![image](https://leetcode.com/problems/kth-smallest-element-in-a-bst/Figures/230/linked_list2.png)

The overall time complexity for insert/delete + search of k<sup>th</sup> smallest is ```O(H + k)``` instead of O(2H + k)

- __Time complexity__ for insert/delete + search of kth smallest: ```O(H + k)```, where ```H``` is a tree height. ```O(log⁡N + k)``` in the average case, ```O(N + k)``` in the worst case.
- __Space complexity__: ```O(N)``` to keep the linked list.
