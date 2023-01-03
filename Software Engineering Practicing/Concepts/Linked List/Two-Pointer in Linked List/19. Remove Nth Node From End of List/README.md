## 19. Remove Nth Node From End of List

```Tag```: ```Linked List```

#### Difficulty: Medium

Given the ```head``` of a linked list, remove the n<sup>th</sup> node from the end of the list and return its head.

![image](https://user-images.githubusercontent.com/35042430/210295310-f960ddce-005e-4044-9f32-d223c0dd37e3.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/10/03/remove_ex1.jpg)
```
Input: head = [1,2,3,4,5], n = 2
Output: [1,2,3,5]
```

__Example 2:__
```
Input: head = [1], n = 1
Output: []
```

__Example 3:__
```
Input: head = [1,2], n = 1
Output: [1]
```

__Constraints:__
```
The number of nodes in the list is sz.
1 <= sz <= 30
0 <= Node.val <= 100
1 <= n <= sz
```

---

__Follow up__: Could you do this in one pass?
