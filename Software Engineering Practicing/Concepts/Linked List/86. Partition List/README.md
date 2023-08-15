## [86. Partition List](https://leetcode.com/problems/partition-list/)

```Tag```: ```Linked List```

#### Difficulty: Medium

Given the ```head``` of a linked list and a value ```x```, partition it such that all nodes __less than__ ```x``` come before nodes __greater than or equal to__ ```x```.

You should preserve the original relative order of the nodes in each of the two partitions.

![image](https://github.com/quananhle/Python/assets/35042430/3b810ef5-c261-4095-841a-6d132408ec0d)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/01/04/partition.jpg)
```
Input: head = [1,4,3,2,5,2], x = 3
Output: [1,2,2,4,3,5]
```

__Example 2:__
```
Input: head = [2,1], x = 2
Output: [1,2]
```

__Constraints:__

- The number of nodes in the list is in the range ```[0, 200]```.
- $-100 \le Node.val \le 100$
- $-200 \le x \le 200$

---

