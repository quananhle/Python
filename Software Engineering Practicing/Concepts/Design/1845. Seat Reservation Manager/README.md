## [1845. Seat Reservation Manager](https://leetcode.com/problems/seat-reservation-manager)

```Tag```: ```Design``` ```Priority Queue``` ```Hash Set```

#### Difficulty: Medium

Design a system that manages the reservation state of ```n``` seats that are numbered from ```1``` to ```n```.

Implement the ```SeatManager``` class:

- ```SeatManager(int n)``` Initializes a ```SeatManager``` object that will manage ```n``` seats numbered from ```1``` to ```n```. All seats are initially available.
- ```int reserve()``` Fetches the smallest-numbered unreserved seat, reserves it, and returns its number.
- ```void unreserve(int seatNumber)``` Unreserves the seat with the given ```seatNumber```.

---

__Example 1:__
```
Input
["SeatManager", "reserve", "reserve", "unreserve", "reserve", "reserve", "reserve", "reserve", "unreserve"]
[[5], [], [], [2], [], [], [], [], [5]]
Output
[null, 1, 2, null, 2, 3, 4, 5, null]

Explanation
SeatManager seatManager = new SeatManager(5); // Initializes a SeatManager with 5 seats.
seatManager.reserve();    // All seats are available, so return the lowest numbered seat, which is 1.
seatManager.reserve();    // The available seats are [2,3,4,5], so return the lowest of them, which is 2.
seatManager.unreserve(2); // Unreserve seat 2, so now the available seats are [2,3,4,5].
seatManager.reserve();    // The available seats are [2,3,4,5], so return the lowest of them, which is 2.
seatManager.reserve();    // The available seats are [3,4,5], so return the lowest of them, which is 3.
seatManager.reserve();    // The available seats are [4,5], so return the lowest of them, which is 4.
seatManager.reserve();    // The only available seat is seat 5, so return 5.
seatManager.unreserve(5); // Unreserve seat 5, so now the available seats are [5].
```

__Constraints:__

- $1 \le n \le 10^5$
- $1 \le seatNumber \le n$
- For each call to ```reserve```, it is guaranteed that there will be at least one unreserved seat.
- For each call to ```unreserve```, it is guaranteed that ```seatNumber``` will be reserved.
- At most $10^5$ calls in total will be made to ```reserve``` and ```unreserve```.

---

### Priority Queue

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}((m + n) \cdot \log n)$. $m$ calls to ```reserve()``` or ```unreserve()```, and initializing the ```SeatManager``` take $\mathcal{O}(n \cdot \log n)$ for iterating through ```n``` seats and push into heap for $\mathcal{O}(\log n)$ time.
- __Space Complexity__: $\mathcal{O}(n)$

```Python
class SeatManager:

    def __init__(self, n: int):                                     # O(nlogn)
        self.available_seats = [i for i in range(1, n + 1)]

    def reserve(self) -> int:                                       # O(logn)
        seat = heapq.heappop(self.available_seats)
        return seat

    def unreserve(self, seatNumber: int) -> None:                   # O(logn)
        heapq.heappush(self.available_seats, seatNumber)

# Your SeatManager object will be instantiated and called as such:
# obj = SeatManager(n)
# param_1 = obj.reserve()
# obj.unreserve(seatNumber)
```


### Hash Set

```Python
class SeatManager:

    def __init__(self, n: int):
        self.seats = [i for i in range(1, n + 1)]
        self.curr_available = 0
        self.available = set()

    def reserve(self) -> int:
        if not self.available:
            self.curr_available += 1
            return self.curr_available

        for i, seat in enumerate(self.seats):
            if seat == 0:
                self.seats[i] = i + 1
                self.available.remove(i + 1)
                return i + 1

    def unreserve(self, seatNumber: int) -> None:
        self.seats[seatNumber - 1] = 0
        self.available.add(seatNumber)
```
