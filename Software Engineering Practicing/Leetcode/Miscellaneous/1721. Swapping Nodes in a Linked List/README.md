## [1721. Swapping Nodes in a Linked List](https://leetcode.com/problems/swapping-nodes-in-a-linked-list)

```Tag```: ```Linked List``` ```Two Pointers```

#### Difficulty: Medium

You are given the ```head``` of a linked list, and an integer ```k```.

Return _the ```head``` of the linked list after __swapping__ the values of the ```k```<sup>th</sup> node from the beginning and the ```k```<sup>th</sup> node from the end (the list is __1-indexed__)._

![image](https://github.com/quananhle/Python/assets/35042430/848daf51-cd81-46e5-93a6-728cfc2d65d8)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/09/21/linked1.jpg)
```
Input: head = [1,2,3,4,5], k = 2
Output: [1,4,3,2,5]
```

__Example 2:__
```
Input: head = [7,9,6,6,7,8,3,0,9,5], k = 5
Output: [7,9,6,6,8,7,3,0,9,5]
```

__Constraints:__

- The number of nodes in the list is ```n```.
- ```1 <= k <= n <= 10^5```
- ```0 <= Node.val <= 100```

---
