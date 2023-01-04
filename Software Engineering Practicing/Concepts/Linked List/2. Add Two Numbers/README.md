## 2. Add Two Numbers

```Tag```: ```List```

#### Difficulty: Medium

You are given two __non-empty__ linked lists representing two non-negative integers. The digits are stored in __reverse order__, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.

You may assume the two numbers do not contain any leading zero, except the number 0 itself.

![image](https://user-images.githubusercontent.com/35042430/210654985-11817a81-31b8-4856-af0a-063fb4ff5a49.png)

---



---

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
