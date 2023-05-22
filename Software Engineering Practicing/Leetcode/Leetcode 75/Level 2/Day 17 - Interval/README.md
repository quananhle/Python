## Template for ```Interval``` problems

### [56. Merge Intervals](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Leetcode/Leetcode%2075/Level%202/Day%2017%20-%20Interval/56.%20Merge%20Intervals)

```Python
class Solution:
    def merge(self, intervals: List[List[int]]) -> List[List[int]]:
        intervals.sort(key=lambda x:x[0])
        res = list()

        for curr_lower, curr_upper in intervals:
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
        for curr_lower, curr_upper in intervals:
            if not res or res[-1][1] < curr_lower:
                res.append(interval)
            else:
                res[-1][1] = max(res[-1][1], curr_upper)

        return res
```

### [253. Meeting Rooms II](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Leetcode/Bloomberg/253.%20Meeting%20Rooms%20II)

Given an array of meeting time intervals ```intervals``` where ```intervals[i]``` = [```start```<sub>i</sub>, ```end```<sub>i</sub>], return _the minimum number of conference rooms __required___. 

__Example__:
```
Input: intervals = [[0,30],[5,10],[15,20]]
Output: 2
```

```Python
class Solution:
    def minMeetingRooms(self, intervals: List[List[int]]) -> int:
        schedule = list()
        ans = curr = 0
        for start, end in intervals:
            schedule.append((start, "Start", 1))
            schedule.append((end, "Finish", -1))
            
        schedule.sort()
        for meeting in schedule:
            curr += meeting[2]
            ans = max(ans, curr)

        return ans
```
