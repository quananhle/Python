## [109. Convert Sorted List to Binary Search Tree](https://leetcode.com/problems/convert-sorted-list-to-binary-search-tree/)

```Tag```: ```Linked List``` ```Binary Search Tree```

#### Difficulty: Medium

Given the ```head``` of a singly linked list where elements are sorted in __ascending order__, convert it to a __height-balanced__ binary search tree.

![image](https://user-images.githubusercontent.com/35042430/224460876-c8a7df7c-92de-4181-ac84-94375bcf76d7.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/08/17/linked.jpg)
```
Input: head = [-10,-3,0,5,9]
Output: [0,-3,9,-10,null,5]
Explanation: One possible answer is [0,-3,9,-10,null,5], which represents the shown height balanced BST.
```

__Example 2:__
```
Input: head = []
Output: []
```

__Constraints:__

- The number of nodes in head is in the range [0, 2 * 10<sup>4</sup>].
- -10<sup>5</sup> <= ```Node.val``` <= 10<sup>5</sup>

---

### Stack

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def sortedListToBST(self, head: Optional[ListNode]) -> Optional[TreeNode]:
        stack = list()
        while head:
            stack.append(head.val)
            head = head.next
        
        def build_tree(lo, hi):
            # Base case
            if lo > hi:
                return
            
            mi = lo + (hi - lo) // 2
            
            root = TreeNode(stack[mi])
            root.left = build_tree(lo, mi - 1)
            root.right = build_tree(mi + 1, hi)

            return root

        n = len(stack)
        lo, hi = 0, n - 1

        return build_tree(lo, hi)
```

### Recursion

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def sortedListToBST(self, head: Optional[ListNode]) -> Optional[TreeNode]:
        if not head:
            return None

        def find_middle_node(head):
            if not head:
                return None

            prev = None
            slow, fast = head, head
            while fast and fast.next:
                prev = slow
                slow = slow.next
                fast = fast.next.next
            
            if prev:
                prev.next = None

            return slow

        mid = find_middle_node(head)
        root = TreeNode(mid.val)

        if head == mid:
            return root
        
        root.left = self.sortedListToBST(head)
        root.right = self.sortedListToBST(mid.next)
        return root
```

### Inorder Traversal

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def sortedListToBST(self, head: Optional[ListNode]) -> Optional[TreeNode]:
        def get_size(head):
            curr = head
            count = 0
            while curr:
                curr = curr.next
                count += 1
            return count
        
        size = get_size(head)

        def build_tree(lo, hi):
            nonlocal head

            if lo > hi:
                return None
            
            mi = lo + (hi - lo) // 2

            left_child = build_tree(lo, mi - 1)
            
            root = TreeNode(head.val)
            root.left = left_child

            # Move head pointer to the right until the middle node
            head = head.next
            # Start buiding the right child of the tree
            root.right = build_tree(mi + 1, hi)
            return root
        
        return build_tree(0, size - 1)
```
