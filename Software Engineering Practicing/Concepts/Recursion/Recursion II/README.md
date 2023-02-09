# Recursion II

## Divide & Conquer

### D&C Introduction

```Divide and conquer (D&C)``` is one of the __most important__ paradigms in algorithm design and is widely used.

```
A divide-and-conquer algorithm works by recursively breaking the problem down into two or more subproblems 
of the same or related type, until these subproblems become simple enough to be solved directly [1]. 
Then one combines the results of subproblems to form the final solution.
```

![image](https://user-images.githubusercontent.com/35042430/217094538-285424fd-4181-44d3-bec4-77ed38da5033.png)

![image](https://assets.leetcode.com/uploads/2019/04/24/d_c.png)

### Merge Sort

One of the classic examples of the ```divide-and-conquer``` algorithm is the merge sort algorithm. Merge sort is an efficient and general-purpose sorting algorithm. 

There are two approaches to implement the merge sort algorithm: __top down__ or __bottom up__.

The merge sort algorithm can be divided into three steps, like all divide-and-conquer algorithms:

    1. Divide the given unsorted list into several sublists.  (Divide)

    2. Sort each of the sublists recursively.  (Conquer)

    3. Merge the sorted sublists to produce new sorted list.  (Combine)
    
![image](https://assets.leetcode.com/uploads/2019/04/15/topdown_mergesort.png)

    1. In the first step, we divide the list into two sublists.  (Divide)

    2. Then in the next step, we recursively sort the sublists in the previous step.  (Conquer)

    3. Finally we merge the sorted sublists in the above step repeatedly to obtain the final list of sorted elements.  (Combine)
    
The recursion in step (2) would reach the base case where the input list is either empty or contains a single element (see the nodes in blue from the above figure).

Merging two sorted lists can be done in linear time complexity ```O(N)```, where ```N``` is the total lengths of the two lists to merge.

![image](https://assets.leetcode.com/uploads/2019/04/06/merge_sort_merge.gif)

```Python
class Solution:
    def merge_sort(self, nums: List[int]) -> List[int]:
        if len(nums) <= 1:
            return nums
        
        def merge(left_list, right_list):
            l, r = len(left_list), len(right_list)
            left_cursor = right_cursor = cursor = 0
            res = list()
            while left_cursor < l and right_cursor < r:
                if left_list[left_cursor] < right_list[right_cursor]:
                    res.append(left_list[left_cursor])
                    left_cursor += 1
                else:
                    res.append(right_list[right_cursor])
                    right_cursor += 1
            res.extend(left_list[left_cursor:])
            res.extend(right_list[right_cursor:])
        
            return res
        
        pivot = len(nums) // 2
        left_list = self.merge_sort(nums[:pivot])
        right_list = self.merge_sort(nums[pivot:])
        
        return merge(left_list, right_list)
```

### D&C Template

![image](https://user-images.githubusercontent.com/35042430/217106087-919d268c-9707-4088-a95c-0b5d18cad5ca.png)

```Python
def divide_and_conquer( S ):
    # (1). Divide the problem into a set of subproblems.
    [S1, S2, ... Sn] = divide(S)

    # (2). Solve the subproblem recursively,
    #   obtain the results of subproblems as [R1, R2... Rn].
    rets = [divide_and_conquer(Si) for Si in [S1, S2, ... Sn]]
    [R1, R2,... Rn] = rets

    # (3). combine the results from the subproblems.
    #   and return the combined result.
    return combine([R1, R2,... Rn])
```

#### Validate Binary Search Tree

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def isValidBST(self, root: Optional[TreeNode]) -> bool:
        '''
        stack = list()
        parent = -sys.maxsize - 1
        while stack or root:
            while root:
                stack.append(root)
                root = root.left
            root = stack.pop()
            if root.val <= parent:
                return False
            parent = root.val
            root = root.right
        return True
        '''
        # Recursion
        self.parent = -sys.maxsize - 1
        def inorder(node):
            # Base case: if traverse through every node of the tree
            if not node:
                return True
            # Check left subtree, return False if failed
            if not inorder(node.left):
                return False
            if node.val <= self.parent:
                return False
            # Update the limit
            self.parent = node.val
            # Check the right subtree
            return inorder(node.right)
        
        return inorder(root)
```

### Master Theorem

---

## Backtracking

![image](https://assets.leetcode.com/uploads/2019/04/15/backtracking.png)

```
Backtracking is a general algorithm for finding all (or some) solutions to some computational problems (notably Constraint satisfaction problems or CSPs), which incrementally builds candidates to the solution and abandons a candidate ("backtracks") as soon as it determines that the candidate cannot lead to a valid solution. [1]

Once we can determine if a certain node cannot possibly lead to a valid solution, we abandon the current node and backtrack to its parent node to explore other possibilities. It is due to this backtracking behaviour, the backtracking algorithms are often much faster than the brute-force search [2] algorithm, since it eliminates many unnecessary exploration. 
```

![image](https://assets.leetcode.com/uploads/2019/05/30/backtracking1.jpeg)

__Brute approach__

![image](https://assets.leetcode.com/uploads/2019/05/30/backtracking2.jpeg)

__Backtracking approach__

![image](https://assets.leetcode.com/uploads/2019/05/30/backtracking3.jpeg)

---

## Unfold Recursion

Recursion could be an elegant and intuitive solution, when applied properly. Nevertheless, sometimes, one might have to convert a recursive algorithm to iterative one for various reasons.

__Risk of Stackoverflow__

The recursion often incurs additional memory consumption on the system stack, which is a limited resource for each program. If not used properly, the recursion algorithm could lead to stackoverflow. One might argue that a specific type of recursion called tail recursion could solve this problem. Unfortunately, not every recursion can be converted to tail recursion, and not every compiler supports the optimization of the tail recursion.

__Efficiency__

Along with the additional memory consumption, the recursion could impose at least the additional cost of function calls, and in a worse case duplicate calculation, i.e. one of the caveats of recursion that we discussed previously in the Explore card of Recursion I.  

__Complexity__

The nature of recursion is quite close to the mathematics, which is why the recursion appears to be more intuitive and comprehensive for many people. However, when we abuse the recursion, the recursive program could become more difficult to read and understand than the non-recursive one, e.g. nested recursion etc.

        The good news is that we can always convert a recursion to iteration. In order to do so, in general, we use a 
        data structure of stack or queue, which replaces the role of the system call stack during the process of recursion. 

To convert a recursion approach to an iteration one, we could perform the following two steps:

1. We use a ```stack``` or ```queue``` data structure within the function, to replace the role of the system call stack. At each occurrence of recursion, we simply push the parameters as a new element into the data structure that we created, instead of invoking a recursion.

2. In addition, we create a loop over the data structure that we created before. The chain invocation of recursion would then be replaced with the iteration within the loop.

---
