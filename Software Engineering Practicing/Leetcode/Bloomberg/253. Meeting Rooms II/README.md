## [253. Meeting Rooms II](https://leetcode.com/problems/meeting-rooms-ii/)

```Tag```: ```Sorting``` ```Priority Queue``` ```Chronological Ordering```

#### Difficulty: Medium

Given an array of meeting time intervals ```intervals``` where ```intervals[i]``` = [start<sub>i</sub>, end<sub>i</sub>], return _the minimum number of conference rooms required_.

![image](https://user-images.githubusercontent.com/35042430/228691703-a3c42cd9-e8f6-48e5-bfb0-59cbbf0be49a.png)

---

__Example 1:__
```
Input: intervals = [[0,30],[5,10],[15,20]]
Output: 2
```

__Example 2:__
```
Input: intervals = [[7,10],[2,4]]
Output: 1
```

__Constraints:__

- ```1 <= intervals.length <= 10^4```
- ```0 <= starti < endi <= 10^6```

---

```Python
class Solution:
    def minMeetingRooms(self, intervals: List[List[int]]) -> int:
        curr = ans = 0
        schedule = list()

        for interval in intervals:
            curr_lower, curr_upper = interval[0], interval[1]
            schedule.append((curr_lower, "start" , 1))
            schedule.append((curr_upper, "finish",-1))
        
        schedule.sort()

        for overlapping in schedule:
            # Keep track of the ongoing meetings
            curr += overlapping[2]
            # Record the most meetings happening at the same time 
            ans = max(ans, curr)
        
        return ans
```

### Priority Queue

![image](https://leetcode.com/problems/meeting-rooms-ii/Figures/253/253_Meeting_Rooms_II_Diag_1.png)

![image](https://leetcode.com/problems/meeting-rooms-ii/Figures/253/253_Meeting_Rooms_II_Diag_2.png)

__Algorithm__

1. Sort the given ```meetings``` by their start time.
2. Initialize a new min-heap and add the first meeting's ending time to the heap. We simply need to keep track of the ending times as that tells us when a meeting room will get free.
3. For every meeting room check if the minimum element of the heap i.e. the room at the top of the heap is free or not.
4. If the room is free, then we extract the topmost element and add it back with the ending time of the current meeting we are processing.
5. If not, then we allocate a new room and add it to the heap.
6. After processing all the meetings, the size of the heap will tell us the number of rooms allocated. This will be the minimum number of rooms needed to accommodate all the meetings.

```Python
class Solution:
    def minMeetingRooms(self, intervals: List[List[int]]) -> int:
        if not intervals:
            return 0
        
        free_rooms = list()
        intervals.sort(key=lambda x: x[0])

        # Add the first meeting and record its finish time
        heapq.heappush(free_rooms, intervals[0][1])

        for interval in intervals[1:]:
            next_meeting_start, next_meeting_end = interval[0], interval[1]
            # Check if the meeting ended before the start of the next meeting
            if free_rooms[0] <= next_meeting_start:
                heapq.heappop(free_rooms)
            # Add the current meeting to the schedule
            heapq.heappush(free_rooms, next_meeting_end)

        return len(free_rooms)
```
 
### Chronological Ordering

![image](https://leetcode.com/problems/meeting-rooms-ii/Figures/253/253_Meeting_Rooms_II_Diag_3.png)

![image](https://leetcode.com/problems/meeting-rooms-ii/Figures/253/253_Meeting_Rooms_II_Diag_4.png)

![image](https://leetcode.com/problems/meeting-rooms-ii/Figures/253/253_Meeting_Rooms_II_Diag_5.png)



```Python
class Solution:
    def minMeetingRooms(self, intervals: List[List[int]]) -> int:
        if not intervals:
            return 0

        ans = 0
        n = len(intervals)

        start_time = sorted([interval[0] for interval in intervals])
        finish_time = sorted([interval[1] for interval in intervals])

        s = e = 0

        while s < n:
            # Check if a meeting ends before the starting time of another meeting
            if finish_time[e] <= start_time[s]:
                # Free up the room and check the finishing time of the next meeting
                ans -= 1
                e += 1

            # If a room got free, then this rooms needed += 1 wouldn't have any effect, rooms needed remain the same in that case. 
            # If no room was free, then this would increase rooms needed
            ans += 1
            s += 1
        
        return ans
```
