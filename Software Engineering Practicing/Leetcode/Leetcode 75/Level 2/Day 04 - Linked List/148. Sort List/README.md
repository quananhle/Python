## [148. Sort List](https://leetcode.com/problems/sort-list/)

```Tag```: ```Two Pointers``` ```Stack``` ```Linked List```

#### Difficulty: Medium

Given the ```head``` of a linked list, return _the list after sorting it in __ascending order___.

![image](https://user-images.githubusercontent.com/35042430/222935430-ccdef565-bfa0-40ab-ab35-e7e07d41bc99.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/09/14/sort_list_1.jpg)
```
Input: head = [4,2,1,3]
Output: [1,2,3,4]
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2020/09/14/sort_list_2.jpg)
```
Input: head = [-1,5,3,4,0]
Output: [-1,0,3,4,5]
```

__Example 3:__
```
Input: head = []
Output: []
```

__Constraints:__

- The number of nodes in the list is in the range [0, 5 * 10<sup>4</sup>].
- -10<sup>5</sup> <= Node.val <= 10<sup>5</sup>
 
---


__Follow up__: Can you sort the linked list in ```O(n logn)``` time and ```O(1)``` memory (i.e. constant space)?
