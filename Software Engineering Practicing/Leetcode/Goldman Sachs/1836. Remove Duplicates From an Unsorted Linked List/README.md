## [1836. Remove Duplicates From an Unsorted Linked List](https://leetcode.com/problems/remove-duplicates-from-an-unsorted-linked-list/)

```Tag```: ```Linked List``` ```Stack``` ```Two Pointers```

#### Difficulty: Medium

Given the ```head``` of a linked list, find all the values that appear __more than once__ in the list and delete the nodes that have any of those values.

Return _the linked list after the deletions_.

![image](https://user-images.githubusercontent.com/35042430/228045740-2ab371e8-9bc5-4c3d-94bb-c510c3accc2f.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/04/21/tmp-linked-list.jpg)
```
Input: head = [1,2,3,2]
Output: [1,3]
Explanation: 2 appears twice in the linked list, so all 2's should be deleted. After deleting all 2's, we are left with [1,3].
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2021/04/21/tmp-linked-list-1.jpg)
```
Input: head = [2,1,1,2]
Output: []
Explanation: 2 and 1 both appear twice. All the elements should be deleted.
```

__Example 3:__

![image](https://assets.leetcode.com/uploads/2021/04/21/tmp-linked-list-2.jpg)
```
Input: head = [3,2,2,1,3,2,4]
Output: [1,4]
Explanation: 3 appears twice and 2 appears three times. After deleting all 3's and 2's, we are left with [1,4].
```

__Constraints:__

- The number of nodes in the list is in the range ```[1, 10^5]```
- ```1 <= Node.val <= 10^5```

---

