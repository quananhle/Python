## [445. Add Two Numbers II](https://leetcode.com/problems/add-two-numbers-ii)

```Tag```: ```Stack``` ```Linked List``` ```Two Pointers```

#### Difficulty: Medium

You are given two non-empty linked lists representing two non-negative integers. The most significant digit comes first and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.

You may assume the two numbers do not contain any leading zero, except the number 0 itself.

![image](https://github.com/quananhle/Python/assets/35042430/f5f99783-5ec2-46a8-8d04-3a19eb53d1c3)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/04/09/sumii-linked-list.jpg)
```
Input: l1 = [7,2,4,3], l2 = [5,6,4]
Output: [7,8,0,7]
```

__Example 2:__
```
Input: l1 = [2,4,3], l2 = [5,6,4]
Output: [8,0,7]
```

__Example 3:__
```
Input: l1 = [0], l2 = [0]
Output: [0]
```

---

__Constraints:__

- The number of nodes in each linked list is in the range $[1, 100]$.
- ```0 <= Node.val <= 9```
- It is guaranteed that the list represents a number that does not have leading zeros.

---

### Stack

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(m+n)$
- __Space Complexity__: $\mathcal{O}(m+n)$

#### Compute integer from left -> right

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def addTwoNumbers(self, l1: Optional[ListNode], l2: Optional[ListNode]) -> Optional[ListNode]:
        # Traverse the linked list
        def get_number(node):
            stack = list()
            curr = node

            while curr:
                stack.append(curr.val)
                curr = curr.next
            
            return stack

        # Recompute the integer from list of individual numbers 
        def build_number(arr):
            n = len(arr)
            num = 0
            i = 0

            while n:
                num += arr[i] * (10 ** (n - 1))
                n -= 1
                i += 1
            
            return num
        
        num1, num2 = get_number(l1), get_number(l2)
        num1, num2 = build_number(num1), build_number(num2)
        new_num = str(num1 + num2)

        # Build the output linked list
        new_head = curr = ListNode()
        for node in new_num:
            curr.next = ListNode(node)
            curr = curr.next

        return new_head.next
```

#### Computer integer from left <- right

```Python

```

__Follow Up__: Could you solve it without reversing the input lists?
