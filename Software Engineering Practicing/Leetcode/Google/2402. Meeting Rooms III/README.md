## [2402. Meeting Rooms III](https://leetcode.com/problems/meeting-rooms-iii)

```Tag```: ```Sorting``` ```Priority Queue```

#### Difficulty: Hard

You are given an integer ```n```. There are ```n``` rooms numbered from ```0``` to ```n - 1```.

You are given a 2D integer array ```meetings``` where $meetings[i] = [start_i, end_i]$ means that a meeting will be held during the half-closed time interval $[start_i, end_i)$. All the values of $start_i$ are unique.

Meetings are allocated to rooms in the following manner:

- Each meeting will take place in the unused room with the lowest number.
- If there are no available rooms, the meeting will be delayed until a room becomes free. The delayed meeting should have the same duration as the original meeting.
- When a room becomes unused, meetings that have an earlier original start time should be given the room.

Return _the number of the room that held the most meetings_. If there are multiple rooms, return _the room with the lowest number_.

A half-closed interval __[a, b)__ is the interval between __a__ and __b__ including __a__ and not including __b__.

![image](https://github.com/quananhle/Python/assets/35042430/f14a22b6-888d-4af4-a1bc-18d73f14d8af)

---

__Example 1:__
```
Input: n = 2, meetings = [[0,10],[1,5],[2,7],[3,4]]
Output: 0
Explanation:
- At time 0, both rooms are not being used. The first meeting starts in room 0.
- At time 1, only room 1 is not being used. The second meeting starts in room 1.
- At time 2, both rooms are being used. The third meeting is delayed.
- At time 3, both rooms are being used. The fourth meeting is delayed.
- At time 5, the meeting in room 1 finishes. The third meeting starts in room 1 for the time period [5,10).
- At time 10, the meetings in both rooms finish. The fourth meeting starts in room 0 for the time period [10,11).
Both rooms 0 and 1 held 2 meetings, so we return 0.
```

__Example 2:__
```
Input: n = 3, meetings = [[1,20],[2,10],[3,5],[4,9],[6,8]]
Output: 1
Explanation:
- At time 1, all three rooms are not being used. The first meeting starts in room 0.
- At time 2, rooms 1 and 2 are not being used. The second meeting starts in room 1.
- At time 3, only room 2 is not being used. The third meeting starts in room 2.
- At time 4, all three rooms are being used. The fourth meeting is delayed.
- At time 5, the meeting in room 2 finishes. The fourth meeting starts in room 2 for the time period [5,10).
- At time 6, all three rooms are being used. The fifth meeting is delayed.
- At time 10, the meetings in rooms 1 and 2 finish. The fifth meeting starts in room 1 for the time period [10,12).
Room 0 held 1 meeting while rooms 1 and 2 each held 2 meetings, so we return 1. 
```

__Constraints:__

- $1 \le n \le 100$
- $1 \le meetings.length \le 10^5$
- $meetings[i].length == 2$
- $0 \le start_i \lt end_i \le 5 * 10^5$
- All the values of $start_i$ are unique.

---

### Sorting

__Algorithm__

1. Initialize two arrays, ```room_in_use``` and ```meeting_cnt```, both of size ```n```, to keep track of the availability time for each room and the count of meetings held in each room, respectively.
2. Iterate through each meeting in the sorted order based on their start times:
    - For each meeting, find the earliest available room by iterating through the ```room_in_use``` array. If a room is available (its availability time is less than or equal to the current meeting's start time), allocate the meeting to that room, update the meeting count for that room, and set the room's availability time to the meeting's end time. Break out of the loop.
    - If no available room is found (i.e., ```available_unused_room``` is ```False```), find the room with the earliest availability time (```earliest_available_time```). Update the availability time for that room to accommodate the delayed meeting, and increment the meeting count for that room.
3. After processing all meetings, return the index of the room with the maximum meeting count using. If there are multiple rooms with the same maximum meeting count, return the room with the lowest index.

#### Complexity Analysis

- __Time Complexity__: $\mathcal{O}(M\cdot logM + M\cdot N)$
- __Space Complexity__: $\mathcal{O}(N + sort)$

```Python
class Solution:
    def mostBooked(self, n: int, meetings: List[List[int]]) -> int:
        # Keep track of room that is available for meeting
        room_in_use = [0] * n
        # Keep track of number of meetings held in each room
        meeting_cnt = [0] * n

        for start_time, end_time in sorted(meetings):
            earliest_available_time = math.inf
            available_unused_room = False
            earliest_available_room = 0

            for room_number in range(n):
                # Populate meetings into available rooms
                if room_in_use[room_number] <= start_time:
                    # Update end time in meeting room
                    room_in_use[room_number] = end_time
                    # Update number of meeting held in the room
                    meeting_cnt[room_number] += 1
                    available_unused_room = True
                    break
                if room_in_use[room_number] < earliest_available_time:
                    # Keep track of the earlist end time
                    earliest_available_time = room_in_use[room_number]
                    # Keep track of the earlist available room
                    earliest_available_room = room_number

            # When no room is available, find the earlist available room
            if not available_unused_room:
                room_in_use[earliest_available_room] += end_time - start_time
                meeting_cnt[earliest_available_room] += 1
            
        return meeting_cnt.index(max(meeting_cnt))
```

### Sorting, Counting using Priority Queues

```Python
class Solution:
    def mostBooked(self, n: int, meetings: List[List[int]]) -> int:
        unused_rooms, used_rooms = list(range(n)), []
        heapq.heapify(unused_rooms)
        meeting_count = [0] * n

        for start_time, end_time in meetings:
            # Check if meeting is finished, remove used room and make it available
            while used_rooms and used_rooms[0][0] <= start_time:
                _, room_number = heapq.heappop(used_rooms)
                heapq.heappush(unused_rooms, room_number)
            # Check if there are available rooms
            if unused_rooms:
                # Get the room with the smallest number
                room_number = heapq.heappop(unused_rooms)
                # Allocate the meeting and update the used room
                heapq.heappush(used_rooms, [end_time, room_number])
            # Otherwise, get the earliest available room to schedule the meeting
            else:
                earliest_available_time, room_number = heapq.heappop(used_rooms)
                # Update used room with new available time and room number
                heapq.heappush(used_rooms, [earliest_available_time + end_time - start_time, room_number])
            meeting_count[room_number] += 1
        
        return meeting_count.index(max(meeting_count))
```