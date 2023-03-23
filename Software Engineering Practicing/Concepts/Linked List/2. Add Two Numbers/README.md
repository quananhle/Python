## [2. Add Two Numbers](https://leetcode.com/problems/add-two-numbers/)

```Tag```: ```Linked List```

#### Difficulty: Medium

You are given two __non-empty__ linked lists representing two non-negative integers. The digits are stored in __reverse order__, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.

You may assume the two numbers do not contain any leading zero, except the number 0 itself.

![image](https://user-images.githubusercontent.com/35042430/210654985-11817a81-31b8-4856-af0a-063fb4ff5a49.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/10/02/addtwonumber1.jpg)
```
Input: l1 = [2,4,3], l2 = [5,6,4]
Output: [7,0,8]
Explanation: 342 + 465 = 807.
```

__Example 2:__
```
Input: l1 = [0], l2 = [0]
Output: [0]
```

__Example 3:__
```
Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
Output: [8,9,9,9,0,0,0,1]
```

__Constraints:__
```
The number of nodes in each linked list is in the range [1, 100].
0 <= Node.val <= 9
It is guaranteed that the list represents a number that does not have leading zeros.
```

---

![image](https://leetcode.com/problems/add-two-numbers/solutions/127833/Figures/2_add_two_numbers.svg)

|Test Cases | Explanation |
|-- |-- |
|l1=[0,1], l2=[0,1,2]|When one list is longer than the other.|
|l1=[], l2=[0,1]|When one list is null, which means an empty list.|
|l1=[9,9], l2=[1]l2=[1]l2=[1]|The sum could have an extra carry of one at the end, which is easy to forget.|

### List()

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def addTwoNumbers(self, l1: Optional[ListNode], l2: Optional[ListNode]) -> Optional[ListNode]:
        stack1, stack2 = list(), list()
        head = ListNode(-1)
        node = head
        list1, list2 = l1, l2
        num1, num2 = 0, 0

        # Build the lists of the digits
        while list1:
            stack1.append(list1.val)
            list1 = list1.next
        while list2:
            stack2.append(list2.val)
            list2 = list2.next

        # Reverse the order of lists of digits
        stack1 = stack1[::-1]
        stack2 = stack2[::-1]

        # Build the number from digits
        for i in range(len(stack1)):
            num1 += stack1[i] * 10**(len(stack1) - i - 1)
        for i in range(len(stack2)):
            num2 += stack2[i] * 10**(len(stack2) - i - 1)

        # Convert the number to the list of digits
        res = [int(digit) for digit in str(num1 + num2)]

        # Build the linked list
        for num in res[::-1]:
            node.next = ListNode(num)
            node = node.next
        return head.next
```

# Math

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def addTwoNumbers(self, l1: Optional[ListNode], l2: Optional[ListNode]) -> Optional[ListNode]:
        head = ListNode(-1)
        node = head
        list1, list2 = l1, l2
        carry = 0

        while list1 or list2 or carry:
            if list1:
                num1 = list1.val
            else:
                num1 = 0
            if list2:
                num2 = list2.val
            else:
                num2 = 0
                
            column_total = num1 + num2 + carry
            carry = column_total // 10
            
            node.next = ListNode(column_total % 10)
            node = node.next

            if list1:
                list1 = list1.next
            if list2:
                list2 = list2.next

        return head.next
```
