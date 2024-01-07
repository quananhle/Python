## [1235. Maximum Profit in Job Scheduling](https://leetcode.com/problems/maximum-profit-in-job-scheduling)

```Tag```: ```Dynamic Programming``` ```Priority Queue``` ```Stack``` ```Binary Search``` ```Sorting```

#### Difficulty: Hard

We have ```n``` jobs, where every job is scheduled to be done from ```startTime[i]``` to ```endTime[i]```, obtaining a profit of ```profit[i]```.

You're given the startTime, endTime and profit arrays, return the maximum profit you can take such that there are no two jobs in the subset with overlapping time range.

If you choose a job that ends at time X you will be able to start another job that starts at time X.

![image](https://github.com/quananhle/Python/assets/35042430/c8d9a71f-eec8-41dc-a371-666705a2d503)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2019/10/10/sample1_1584.png)
```
Input: startTime = [1,2,3,3], endTime = [3,4,5,6], profit = [50,10,40,70]
Output: 120
Explanation: The subset chosen is the first and fourth job. 
Time range [1-3]+[3-6] , we get profit of 120 = 50 + 70.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2019/10/10/sample22_1584.png)
```
Input: startTime = [1,2,3,4,6], endTime = [3,5,10,6,9], profit = [20,20,100,70,60]
Output: 150
Explanation: The subset chosen is the first, fourth and fifth job. 
Profit obtained 150 = 20 + 70 + 60.
```

__Example 3:__

![image](https://assets.leetcode.com/uploads/2019/10/10/sample3_1584.png)
```
Input: startTime = [1,1,1], endTime = [2,3,4], profit = [5,6,4]
Output: 6
```

__Constraints:__

- $1 \le startTime.length == endTime.length == profit.length \le 5 * 10^4$
- $1 \le startTime[i] \lt endTime[i] \le 10^9$
- $1 \le profit[i] \le 10^4$

---

### Intervals

#### Array & String + Sorting

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N \log N)$
- __Space Complexity__: $\mathcal{O}(N)$

```Python
class Solution:
    def jobScheduling(self, startTime: List[int], endTime: List[int], profit: List[int]) -> int:
        intervals = list()
        max_profit = 0

        for idx, (s, e, p) in enumerate(zip(startTime, endTime, profit)):
            intervals.append((s, True, p, idx))
            intervals.append((e, False, p, idx))
        
        intervals.sort()
        profits = [0] * len(profit)

        for time, start, amount, idx in intervals:
            if start:
                profits[idx] = max_profit + amount
            else:
                max_profit = max(max_profit, profits[idx])
            
        return max_profit
```

#### Priority Queue + Sorting

![image](https://github.com/quananhle/Python/assets/35042430/70eb7a3d-4c00-40eb-add2-6be9ed034b1b)

![image](https://github.com/quananhle/Python/assets/35042430/88618619-4ec6-429c-9935-6e4b798b9b73)

![image](https://github.com/quananhle/Python/assets/35042430/9d2bfd3f-ef03-407a-85f3-d96b1df987fe)

![image](https://github.com/quananhle/Python/assets/35042430/ff2d914b-3e2a-48b1-8b79-cdbbe6ba4afd)

![image](https://github.com/quananhle/Python/assets/35042430/3f306c16-b2c2-4712-b497-f8e606a9b953)

![image](https://github.com/quananhle/Python/assets/35042430/ec7a03f0-d40e-46ab-85c9-f92ca184a502)

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N \log N)$
- __Space Complexity__: $\mathcal{O}(N)$

```Python
class Solution:
    def jobScheduling(self, startTime: List[int], endTime: List[int], profit: List[int]) -> int:
        n = len(profit)
        s, e, p = 0, 1, 2
        jobs = list(zip(startTime, endTime, profit))
        jobs.sort()

        h = list()
        max_profit = 0

        for i in range(n):
            while h and h[0][0] <= jobs[i][s]:
                max_profit = max(max_profit, heapq.heappop(h)[e])
            heapq.heappush(h, (jobs[i][e], jobs[i][p] + max_profit))

        while h:
            max_profit = max(max_profit, heapq.heappop(h)[e])
        
        return max_profit
```

---

### Dynamic Programming Framework

#### Top-Down Dynamic Programming

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N \log N)$
- __Space Complexity__: $\mathcal{O}(N)$

![image](https://leetcode.com/problems/maximum-profit-in-job-scheduling/Figures/1235/1235A.png)

```Python
class Solution:
    def jobScheduling(self, startTime: List[int], endTime: List[int], profit: List[int]) -> int:
        n = len(profit)
        memo = collections.defaultdict(int)
        jobs = list()

        jobs = list(zip(startTime, endTime, profit))
        jobs.sort()

        for i in range(n):
            startTime[i] = jobs[i][0]

        def binary_search(array, num):
            lo, hi = 0, len(array) - 1
            target = len(array)

            while lo <= hi:
                mi = lo + (hi - lo) // 2
                if array[mi] < num:
                    lo = mi + 1
                else:
                    target = mi
                    hi = mi - 1

            return target

        def dp(curr):
            # Base case
            if curr == n:
                return 0

            if curr in memo:
                return memo[curr]

            next = binary_search(startTime, jobs[curr][1])
            # DP Transitions:
            skip = dp(curr + 1)
            take = dp(next) + jobs[curr][2]
            memo[curr] = max(skip, take)

            return memo[curr]

        return dp(0)
```

```Python
class Solution:
    def jobScheduling(self, startTime: List[int], endTime: List[int], profit: List[int]) -> int:
        n = len(profit)
        jobs = list()

        jobs = list(zip(startTime, endTime, profit))
        jobs.sort()

        for i in range(n):
            startTime[i] = jobs[i][0]
        
        def binary_search(array, num):
            lo, hi = 0, len(array) - 1
            target = len(array)

            while lo <= hi:
                mi = lo + (hi - lo) // 2
                if array[mi] < num:
                    lo = mi + 1
                else:
                    target = mi
                    hi = mi - 1
                
            return target

        @functools.lru_cache(maxsize=None)
        def dp(curr):
            # Base case
            if curr == n:
                return 0
            
            next = binary_search(startTime, jobs[curr][1])
            # DP Transitions:
            skip = dp(curr + 1)
            take = dp(next) + jobs[curr][2]
            max_profit = max(skip, take)

            return max_profit
        
        return dp(0)
```
