## [1272. Remove Interval](https://leetcode.com/problems/remove-interval)

```Tag```: ```Greedy Algorithm```

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

### Sweep Line

Sweep Line algorithm is a sort of geometrical visualization. Let's imagine a vertical line that is swept across the plane, stopping at some points. That could create various situations, and the decision to make depends on the stop point.

![image](https://leetcode.com/problems/remove-interval/Figures/1272/sweep2.png)

__Algorithm__

Let's sweep the line by iterating over input intervals and consider what it could bring to us.

- Current interval has no overlaps with ```toBeRemoved``` one. That means there is nothing to take care of, just update the output.

![image](https://leetcode.com/problems/remove-interval/Figures/1272/no_overlaps.png)

- The second situation is when ```toBeRemoved``` interval is inside of the current interval. Then one has to add two non-overlapping parts of the current interval in the output.

![image](https://leetcode.com/problems/remove-interval/Figures/1272/inside2.png)

- "Left" overlap.

![image](https://leetcode.com/problems/remove-interval/Figures/1272/left_overlap.png)

- "Right" overlap.

![image](https://leetcode.com/problems/remove-interval/Figures/1272/right_overlap.png)

```Python
class Solution:
    def removeInterval(self, intervals: List[List[int]], toBeRemoved: List[int]) -> List[List[int]]:
        removed_start, removed_end = toBeRemoved
        res = list()

        for curr_start, curr_end in intervals:
            # If there are no overlaps, add the interval to the list as is.
            if curr_start > removed_end or curr_end < removed_start:
                res.append([curr_start, curr_end])
            else:
                # Is there a left interval we need to keep?
                if curr_start < removed_start:
                    res.append([curr_start, removed_start])
                # Is there a right interval we need to keep?
                if removed_end < curr_end:
                    res.append([removed_end, curr_end])

        return res
```

```Python
class Solution:
    def removeInterval(self, intervals: List[List[int]], toBeRemoved: List[int]) -> List[List[int]]:
        out_bound_start, out_bound_end = toBeRemoved
        res = list()

        for curr_start, curr_end in intervals:
            if curr_start < out_bound_start:
                res.append([curr_start, min(curr_end, out_bound_start)])
            if out_bound_end < curr_end:
                res.append([max(curr_start, out_bound_end), curr_end])

        return res
```
