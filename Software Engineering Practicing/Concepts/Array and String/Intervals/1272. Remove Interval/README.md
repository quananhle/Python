## [1272. Remove Interval](https://leetcode.com/problems/remove-interval)

```Tag```:

#### Difficulty: Medium

A set of real numbers can be represented as the union of several disjoint intervals, where each interval is in the form ```[a, b)```. A real number ```x``` is in the set if one of its intervals ```[a, b)``` contains ```x``` (i.e. $a \le x \lt b$).

You are given a sorted list of disjoint intervals ```intervals``` representing a set of real numbers as described above, where $intervals[i] = [a_i, b_i]$ represents the interval $[a_i, b_i)$. You are also given another interval ```toBeRemoved```.

Return _the set of real numbers with the interval ```toBeRemoved``` removed from ```intervals```_. In other words, return _the set of real numbers such that every ```x``` in the set is in ```intervals``` but not in ```toBeRemoved```. Your answer should be a sorted list of disjoint intervals as described above.

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/12/24/removeintervalex1.png)
```
Input: intervals = [[0,2],[3,4],[5,7]], toBeRemoved = [1,6]
Output: [[0,1],[6,7]]
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2020/12/24/removeintervalex2.png)
```
Input: intervals = [[0,5]], toBeRemoved = [2,3]
Output: [[0,2],[3,5]]
```

__Example 3:__
```
Input: intervals = [[-5,-4],[-3,-2],[1,2],[3,5],[8,9]], toBeRemoved = [-1,4]
Output: [[-5,-4],[-3,-2],[4,5],[8,9]]
```

__Constraints:__

- $1 \le intervals.length \le 10^4$
- $-10^9 \le a_i \lt bi \le 10^9$

---
