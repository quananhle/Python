## [3062. Winner of the Linked List Game](https://leetcode.com/problems/winner-of-the-linked-list-game)

```Tag```: ```Linked List``` ```Two Pointers```

#### Difficulty: Easy

You are given the ```head``` of a linked list of even length containing integers.

Each odd-indexed node contains an odd integer and each even-indexed node contains an even integer.

We call each even-indexed node and its next node a pair, e.g., the nodes with indices ```0``` and ```1``` are a pair, the nodes with indices ```2``` and ```3``` are a pair, and so on.

For every pair, we compare the values of the nodes in the pair:

- If the odd-indexed node is higher, the ```"Odd"``` team gets a point.
- If the even-indexed node is higher, the ```"Even"``` team gets a point.

Return _the name of the team with the higher points_, if the points are equal, return _```"Tie"```_.

---

__Example 1:__

```
Input: head = [2,1]

Output: "Even"

Explanation: There is only one pair in this linked list and that is (2,1). Since 2 > 1, the Even team gets the point.

Hence, the answer would be "Even".
```

__Example 2:__

```
Input: head = [2,5,4,7,20,5]

Output: "Odd"

Explanation: There are 3 pairs in this linked list. Let's investigate each pair individually:

(2,5) -> Since 2 < 5, The Odd team gets the point.

(4,7) -> Since 4 < 7, The Odd team gets the point.

(20,5) -> Since 20 > 5, The Even team gets the point.

The Odd team earned 2 points while the Even team got 1 point and the Odd team has the higher points.

Hence, the answer would be "Odd".
```

__Example 3:__

```
Input: head = [4,5,2,1]

Output: "Tie"

Explanation: There are 2 pairs in this linked list. Let's investigate each pair individually:

(4,5) -> Since 4 < 5, the Odd team gets the point.

(2,1) -> Since 2 > 1, the Even team gets the point.

Both teams earned 1 point.

Hence, the answer would be "Tie".
```
 
__Constraints:__

- The number of nodes in the list is in the range ```[2, 100]```.
- The number of nodes in the list is even.
- $1 \le Node.val \le 100$
- The value of each odd-indexed node is odd.
- The value of each even-indexed node is even.

---

### Two Pointers

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def gameResult(self, head: Optional[ListNode]) -> str:
        team_0, team_1 = None, None
        odd = even = 0
        nodes = head

        while nodes:
            team_0, team_1 = nodes.val, nodes.next.val
            if team_0 > team_1:
                even += 1
            elif team_0 < team_1:
                odd += 1
            else:
                even += 1; odd += 1
            nodes = nodes.next.next
        
        return "Odd" if odd > even else "Even" if odd < even else "Tie"
```

---

### Points Difference

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def gameResult(self, head: Optional[ListNode]) -> str:
        even = 0

        while head:
            if head.val < head.next.val:
                even -= 1
            else:
                even += 1
            head = head.next.next

        return "Even" if even > 0 else "Odd" if even < 0 else "Tie"
```

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def gameResult(self, head: Optional[ListNode]) -> str:
        curr, even = head, 0

        while curr:
            even += (curr.val > curr.next.val) - (curr.val < curr.next.val)
            curr = curr.next.next

        return "Even" if even > 0 else "Odd" if even < 0 else "Tie"
```
