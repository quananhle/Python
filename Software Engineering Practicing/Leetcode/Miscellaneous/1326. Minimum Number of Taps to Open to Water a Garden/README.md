## [1326. Minimum Number of Taps to Open to Water a Garden](https://leetcode.com/problems/minimum-number-of-taps-to-open-to-water-a-garden/)

```Tag```: ```Greedy``` ```Dynamic Programming```

#### Difficulty: Hard

There is a one-dimensional garden on the x-axis. The garden starts at the point ```0``` and ends at the point ```n```. (i.e The length of the garden is ```n```).

There are ```n + 1``` taps located at points ```[0, 1, ..., n]``` in the garden.

Given an integer ```n``` and an integer array ranges of length ```n + 1``` where ```ranges[i]``` (0-indexed) means the ```i-th``` tap can water the area ```[i - ranges[i], i + ranges[i]]``` if it was open.

Return _the minimum number of taps that should be open to water the whole garden, If the garden cannot be watered return ```-1```_.

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/01/16/1685_example_1.png)

```
Input: n = 5, ranges = [3,4,1,1,0,0]
Output: 1
Explanation: The tap at point 0 can cover the interval [-3,3]
The tap at point 1 can cover the interval [-3,5]
The tap at point 2 can cover the interval [1,3]
The tap at point 3 can cover the interval [2,4]
The tap at point 4 can cover the interval [4,4]
The tap at point 5 can cover the interval [5,5]
Opening Only the second tap will water the whole garden [0,5]
```

__Example 2:__
```
Input: n = 3, ranges = [0,0,0,0]
Output: -1
Explanation: Even if you activate all the four taps you cannot water the whole garden.
```

__Constraints:__

- $1 \le n \le 10^{4}
- $ranges.length == n + 1$
- $0 \le ranges[i] \le 100$

---

### The Framework

#### Top-Down Dynamic Programming (Memory Limit Exceeded)

```Python
class Solution:
    def minTaps(self, n: int, ranges: List[int]) -> int:
        size = len(ranges)

        @functools.lru_cache(maxsize=None)
        def dp(i, prev):
            # Base case
            if i >= size:
                return math.inf

            ans = math.inf

            if i - prev <= ranges[i]:
                if i + ranges[i] >= size - 1:
                    ans = 1
                else:
                    ans = 1 + dp(i + 1, i + ranges[i])

            ans = min(ans, dp(i + 1, prev))

            return ans

        ans = dp(0, 0)
        return -1 if ans == math.inf else ans
```

#### Bottom-Up Dynamic Programming

```Python
class Solution:
    def minTaps(self, n: int, ranges: List[int]) -> int:
        dp = [math.inf] * (n + 1)

        # Initialize the starting position of the garden
        dp[0] = 0

        for i in range(n  + 1):
            tap_start = max(0, i - ranges[i])
            tap_end = min(n, i + ranges[i])

            for j in range(tap_start, tap_end + 1):
                dp[tap_end] = min(dp[tap_end], dp[j] + 1)

        if dp[n] == math.inf:
            return -1
        
        return dp[n]
```

### Greedy

```Python
class Solution:
    def minTaps(self, n: int, ranges: List[int]) -> int:
        max_reach = [0] * (n + 1)

        for i in range(len(ranges)):
            start = max(0, i - ranges[i])
            end = min(n, i + ranges[i])

            max_reach[start] = max(max_reach[start], end)

        ans = 0
        curr_end = next_end = 0

        for i in range(n + 1):
            if i > next_end:
                return -1
            
            if i > curr_end:
                ans += 1
                curr_end = next_end

            next_end = max(next_end, max_reach[i])
        
        return ans
```

