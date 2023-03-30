## [252. Meeting Rooms](https://leetcode.com/problems/meeting-rooms/)

```Tag```: ```Sorting```

#### Difficulty: Easy

Given an array of meeting time ```intervals``` where ```intervals[i]``` = [start<sub>i</sub>, end<sub>i</sub>], determine if a person could attend all meetings.

![image](https://user-images.githubusercontent.com/35042430/228959627-cfcdd83b-abd7-4e53-9b62-fcc7ba4a35a1.png)

---

__Example 1:__
```
Input: intervals = [[0,30],[5,10],[15,20]]
Output: false
```

__Example 2:__
```
Input: intervals = [[7,10],[2,4]]
Output: true
```

__Constraints:__

- ```0 <= intervals.length <= 10^4```
- ```intervals[i].length == 2```
- ```0 <= starti < endi <= 10^6```

---

### Sorting

```Python
class Solution:
    def canAttendMeetings(self, intervals: List[List[int]]) -> bool:
        if not intervals:
            return True

        intervals.sort(key=lambda x:x[0])
        curr_lower, curr_upper = intervals[0][0], intervals[0][1]
        
        for interval in intervals[1:]:
            next_lower, next_upper = interval[0], interval[1]
            if next_lower < curr_upper:
                return False
            curr_lower, curr_upper = next_lower, next_upper

        return True 
```

```Python
class Solution:
    def canAttendMeetings(self, intervals: List[List[int]]) -> bool:
        schedule = list()
        if not intervals:
            return True
        
        intervals.sort(key=lambda x:x[0])

        for interval in intervals:
            curr_lower, curr_upper = interval[0], interval[1]
            # Check if attended any meeting
            if not schedule:
                schedule.append([curr_lower, curr_upper])
            # Otherwise, check if there is schedule conflict
            else:
                last_lower, last_upper = schedule[-1][0], schedule[-1][1]
                # Attend the meetings that have no schedule conflict
                if last_upper <= curr_lower:
                    schedule.append([curr_lower, curr_upper])

        return len(schedule) == len(intervals)
```

```Python
class Solution:
    def canAttendMeetings(self, intervals: List[List[int]]) -> bool:
        schedule = list()
        if not intervals:
            return True

        for interval in intervals:
            curr_lower, curr_upper = interval[0], interval[1]
            schedule.append((curr_lower, 1))    # Start
            schedule.append((curr_upper,-1))    # Finish

        schedule.sort()
        attend = 0

        # Ccheck if have to attend more than 1 meeting at the same time
        for meeting in schedule:
            if attend > 1:
                return False
            attend += meeting[1]

        return True
```
