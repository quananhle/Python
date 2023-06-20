## Intervals

### [56. Merge Intervals](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Leetcode/Leetcode%2075/Level%202/Day%2017%20-%20Interval/56.%20Merge%20Intervals)

Given an array of ```intervals``` where ```intervals[i]``` = [start<sub>i</sub>, end<sub>i</sub>], merge all overlapping intervals, and return _an array of the non-overlapping intervals that cover all the intervals in the input_.

__Example__:
```
Input: intervals = [[1,3],[2,6],[8,10],[15,18]]
Output: [[1,6],[8,10],[15,18]]
Explanation: Since intervals [1,3] and [2,6] overlap, merge them into [1,6].
```

```Python
class Solution:
    def merge(self, intervals: List[List[int]]) -> List[List[int]]:
        intervals.sort(key=lambda x:x[0])
        res = [[intervals[0][0], intervals[0][1]]]

        for next_start, next_end in intervals[1:]:

            prev_start, prev_end = res[-1][0], res[-1][1]

            if prev_end < next_start:
                res.append([next_start, next_end])
            else:
                res[-1] = [min(prev_start, next_start), max(prev_end, next_end)]

        return res
```

---

### [57. Insert Interval](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Leetcode/Leetcode%2075/Level%202/Day%2017%20-%20Interval/57.%20Insert%20Interval)

You are given an array of non-overlapping intervals ```intervals``` where ```intervals[i]``` = [start<sub>i</sub>, end<sub>i</sub>] represent the start and the end of the i<sup>th</sup> interval and intervals is sorted in ascending order by start<sub>i</sub>. You are also given an interval ```newInterval = [start, end]``` that represents the start and end of another interval.

Insert ```newInterval``` into ```intervals``` such that ```intervals``` is still sorted in ascending order by start<sub>i</sub> and ```intervals``` still does not have any overlapping intervals (merge overlapping intervals if necessary).

Return ```intervals``` after the insertion.

__Example:__
```
Input: intervals = [[1,3],[6,9]], newInterval = [2,5]
Output: [[1,5],[6,9]]
```

```Python
class Solution:
    def insert(self, intervals: List[List[int]], newInterval: List[int]) -> List[List[int]]:
        position = bisect.bisect(intervals, newInterval)
        intervals.insert(position, newInterval)
        res = list([intervals[0]])

        for next_start, next_end in intervals[1:]:

            prev_start, prev_end = res[-1][0], res[-1][1]

            if prev_end < next_start:
                res.append([next_start, next_end])
            else:
                res[-1] = [min(prev_start, next_start), max(prev_end, next_end)]

        return res
```

---

### [435. Non-overlapping Intervals](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Leetcode/Amazon/435.%20Non-overlapping%20Intervals)

Given an array of intervals ```intervals``` where ```intervals[i]``` = [start<sub>i</sub >, end<sub>i</sub>], return _the minimum number of intervals you need to remove to make the rest of the intervals non-overlapping_.


__Example:__
```
Input: intervals = [[1,2],[2,3],[3,4],[1,3]]
Output: 1
Explanation: [1,3] can be removed and the rest of the intervals are non-overlapping.
```

```Python
class Solution:
    def eraseOverlapIntervals(self, intervals: List[List[int]]) -> int:
        # Count overalapping intervals
        n = len(intervals)
        intervals.sort(key = lambda x:x[1])
        res = list([intervals[0]])

        for next_start, next_end in intervals[1:]:

            prev_start, prev_end = res[-1][0], res[-1][1]

            if prev_end <= next_start:
                res.append([next_start, next_end])

        return len(intervals) - len(res)
```

---

### [452. Minimum Number of Arrows to Burst Balloons](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Leetcode/Amazon/452.%20Minimum%20Number%20of%20Arrows%20to%20Burst%20Balloons)

__Example__:
```
Input: points = [[10,16],[2,8],[1,6],[7,12]]
Output: 2
Explanation: The balloons can be burst by 2 arrows:
- Shoot an arrow at x = 6, bursting the balloons [2,8] and [1,6].
- Shoot an arrow at x = 11, bursting the balloons [10,16] and [7,12].
```

```Python
class Solution:
    def findMinArrowShots(self, points: List[List[int]]) -> int:
        n = len(points)
        points.sort(key = lambda x:x[1])
        prev_start, prev_end = points[0][0], points[0][1]
        count = 1

        for next_start, next_end in points[1:]:
            if prev_end < next_start:
                count += 1
                prev_end = next_end
        
        return count
```
