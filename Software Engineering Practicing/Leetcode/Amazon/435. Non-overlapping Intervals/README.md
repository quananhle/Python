## [435. Non-overlapping Intervals](https://leetcode.com/problems/non-overlapping-intervals)

```Tag```: ```Greedy Algorithms```

#### Difficulty: Medium

Given an array of intervals ```intervals``` where ```intervals[i]``` = [start<sub>i</sub >, end<sub>i</sub>], return _the minimum number of intervals you need to remove to make the rest of the intervals non-overlapping_.

![image](https://user-images.githubusercontent.com/35042430/210716590-f53a7d83-1494-44cd-9f0b-43fce7e48264.png)

---

__Example 1:__
```
Input: intervals = [[1,2],[2,3],[3,4],[1,3]]
Output: 1
Explanation: [1,3] can be removed and the rest of the intervals are non-overlapping.
```

__Example 2:__
```
Input: intervals = [[1,2],[1,2],[1,2]]
Output: 2
Explanation: You need to remove two [1,2] to make the rest of the intervals non-overlapping.
```

__Example 3:__
```
Input: intervals = [[1,2],[2,3]]
Output: 0
Explanation: You don't need to remove any of the intervals since they're already non-overlapping.
```

__Constraints:__

- $1  \le intervals.length \le 10^{5}$
- $intervals[i].length == 2$
- $-5 * 10^{4} \le start_{i} < end_{i} \le 5 * 10^{4}$

---

```Python
class Solution:
    def eraseOverlapIntervals(self, intervals: List[List[int]]) -> int:
        # Greedy Algorithms
        ### Find all the overlapping ranges: check if the end point of an interval overlapped the start point of other interval
        if not intervals:
            return 0
        # Sort the intervals by the end point
        intervals.sort(key= lambda x : x[1])
        # Pick the first overlapping intervals
        count = 0
        pivot_end = intervals[0][1]
        for start, end in intervals[1:]:
            # Check if end point of an interval does not overlap the start point of other interval
            if pivot_end <= start:
                pivot_end = end
            # If overlapping, delete interval
            else:
                count += 1
        return count
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
