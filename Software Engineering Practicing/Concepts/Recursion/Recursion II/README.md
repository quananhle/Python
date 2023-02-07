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

