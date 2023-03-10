## [382. Linked List Random Node](https://leetcode.com/problems/linked-list-random-node/)

```Tag```: ```Linked List``` ```Design``` ```Algorithm R```

#### Difficulty: Medium

Given a singly linked list, return a random node's value from the linked list. Each node must have the same probability of being chosen.

Implement the ```Solution``` class:

- ```Solution(ListNode head)``` Initializes the object with the head of the singly-linked list ```head```.
- ```int getRandom()``` Chooses a node randomly from the list and returns its value. All the nodes of the list should be equally likely to be chosen.
 
![image](https://user-images.githubusercontent.com/35042430/224371475-c4938810-d280-4981-8643-cdfd0b4f5140.png)

---

__Example 1__:

![image](https://assets.leetcode.com/uploads/2021/03/16/getrand-linked-list.jpg)
```
Input
["Solution", "getRandom", "getRandom", "getRandom", "getRandom", "getRandom"]
[[[1, 2, 3]], [], [], [], [], []]
Output
[null, 1, 3, 2, 2, 3]

Explanation
Solution solution = new Solution([1, 2, 3]);
solution.getRandom(); // return 1
solution.getRandom(); // return 3
solution.getRandom(); // return 2
solution.getRandom(); // return 2
solution.getRandom(); // return 3
// getRandom() should return either 1, 2, or 3 randomly. Each element should have equal probability of returning.
```

__Constraints:__

- The number of nodes in the linked list will be in the range [1, 10<sup>4</sup>].
- -10<sup>4</sup> <= ```Node.val``` <= 10<sup>4</sup>
- At most 10<sup>4</sup> calls will be made to ```getRandom```.
 
---

### Stack

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:

    def __init__(self, head: Optional[ListNode]):
        self.stack = list()
        while head:
            self.stack.append(head.val)
            head = head.next

    def getRandom(self) -> int:
        '''
        k = int(random.random() * len(self.stack))
        '''
        k = random.randint(0, len(self.stack) - 1)
        return self.stack[k]


# Your Solution object will be instantiated and called as such:
# obj = Solution(head)
# param_1 = obj.getRandom()
```

__Follow up__:

- What if the linked list is extremely large and its length is unknown to you

In order to do random sampling over a population of __unknown size__ with __constant space__, the answer is __reservoir sampling__. As one will see later, it is an elegant algorithm that can address the two caveats of the previous approach.

    The reservoir sampling algorithm is intended to sample k elements from an population of unknown size. In our case, the k happens to be one.

```
# S has items to sample, R will contain the result
def ReservoirSample(S[1..n], R[1..k])
  # fill the reservoir array
  for i := 1 to k
      R[i] := S[i]

  # replace elements with gradually decreasing probability
  for i := k+1 to n
    # randomInteger(a, b) generates a uniform integer
    #   from the inclusive range {a, ..., b} *)
    j := randomInteger(1, i)
    if j <= k
        R[j] := S[i]
```

![image](https://leetcode.com/problems/linked-list-random-node/Figures/382/382_reservoir_sampling.png)

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:

    def __init__(self, head: Optional[ListNode]):
        self.head = head

    def getRandom(self) -> int:
        scope = 1
        ans = 0
        curr = self.head

        while curr:
            if random.random() < 1 / scope:
                ans = curr.val
            curr = curr.next
            scope += 1
        
        return ans


# Your Solution object will be instantiated and called as such:
# obj = Solution(head)
# param_1 = obj.getRandom()
```

- Could you solve this efficiently without using extra space?

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:

    def __init__(self, head: Optional[ListNode]):
        self.node = curr = head
        self.count = 0

        while curr:
            self.count += 1
            curr = curr.next

    def getRandom(self) -> int:
        curr = self.node
        k = random.randint(0, self.count - 1)
        while k:
            curr = curr.next
            k -= 1
        return curr.val


# Your Solution object will be instantiated and called as such:
# obj = Solution(head)
# param_1 = obj.getRandom()
```
