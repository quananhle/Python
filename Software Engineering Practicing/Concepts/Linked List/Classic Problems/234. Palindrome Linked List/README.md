## [234. Palindrome Linked List](https://leetcode.com/problems/palindrome-linked-list)

```Tag```: ```Two Pointers``` ```List```

#### Difficulty: Easy

Given the ```head``` of a singly linked list, return _```true``` if it is a palindrome or ```false``` otherwise_.

![image](https://user-images.githubusercontent.com/35042430/210603028-90b61b98-86dc-4f71-9a47-9dccc611da18.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/03/03/pal1linked-list.jpg)
```
Input: head = [1,2,2,1]
Output: true
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2021/03/03/pal2linked-list.jpg)
```
Input: head = [1,2]
Output: false
```

__Constraints:__
```
The number of nodes in the list is in the range [1, 105].
0 <= Node.val <= 9
```

---

### List()

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def isPalindrome(self, head: Optional[ListNode]) -> bool:
        # List
        #### Time Complexity: O(N), traverse through the entire linked list to build the array
        #### Space Complexity: O(N), extra memory space required to build the array
        stack = list()
        curr = head
        while curr:
            stack.append(curr.val)
            curr = curr.next
        left, right = 0, len(stack)-1
        while left < right:
            if stack[left] != stack[right]:
                return False
            left += 1
            right -= 1
        return True
```

__Follow up__: Could you do it in O(n) time and O(1) space?

### Two Pointers

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def isPalindrome(self, head: Optional[ListNode]) -> bool:
        # List
        #### Time Complexity: O(N), traverse through the entire linked list to build the array
        #### Space Complexity: O(1), constant memory space for pointers

        if not head:
            return True

        # Get to the middle of the linked list
        def get_middle_node(node):
            slow, fast = node, node
            while fast.next and fast.next.next:
                fast = fast.next.next                
                slow = slow.next
            return slow

        # Reverse the linked list
        def reverse_linked_list(node):
            prev, curr = None, node
            while curr:
                next_node = curr.next
                curr.next = prev
                prev = curr
                curr = next_node
            return prev

        # Find the end of first half and reverse second half.
        sentinel = head
        first_half_end = get_middle_node(sentinel)
        second_half_start = reverse_linked_list(first_half_end.next)

        # Check whether or not there's a palindrome.
        left = sentinel
        right = second_half_start 
        while right:
            if left.val != right.val:
                return False
            left = left.next
            right = right.next
        return True
```

