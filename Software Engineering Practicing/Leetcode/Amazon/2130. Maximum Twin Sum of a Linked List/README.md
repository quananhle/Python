## [2130. Maximum Twin Sum of a Linked List](https://leetcode.com/problems/maximum-twin-sum-of-a-linked-list)

```Tag```: ```Linked List``` ```Two Pointers```

#### Difficulty: Medium

In a linked list of size ```n```, where ```n``` is even, the i<sup>th</sup> node (__0-indexed__) of the linked list is known as the twin of the (n-1-i)<sup>th</sup> node, if ```0 <= i <= (n / 2) - 1```.

For example, if ```n = 4```, then node ```0``` is the twin of node ```3```, and node ```1``` is the twin of node ```2```. These are the only nodes with twins for ```n = 4```.
The __twin sum__ is defined as the sum of a node and its twin.

Given the ```head``` of a linked list with even length, return _the maximum twin sum of the linked list_.

![image](https://github.com/quananhle/Python/assets/35042430/7220588b-9c45-4a00-985a-9ef8f3466c78)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/12/03/eg1drawio.png)
```
Input: head = [5,4,2,1]
Output: 6
Explanation:
Nodes 0 and 1 are the twins of nodes 3 and 2, respectively. All have twin sum = 6.
There are no other nodes with twins in the linked list.
Thus, the maximum twin sum of the linked list is 6. 
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2021/12/03/eg2drawio.png)
```
Input: head = [4,2,2,3]
Output: 7
Explanation:
The nodes with twins present in this linked list are:
- Node 0 is the twin of node 3 having a twin sum of 4 + 3 = 7.
- Node 1 is the twin of node 2 having a twin sum of 2 + 2 = 4.
Thus, the maximum twin sum of the linked list is max(7, 4) = 7. 
```

__Example 3:__

![image](https://assets.leetcode.com/uploads/2021/12/03/eg3drawio.png)
```
Input: head = [1,100000]
Output: 100001
Explanation:
There is only one node with a twin in the linked list having twin sum of 1 + 100000 = 100001.
```

__Constraints:__

- The number of nodes in the list is an even integer in the range ```[2, 10^5]```.
- ```1 <= Node.val <= 10^5```

---

### List

- __Time Complexity__: ```O(n)```
- __Space Complexity__: ```O(n)```

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def pairSum(self, head: Optional[ListNode]) -> int:
        nodes = list()

        curr = head
        while curr:
            nodes.append(curr.val)
            curr = curr.next
        
        ans = float('-inf')
        i, j = 0, len(nodes) - 1
        while i < j:
            ans = max(ans, nodes[i] + nodes[j])
            i += 1
            j -= 1
        
        return ans
```

### Stack

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def pairSum(self, head: Optional[ListNode]) -> int:
        ans = float('-inf')

        curr = head
        stack = list()
        while curr:
            stack.append(curr.val)
            curr = curr.next
        
        curr = head
        k = len(stack)
        count = 1
        while count <= k // 2:
            ans = max(ans, curr.val + stack.pop())
            curr = curr.next
            count += 1
        
        return ans
```

### Linked List

#### Brute Force

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def pairSum(self, head: Optional[ListNode]) -> int:
        mid = curr = head
        k = 0

        while curr:
            k += 1
            curr = curr.next

        m = k - (k // 2)
        while m:
            m -= 1
            mid = mid.next

        tail = None
        curr = mid
        while curr:
            tmp = curr.next
            curr.next = tail
            tail = curr
            curr = tmp

        while head and tail:
            ans = max(ans, head.val + tail.val)
            head, tail = head.next, tail.next

        return ans
```

#### Slow & Fast Pointers

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def pairSum(self, head: Optional[ListNode]) -> int:
        slow = fast = head
        tail = None
        # Get the middle node
        while fast and fast.next:
            slow, fast = slow.next, fast.next.next

        # Reverse the right half of the linked list
        while slow:
            '''
            tmp = slow.next
            slow.next = tail
            tail = slow
            slow = tmp
            '''
            slow.next, tail, slow = tail, slow, slow.next

        # Calculate the twin node values
        ans = float('-inf')
        while head and tail:
            ans = max(ans, head.val + tail.val)
            head, tail = head.next, tail.next

        return ans
```
