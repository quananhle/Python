## [234. Palindrome Linked List](https://leetcode.com/problems/palindrome-linked-list/)

```Tag```: ```Two Pointers``` ```Linked List``` ```List```

#### Difficulty: Easy

Given the ```head``` of a singly linked list, return _```true``` if it is a palindrome or ```false``` otherwise_.

![image](https://user-images.githubusercontent.com/35042430/222883428-4539f288-a673-43ec-b1cb-cbf4ba6fe9fa.png)

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

- The number of nodes in the list is in the range ```[1, 10^5]```.
- ```0 <= Node.val <= 9```

---

### List

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def isPalindrome(self, head: Optional[ListNode]) -> bool:
        # Stack
        node = head
        stack = list()
        
        while node:
            stack.append(node.val)
            node = node.next

        '''
        return stack == stack[::-1]
        '''

        left, right = 0, len(stack) - 1
        while left < right:
            if stack[left] != stack[right]:
                return False
            left += 1
            right -= 1
        return True
```

Follow up: Could you do it in ```O(n)``` time and ```O(1)``` space?

