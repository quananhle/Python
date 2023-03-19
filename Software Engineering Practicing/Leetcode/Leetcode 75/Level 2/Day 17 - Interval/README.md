## Template for Interval problems

### 56. Merge Intervals

```Python
class Solution:
    def merge(self, intervals: List[List[int]]) -> List[List[int]]:
        intervals.sort(key=lambda x:x[0])
        res = list()
        for interval in intervals:
            if not res or res[-1][1] < interval[0]:
                res.append(interval)
            else:
                res[-1][1] = max(res[-1][1], interval[1])
        return res
```

### 57. Insert Interval

```Python
class Solution:
    def insert(self, intervals: List[List[int]], newInterval: List[int]) -> List[List[int]]:
        # Search for position to insert new interval
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
