## [1751. Maximum Number of Events That Can Be Attended II](https://leetcode.com/problems/maximum-number-of-events-that-can-be-attended-ii/)

```Tag```: ```Dynamic Programming``` ```Binary Search```

#### Difficulty: Hard

You are given an array of events where ```events[i] = [startDayi, endDayi, valuei]```. The i<sup>th</sup> event starts at startDay<sub>i</sub> and ends at endDay<sub>i</sub>, and if you attend this event, you will receive a value of value<sub>i</sub>. You are also given an integer ```k``` which represents the maximum number of events you can attend.

You can only attend one event at a time. If you choose to attend an event, you must attend the entire event. Note that the end day is inclusive: that is, you cannot attend two events where one of them starts and the other ends on the same day.

Return the maximum sum of values that you can receive by attending events.

![image](https://github.com/quananhle/Python/assets/35042430/248cee25-a729-464b-8239-4ce94e79f93f)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/01/10/screenshot-2021-01-11-at-60048-pm.png)

```
Input: events = [[1,2,4],[3,4,3],[2,3,1]], k = 2
Output: 7
Explanation: Choose the green events, 0 and 1 (0-indexed) for a total value of 4 + 3 = 7.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2021/01/10/screenshot-2021-01-11-at-60150-pm.png)

```
Input: events = [[1,2,4],[3,4,3],[2,3,10]], k = 2
Output: 10
Explanation: Choose event 2 for a total value of 10.
Notice that you cannot attend any other event as they overlap, and that you do not have to attend k events.
```

__Example 3:__

![image](https://assets.leetcode.com/uploads/2021/01/10/screenshot-2021-01-11-at-60703-pm.png)
```
Input: events = [[1,1,1],[2,2,2],[3,3,3],[4,4,4]], k = 3
Output: 9
Explanation: Although the events do not overlap, you can only attend 3 events. Pick the highest valued three.
```

__Constraints:__

- $1 <= k <= events.length$
- $1 <= k * events.length <= 10^{6}$
- $1 <= startDayi <= endDayi <= 10^{9}$
- $1 <= valuei <= 10^{6}$

---

![image](https://leetcode.com/problems/maximum-number-of-events-that-can-be-attended-ii/Figures/1751/b1.png)

### The Framework

#### Top-Down Dynamic Programming

![image](https://leetcode.com/problems/maximum-number-of-events-that-can-be-attended-ii/Figures/1751/3.png)

![image](https://leetcode.com/problems/maximum-number-of-events-that-can-be-attended-ii/Figures/1751/4.png)

![image](https://leetcode.com/problems/maximum-number-of-events-that-can-be-attended-ii/Figures/1751/5.png)


Complexity Analysis

- __Time Complexity__: $\mathcal{O}(n⋅(k+log⁡n))$
- __Space Complexity__: $\mathcal{O}(n \cdot k)$

```Python
class Solution:
    def maxValue(self, events: List[List[int]], k: int) -> int:
        n = len(events)
        events.sort()

        @lru_cache(None)
        def dp(curr, count, prev_end):
            # Base case
            if curr == n or count == k:
                return 0
            
            curr_start, curr_end, curr_value = events[curr][0], events[curr][1], events[curr][2]

            # Recurrence relation: skip or attend the current meeting

            # Skip if time conflict due to inclusive end day, cannot attend current event, move to another event
            skip = dp(curr + 1, count, prev_end)
            if curr_start <= prev_end:
                return skip

            take = dp(curr + 1, count + 1, curr_end)
            ans = max(skip, take + curr_value)
            return ans
        
        return dp(0, 0, -1)
```
