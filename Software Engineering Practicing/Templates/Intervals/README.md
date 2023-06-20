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

### [435. Non-overlapping Intervals](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Leetcode/Amazon/435.%20Non-overlapping%20Intervals)

Given an array of intervals ```intervals``` where ```intervals[i]``` = [start<sub>i</sub >, end<sub>i</sub>], return _the minimum number of intervals you need to remove to make the rest of the intervals non-overlapping_.


__Example:__
```
Input: intervals = [[1,2],[2,3],[3,4],[1,3]]
Output: 1
Explanation: [1,3] can be removed and the rest of the intervals are non-overlapping.
```

```Python

```
