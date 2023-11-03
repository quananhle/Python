 ## [1214. Two Sum BSTs](https://leetcode.com/problems/two-sum-bsts/)

```Tag```: ```Binary Search Tree``` ```Hash Map``` ```Hash Set``` ```Depth-First Search``` ```Two Pointers``` ```Morris Traversal```

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

#### Hash Map

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

#### Hash Set

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
        seen = set()

        while stack1 or root1:
            while root1:
                stack1.append(root1)
                root1 = root1.left
            root1 = stack1.pop()
            seen.add(target - root1.val)
            root1 = root1.right
        
        while stack2 or root2:
            while root2:
                stack2.append(root2)
                root2 = root2.left
            root2 = stack2.pop()
            if root2.val in seen:
                return True
            root2 = root2.right
        
        return False
```

---

### Depth-First Search

#### Approach 1: Brute Force

Suppose we perform a preorder traversal of ```root1```.

![image](https://leetcode.com/problems/two-sum-bsts/Figures/1214/1.png)

Similarly, we can store the value of each node of ```root2``` in ```stack2```.

![image](https://leetcode.com/problems/two-sum-bsts/Figures/1214/2.png)

Now we need to try every pair of values from ```stack1``` and ```stack2```. It requires a nested iteration.

- __Time Complexity__: $O(m ⋅ ⁡n)$
- __Space Complexity__: $O(⁡m + n)$

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

#### Approach 2: Binary Search

![image](https://leetcode.com/problems/two-sum-bsts/Figures/1214/b1.png)

![image](https://leetcode.com/problems/two-sum-bsts/Figures/1214/b2.png)

- __Time Complexity__: $O(m⋅log⁡n)$
- __Space Complexity__: $O(log⁡m+log⁡n)$

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def twoSumBSTs(self, root1: Optional[TreeNode], root2: Optional[TreeNode], target: int) -> bool:
        def binary_search(node, target):
            if not node:
                return False
            
            if node.val == target:
                return True
            elif node.val < target:
                return binary_search(node.right, target)
            else:
                return binary_search(node.left, target)

        def dfs(node, target):
            if not node:
                return False
            
            if binary_search(root2, target - node.val):
                return True
            
            return dfs(node.left, target) or dfs(node.right, target)

        return dfs(root1, target)
```

#### Approach 3: Hash Set

![image](https://leetcode.com/problems/two-sum-bsts/Figures/1214/3.png)

- __Time Complexity__: $O(m + ⁡n)$
- __Space Complexity__: $O(⁡m + n)$

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def twoSumBSTs(self, root1: Optional[TreeNode], root2: Optional[TreeNode], target: int) -> bool:
        def dfs(node, seen):
            if not node:
                return None
            dfs(node.left, seen)
            seen.add(node.val)
            dfs(node.right, seen)

        seen1, seen2 = set(), set()
        dfs(root1, seen1)
        dfs(root2, seen2)
    
        for val1 in seen1:
            if target - val1 in seen2:
                return True
        
        return False
```

#### Two Pointers

![image](https://leetcode.com/problems/two-sum-bsts/Figures/1214/sorted.png)

- __Time Complexity__: $O(m + ⁡n)$
- __Space Complexity__: $O(⁡m + n)$


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
            dfs(node.left, stack)
            stack.append(node.val)
            dfs(node.right, stack)

        stack1, stack2 = list(), list()
        dfs(root1, stack1)
        dfs(root2, stack2)

        left, right = 0, len(stack2) - 1
    
        while left < len(stack1) and right > -1:
            if stack1[left] + stack2[right] == target:
                return True
            elif stack1[left] + stack2[right] < target:
                left += 1
            else:
                right -= 1
            
        return False
```

##### Approach 5: Morris Traversal

![image](https://leetcode.com/problems/two-sum-bsts/Figures/1214/mor1.png)

![image](https://leetcode.com/problems/two-sum-bsts/Figures/1214/mor2.png)

![image](https://leetcode.com/problems/two-sum-bsts/Figures/1214/mor3.png)

![image](https://leetcode.com/problems/two-sum-bsts/Figures/1214/mor4.png)

![image](https://leetcode.com/problems/two-sum-bsts/Figures/1214/mor5.png)

__Algorithm__

1. Build two iterators ```iterator1``` and ```iterator2``` that perform inorder Morris traversal over ```root1``` and backward inorder Morris traversal over ```root2```, respectively.

2. Start with the smallest element of ```root1``` and the largest element of ```root2```.

3. While both iterators have non-empty values, we compare ```value1 + value2``` with ```target```:

 - If ```value1 + value2 = target```, return ```True```.
 - If ```value1 + value2 < target```, move on to the next node of ```iterator1```.
 - If ```value1 + value2 > target```, move on to the next node of ```iterator2```.

4. If we can't find a valid pair after the iteration, return ```False```.

- __Time Complexity__: $O(m + ⁡n)$
- __Space Complexity__: $O(⁡1)$

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def twoSumBSTs(self, root1: Optional[TreeNode], root2: Optional[TreeNode], target: int) -> bool:
        def morris_traversal(root):
            current = root
            while current:
                if not current.left:

                    # If you're a little confused about the key word 'yield', 
                    # please see the next paragraph for some explanation.
                    yield current.val
                    current = current.right
                else:
                    pre = current.left
                    while pre.right and pre.right != current:
                        pre = pre.right
                    if not pre.right:
                        pre.right = current
                        current = current.left
                    else:
                        pre.right = None
                        yield current.val
                        current = current.right

        def reversed_morris_traversal(root):
            current = root
            while current:
                if not current.right:
                    yield current.val
                    current = current.left
                else:
                    pre = current.right
                    while pre.left and pre.left != current:
                        pre = pre.left
                    if not pre.left:
                        pre.left = current
                        current = current.right
                    else:
                        pre.left = None
                        yield current.val
                        current = current.left
                        
        iterater1 = morris_traversal(root1)
        iterater2 = reversed_morris_traversal(root2)
        value1 = next(iterater1, None)
        value2 = next(iterater2, None)

        while value1 is not None and value2 is not None:
            if value1 + value2 == target:
                return True
            elif value1 + value2 < target:
                value1 = next(iterater1, None)
            else:
                value2 = next(iterater2, None)
        return False
```
