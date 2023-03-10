## [92. Reverse Linked List II](https://leetcode.com/problems/reverse-linked-list-ii/)

```Tag```: ```Linked List```

#### Difficulty: Medium

Given the ```head``` of a singly linked list and two integers ```left``` and ```right``` where ```left <= right```, reverse the nodes of the list from position ```left``` to position ```right```, and return _the reversed list_.

![image](https://user-images.githubusercontent.com/35042430/223356659-b9f3fb4f-4f0f-4692-8e4b-bfdc0043a771.png)

---

__Example 1__:

![image](https://assets.leetcode.com/uploads/2021/02/19/rev2ex2.jpg)
```
Input: head = [1,2,3,4,5], left = 2, right = 4
Output: [1,4,3,2,5]
```

__Example 2:__
```
Input: head = [5], left = 1, right = 1
Output: [5]
```

__Constraints:__

- The number of nodes in the list is ```n```.
- ```1 <= n <= 500```
- ```-500 <= Node.val <= 500```
- ```1 <= left <= right <= n```
 
---

__Follow up__: Could you do it in one pass?
