## [86. Partition List](https://leetcode.com/problems/partition-list/)

```Tag```: ```Linked List```

#### Difficulty: Medium

Given the ```head``` of a linked list and a value ```x```, partition it such that all nodes __less than__ ```x``` come before nodes __greater than or equal to__ ```x```.

You should preserve the original relative order of the nodes in each of the two partitions.

![image](https://github.com/quananhle/Python/assets/35042430/3b810ef5-c261-4095-841a-6d132408ec0d)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/01/04/partition.jpg)
```
Input: head = [1,4,3,2,5,2], x = 3
Output: [1,2,2,4,3,5]
```

__Example 2:__
```
Input: head = [2,1], x = 2
Output: [1,2]
```

__Constraints:__

- The number of nodes in the list is in the range ```[0, 200]```.
- $-100 \le Node.val \le 100$
- $-200 \le x \le 200$

---

![image](https://leetcode.com/problems/partition-list/Figures/86/86_Partition_List_1.png)

Reverse engineering the question tells us that if we break the reformed list at the ```JOINT```, we will get two smaller linked lists, one with lesser elements and the other with elements greater or equal to ```x```. In the solution, our main aim is to create these two linked lists and join them.

### Two Pointers

__Algorithm__

1. Initialize two pointers ```before``` and ```after```. In the implementation we have initialized these two with a dummy ```ListNode```. This helps to reduce the number of conditional checks we would need otherwise. You can try an implementation where you don't initialize with a dummy node and see it yourself!
![image](https://leetcode.com/problems/partition-list/Figures/86/86_Partition_List_2.png)
Dummy Node Initialization

2. Iterate the original linked list, using the ```head``` pointer.

3. If the node's value pointed by ```head``` is smaller than ```x```, the node should be part of the ```before``` list. So we connect it to ```before``` list.
![image](https://leetcode.com/problems/partition-list/Figures/86/86_Partition_List_3.png)

4. Else, the node should be part of ```after``` list. So we connect it to ```after``` list.
![image](https://leetcode.com/problems/partition-list/Figures/86/86_Partition_List_4.png)

5. Once we are done with all the nodes in the original linked list, we would have two list ```before``` and ```after```. The original list nodes are either part of ```before``` list or ```after``` list, depending on its value.
![image](https://leetcode.com/problems/partition-list/Figures/86/86_Partition_List_5.png)

__Note__: _Since we traverse the original linked list from left to right, at no point would the order of nodes change relatively in the two lists. Another important thing to note here is that we show the original linked list intact in the above diagrams. However, in the implementation, we remove the nodes from the original linked list and attach them in the before or after list. We don't utilize any additional space. We simply move the nodes from the original list around_.

6. Now, these two lists ```before``` and ```after``` can be combined to form the reformed list.
![image](https://leetcode.com/problems/partition-list/Figures/86/86_Partition_List_6.png)

Complexity Analysis

- __Time Complexity__: $\mathcal{O}(N)$, where ```N``` is the number of nodes in the original linked list and we iterate the original list.
- __Space Complexity__: $\mathcal{O}(1)$, we have not utilized any extra space, the point to note is that we are reforming the original list, by moving the original nodes, we have not used any extra space as such.

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def partition(self, head: Optional[ListNode], x: int) -> Optional[ListNode]:
        before_x = before_head = ListNode(0)
        after_x = after_head = ListNode(0)

        curr = head
        while curr:
            if curr.val < x:
                before_x.next = curr
                before_x = before_x.next
            else:
                after_x.next = curr
                after_x = after_x.next
            
            curr = curr.next
        
        after_x.next = None
        before_x.next = after_head.next

        return before_head.next
```

