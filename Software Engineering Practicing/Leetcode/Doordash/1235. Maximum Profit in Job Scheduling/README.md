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

#### Sorting

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
