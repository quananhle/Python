## [2402. Meeting Rooms III](https://leetcode.com/problems/meeting-rooms-iii)

```Tag```:

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

