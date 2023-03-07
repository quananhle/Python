## [2187. Minimum Time to Complete Trips](https://leetcode.com/problems/minimum-time-to-complete-trips/)

```Tag```: ```Binary Search```

#### Difficulty: Medium

You are given an array time where ```time[i]``` denotes the time taken by the i<sup>th</sup> bus to complete __one trip__.

Each bus can make multiple trips __successively__; that is, the next trip can start __immediately after__ completing the current trip. Also, each bus operates __independently__; that is, the trips of one bus do not influence the trips of any other bus.

You are also given an integer ```totalTrips```, which denotes the number of trips all buses should make __in total__. Return _the __minimum time__ required for all buses to complete __at least__ ```totalTrips``` trips_.

![image](https://user-images.githubusercontent.com/35042430/223311330-9be12b5f-6290-480a-9e37-ba10f5c38b93.png)

---

__Example 1:__
```
Input: time = [1,2,3], totalTrips = 5
Output: 3
Explanation:
- At time t = 1, the number of trips completed by each bus are [1,0,0]. 
  The total number of trips completed is 1 + 0 + 0 = 1.
- At time t = 2, the number of trips completed by each bus are [2,1,0]. 
  The total number of trips completed is 2 + 1 + 0 = 3.
- At time t = 3, the number of trips completed by each bus are [3,1,1]. 
  The total number of trips completed is 3 + 1 + 1 = 5.
So the minimum time needed for all buses to complete at least 5 trips is 3.
```

__Example 2:__
```
Input: time = [2], totalTrips = 1
Output: 2
Explanation:
There is only one bus, and it will complete its first trip at t = 2.
So the minimum time needed to complete 1 trip is 2.
```

__Constraints:__

- 1 <= ```time.length``` <= 10<sup>5</sup>
- 1 <= ```time[i], totalTrips``` <= 10<sup>7</sup>

---

![image](https://leetcode.com/problems/minimum-time-to-complete-trips/Figures/2187/1.png)

Assume the time needed is ```given_time```, for bus ```i```, the number of trips it can finish within ```given_time``` is ```given_time / time[i]```. Thus the total number of trips is the sum of ```given_time / time[i]``` for all buses. In the following picture, we can tell that if the given time is ```6```, these buses can finish (at least) ```totalTrips``` in time.

![image](https://leetcode.com/problems/minimum-time-to-complete-trips/Figures/2187/2.png)

### Brute Force

```Python
class Solution:
    def minimumTime(self, time: List[int], totalTrips: int) -> int:
        for t in range(1, totalTrips * min(time) + 1):
            trips = sum([t // trip_time for trip_time in time])
            if trips >= totalTrips:
                return t
```

```Python
class Solution:
    def minimumTime(self, time: List[int], totalTrips: int) -> int:
        for t in range(1, totalTrips * min(time) + 1):
            trips = 0
            for trip_time in time:
                trips += t // trip_time
                if trips >= totalTrips:
                    return t
``

### Binary Search

```Python

```
