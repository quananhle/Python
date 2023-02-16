## 1335. Minimum Difficulty of a Job Schedule

```Tag```: ```Dynamic Programming```

#### Difficulty: Hard

You want to schedule a list of jobs in ```d``` days. Jobs are dependent (i.e To work on the i<sup>th</sup> job, you have to finish all the jobs ```j``` where ```0 <= j < i```).

You have to finish __at least__ one task every day. The difficulty of a job schedule is the sum of difficulties of each day of the ```d``` days. The difficulty of a day is the maximum difficulty of a job done on that day.

You are given an integer array ```jobDifficulty``` and an integer ```d```. The difficulty of the i<sup>th</sup> job is ```jobDifficulty[i]```.

Return _the minimum difficulty of a job schedule_. If you cannot find a schedule for the jobs return ```-1```.

![image](https://user-images.githubusercontent.com/35042430/219433165-e5b07635-a164-4d98-b23f-02407a5be824.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/01/16/untitled.png)
```
Input: jobDifficulty = [6,5,4,3,2,1], d = 2
Output: 7
Explanation: First day you can finish the first 5 jobs, total difficulty = 6.
Second day you can finish the last job, total difficulty = 1.
The difficulty of the schedule = 6 + 1 = 7 
```

__Example 2:__
```
Input: jobDifficulty = [9,9,9], d = 4
Output: -1
Explanation: If you finish a job per day you will still have a free day. you cannot find a schedule for the given jobs.
```

__Example 3:__
```
Input: jobDifficulty = [1,1,1], d = 3
Output: 3
Explanation: The schedule is one job per day. total difficulty will be 3.
```

__Constraints:__

- ```1 <= jobDifficulty.length <= 300```
- ```0 <= jobDifficulty[i] <= 1000```
- ```1 <= d <= 10```

---

We can tell this is a problem where Dynamic Programming can be used because 
  1. We are asked for the minimum of something, and
  2. Deciding how many jobs to do on a given day affects the jobs we can do on all future days.

### The Framework

__1. A function that answers the problem for a given state__

Reading the problem description carefully, there are ```d``` total days, and on each day we need to complete some number of jobs. By the end of the ```d``` days, we must have finished all jobs (in the given order). Therefore, we can see that on each day, we need to decide how many jobs to take.

  - Let's use one state variable ```i```, where ```i``` is the index of the first job that will be done on the current day.
  - Let's use another state variable ```day```, where ```day``` indicates what day it currently is.

The problem is asking for the minimum difficulty, so let's have a function ```dp(i, day)``` that returns the minimum difficulty of a job schedule which starts on the 
i<sup>th</sup> job and day, ```day```. To solve the original problem, we will just return ```dp(0, 1)```, since we start on the first day with no jobs done yet.

![image](https://leetcode.com/explore/learn/card/Figures/DP1/C3A2_1_cropped.png)

![image](https://leetcode.com/explore/learn/card/Figures/DP1/C3A2_2_cropped.png)

__2. A recurrence relation to transition between states__

![image](https://user-images.githubusercontent.com/35042430/219462362-64341b43-964a-4ec5-b7b8-f4e58196f346.png)


__3. Base cases__

![image](https://user-images.githubusercontent.com/35042430/219463224-59e8ccf6-9f5a-45db-844c-09d118bdff32.png)

#### Top-Down Dynamic Programming (Recursion)

```Python
class Solution:
    def minDifficulty(self, jobDifficulty: List[int], d: int) -> int:
        memo = collections.defaultdict(int)
        hardest_job = 0
        n = len(jobDifficulty)

        # Check if there are less jobs than days to complete at least 1 job per day, have a free day
        if n < d:
            return -1

        for i in range(n - 1, -1, -1):
            # Get the hardest job
            hardest_job = max(hardest_job, jobDifficulty[i])
            # Precompute remaining jobs at ith day
            memo[i] = hardest_job
        
        @lru_cache(3000)
        def dp(curr, day):
            # Base cases
            # At the last day, all the jobs must be finished
            if day == d:
                return memo[curr]
            
            best = math.inf
            curr_hardest = 0

            # Leave at least 1 job per remaining day
            for i in range(curr, n - (d - day)):
                curr_hardest = max(curr_hardest, jobDifficulty[i])
                # Recurrence relation
                best = min(best, curr_hardest + dp(i + 1, day + 1))

            return best
            
        return dp(0, 1)
```
