## [2130. Maximum Twin Sum of a Linked List](https://leetcode.com/problems/maximum-twin-sum-of-a-linked-list)

```Tag```: ```Linked List``` ```Two Pointers```

#### Difficulty: Medium

In a linked list of size ```n```, where ```n``` is even, the i<sup>th</sup> node (__0-indexed__) of the linked list is known as the twin of the (n-1-i)<sup>th</sup> node, if ```0 <= i <= (n / 2) - 1```.

For example, if ```n = 4```, then node ```0``` is the twin of node ```3```, and node ```1``` is the twin of node ```2```. These are the only nodes with twins for ```n = 4```.
The __twin sum__ is defined as the sum of a node and its twin.

Given the ```head``` of a linked list with even length, return _the maximum twin sum of the linked list_.

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
