## Template for ```Interval``` problems

### [56. Merge Intervals](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Leetcode/Leetcode%2075/Level%202/Day%2017%20-%20Interval/56.%20Merge%20Intervals)

```Python
class Solution:
    def merge(self, intervals: List[List[int]]) -> List[List[int]]:
        intervals.sort(key=lambda x:x[0])
        res = list()

        for interval in intervals:
            curr_lower, curr_upper = interval[0], interval[1]
            if not res or res[-1][1] < curr_lower:
                res.append(interval)
            else:
                res[-1][1] = max(res[-1][1], curr_upper)

        return res
```

### [57. Insert Interval](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Leetcode/Leetcode%2075/Level%202/Day%2017%20-%20Interval/57.%20Insert%20Interval)

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
