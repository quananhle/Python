## [57. Insert Interval](https://leetcode.com/problems/insert-interval)

```Tag```: ```Stack``` ```Binary Search```

#### Difficulty: Medium

You are given an array of non-overlapping intervals ```intervals``` where ```intervals[i]``` = [start<sub>i</sub>, end<sub>i</sub>] represent the start and the end of the i<sup>th</sup> interval and ```intervals``` is sorted in ascending order by start<sub>i</sub>. You are also given an interval ```newInterval = [start, end]``` that represents the start and end of another interval.

Insert ```newInterval``` into ```intervals``` such that ```intervals``` is still sorted in ascending order by start<sub>i</sub> and ```intervals``` still does not have any overlapping intervals (merge overlapping intervals if necessary).

Return _```intervals``` after the insertion_.

![image](https://github.com/quananhle/Python/assets/35042430/beff725b-5687-40ad-9a26-3d8585d0531a)

---

__Example 1:__
```
Input: intervals = [[1,3],[6,9]], newInterval = [2,5]
Output: [[1,5],[6,9]]
```

__Example 2:__
```
Input: intervals = [[1,2],[3,5],[6,7],[8,10],[12,16]], newInterval = [4,8]
Output: [[1,2],[3,10],[12,16]]
Explanation: Because the new interval [4,8] overlaps with [3,5],[6,7],[8,10].
```

__Constraints:__

- $0 \le intervals.length \le 10^4$
- $intervals[i].length == 2$
- $0 \le start_i \le end_i \le 10^5$
- ```intervals``` is sorted by $start_i$ in ascending order.
- $newInterval.length == 2$
- $0 \le start \le end \le 10^5$

---


```Python
class Solution:
    def insert(self, intervals: List[List[int]], newInterval: List[int]) -> List[List[int]]:
        res = list()
        new_start, new_end = newInterval[0], newInterval[1]
        for i in range(len(intervals)):
            start = intervals[i][0]
            end = intervals[i][1]
            # Check if the end of the new interval does not overlap the start of the intervals
            if new_end < start:
                res.append(newInterval)
                return res + intervals[i:]
            # Check if the start of the new interval does not overlap the end of the intervals
            elif new_start > end:
                res.append(intervals[i])
            else:
                # Update the boundary of the new interval if intervals overlapping
                new_start = min(start, new_start)
                new_end = max(end, new_end)
                newInterval = [new_start, new_end]
        res.append(newInterval)
        return res
```
