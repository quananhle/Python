## [57. Insert Interval](https://leetcode.com/problems/insert-interval/)

```Tag```: ```Binary Search``` ```Array & String```

#### Difficulty: Medium

You are given an array of non-overlapping intervals ```intervals``` where ```intervals[i]``` = [start<sub>i</sub>, end<sub>i</sub>] represent the start and the end of the i<sup>th</sup> interval and intervals is sorted in ascending order by start<sub>i</sub>. You are also given an interval ```newInterval = [start, end]``` that represents the start and end of another interval.

Insert ```newInterval``` into ```intervals``` such that ```intervals``` is still sorted in ascending order by start<sub>i</sub> and ```intervals``` still does not have any overlapping intervals (merge overlapping intervals if necessary).

Return ```intervals``` after the insertion.

![image](https://github.com/quananhle/Python/assets/35042430/96fba50a-2681-496c-94c8-b759d05a3a45)

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

### Linear Search

- __Time complexity__: ```O(N)```.
- __Space complexity__: ```O(1)```.

```Python
class Solution:
    def insert(self, intervals: List[List[int]], newInterval: List[int]) -> List[List[int]]:
        res = list()
        new_start, new_end = newInterval[0], newInterval[1]

        if not intervals:
            return [newInterval]
        # Check if the upper boundary of the new interval smaller than the lower boundary of the first interval
        if intervals[0][0] > new_end:
            return [newInterval] + intervals                # [[3,5],[6,9]], [0,2] -> [[0,2],[3,5],[6,9]]
        # Check if the lower boundary of the new inteval greater than the upper boundary of the last interval
        elif intervals[-1][1] < new_start:
            intervals.append(newInterval)
            return intervals                                # [[1,3],[6,9]], [10,12] -> [[1,3],[6,9],[10,12]]
        # Otherwise, the new interval is within the range of intervals
        else:
            for i in range(len(intervals)):
                curr_lower = intervals[i][0]
                curr_upper = intervals[i][1]
                # 3 scenarios: - The lower boundary of the new interval is greater than the upper boundary of the current interval
                #              - The upper boundary of the new interval is smaller than the lower boundary of the current interval
                #              - Both boundaries of the new interval is within the range of the current interval
                if new_start > curr_upper:
                    res.append(intervals[i])
                elif new_end < curr_lower:                  # [[1,3],[6,9]], [4,5] -> [[1,3],[4,5],[6,9]]
                    res.append([new_start, new_end])
                    return res + intervals[i:]
                # Otherwise, the new interval overlaps
                else:                                       # [[1,5],[6,9]], [2,4] -> [[2,4],[6,9]]
                    # Update new start and new end:
                    new_start, new_end = min(new_start, curr_lower), max(new_end, curr_upper)   
            res.append([new_start, new_end])                # [[1,5]], [2,3] -> [[1,5]]
            return res
```

```Python
class Solution:
    def insert(self, intervals: List[List[int]], newInterval: List[int]) -> List[List[int]]:
        res = list()
        new_start, new_end = newInterval[0], newInterval[1]

        for i in range(len(intervals)):
            curr_lower = intervals[i][0]
            curr_upper = intervals[i][1]
            if new_start > curr_upper:
                res.append(intervals[i])
            elif new_end < curr_lower:
                res.append([new_start, new_end])
                return res + intervals[i:]
            else:
                new_start, new_end = min(new_start, curr_lower), max(new_end, curr_upper)   
        res.append([new_start, new_end])

        return res
```

```Python
class Solution:
    def insert(self, intervals: List[List[int]], newInterval: List[int]) -> List[List[int]]:
        n = len(intervals)
        i = 0
        new_start, new_end = newInterval[0], newInterval[1]
        res = list()

        # Insert non-overlapping intervals before newInterval to res
        while i < n and intervals[i][1] < new_start:
            res.append(intervals[i])
            i += 1

        # Merge overlapping intervals with newInterval
        res.append(newInterval)
        while i < n and max(res[-1][0], intervals[i][0]) <= min(res[-1][1], intervals[i][1]):
            res[-1] = min(res[-1][0], intervals[i][0]), max(res[-1][1], intervals[i][1])
            i += 1

        # Insert the rest of the non-overlapping intervals to res
        res.extend(intervals[i:])

        return res
```

### Binary Search

- __Time complexity__: ```O(N)```.
- __Space complexity__: ```O(1)```.

```Python
class Solution:
    def insert(self, intervals: List[List[int]], newInterval: List[int]) -> List[List[int]]:
        def binary_search(intervals):
            lo, hi = 0, len(intervals)
            while lo < hi:
                mi = lo + (hi - lo) // 2
                
                if newInterval[0] <= intervals[mi][0]:
                    hi = mi
                else:
                    lo = mi + 1
                
            return lo

        position = binary_search(intervals)
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

```Python
class Solution:
    def insert(self, intervals: List[List[int]], newInterval: List[int]) -> List[List[int]]:
        # Search for position to insert new interval
        '''
        position = bisect.bisect_left(intervals, newInterval)
        '''
        '''
        position = bisect.bisect_right(intervals, newInterval)
        '''
        position = bisect.bisect(intervals, newInterval)
        intervals.insert(position, newInterval)
        res = list()

        # Merge intervals
        for interval in intervals:
            curr_lower, curr_upper = interval[0], interval[1]
            if not res or res[-1][1] < curr_lower:
                res.append(interval)
            else:
                res[-1][1] = max(res[-1][1], curr_upper)

        return res
```
