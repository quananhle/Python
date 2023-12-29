## [1335. Minimum Difficulty of a Job Schedule](https://leetcode.com/problems/minimum-difficulty-of-a-job-schedule)

```Tag```: ```Dynamic Programming```

#### Difficulty: Hard

You want to schedule a list of jobs in ```d``` days. Jobs are dependent (i.e To work on the i<sup>th</sup> job, you have to finish all the jobs ```j``` where ```0 <= j < i```).

You have to finish __at least__ one task every day. The difficulty of a job schedule is the sum of difficulties of each day of the ```d``` days. The difficulty of a day is the maximum difficulty of a job done on that day.

You are given an integer array ```jobDifficulty``` and an integer ```d```. The difficulty of the i<sup>th</sup> job is ```jobDifficulty[i]```.

Return _the minimum difficulty of a job schedule_. If you cannot find a schedule for the jobs return ```-1```.

![image](https://github.com/quananhle/Python/assets/35042430/c4c56314-4890-4f29-9c4c-cf7be9da138c)

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

- $1 \le jobDifficulty.length \le 300$
- $0 \le jobDifficulty[i] \le 1000$
- $1 \le d \le 10$

---

We can tell this is a problem where Dynamic Programming can be used because 
  1. We are asked for the minimum of something, and
  2. Deciding how many jobs to do on a given day affects the jobs we can do on all future days.

![image](https://leetcode.com/problems/minimum-difficulty-of-a-job-schedule/solutions/2371487/Figures/1335/1335_1BruteForce.JPG)

### Dynamic Programming Framework

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

![image](https://leetcode.com/problems/minimum-difficulty-of-a-job-schedule/Figures/1335/1335_2DFS_to_dp.JPG)

- __Time complexity__: $\mathcal{O}(n^2 \cdot d)$, since there are ```n * d``` possible states, and we need $\mathcal{O}(n)$ time to calculate the result for each state.
- __Space complexity__: $\mathcal{O}(n \cdot d)$, extra space required to memorize all $n \cdot d$ states.

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
            # Precompute the maximum job difficulty for remaining jobs
            memo[i] = hardest_job
        
        @lru_cache(3000)
        def dp(curr, days_remaining):
            # Base cases
            # At the last day, all the jobs must be finished
            if days_remaining == d:
                return memo[curr]
            
            ans = math.inf
            # Keep track of the maximum difficulty for today
            curr_hardest = 0

            # Iterate through possible starting index for the next day and ensure at least 1 job per remaining day
            for i in range(curr, n - (d - days_remaining)):
                curr_hardest = max(curr_hardest, jobDifficulty[i])
                # Recurrence relation
                best = min(best, curr_hardest + dp(i + 1, days_remaining + 1))

            return ans
            
        return dp(0, 1)
```

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
            # Precompute the maximum job difficulty for remaining jobs
            memo[i] = hardest_job

        def dp(curr, days_remaining):
            # Base cases
            # At the last day, all the jobs must be finished
            if days_remaining == 1:
                return memo[curr]

            if (curr, days_remaining) in memo:
                return memo[(curr, days_remaining)]

            ans = math.inf
            # Keep track of the maximum difficulty for today
            curr_hardest = 0

            for i in range(curr, n - days_remaining + 1):
                curr_hardest = max(curr_hardest, jobDifficulty[i])
                # Recurrence relation
                ans = min(ans, curr_hardest + dp(i + 1, days_remaining - 1))

            memo[(curr, remaining)] = ans
            return ans

        return dp(0, d)
```

#### Bottom-Up Dynamic Programming (Tabulation)

__Time complexity__: ```O(n^2 ⋅ d)```, since there are n * d possible states, and we need O(n) time to calculate the result for each state.

__Space complexity__: ```O(n ⋅ d)```, extra space required for 2D array to memorize all n ⋅ d states.

![image](https://user-images.githubusercontent.com/35042430/219476931-507218dd-4803-41cb-b7a1-4ee802156d30.png)

```
Example 1: 
Input: jobDifficulty = [6,5,4,3,2,1], d = 2
Output: 7
[[∞, 7, 6], 
 [∞, 6, 5], 
 [∞, 5, 4], 
 [∞, 4, 3], 
 [∞, 3, 2], 
 [∞, ∞, 1]]
```

```Python
class Solution:
    def minDifficulty(self, jobDifficulty: List[int], d: int) -> int:
        n = len(jobDifficulty)

        if n < d:
            return -1

        # To find minimum, default value needs to be maximum integer
        dp = [[sys.maxsize] * (d + 1) for _ in range(n)]

        # Set base cases
        dp[-1][d] = jobDifficulty[-1]

        # All remaining jobs must be scheduled on the last day
        for i in range(n - 2, -1, -1):
            # Precompute the hardest job on or after ith day
            dp[i][d] = max(dp[i + 1][d], jobDifficulty[i])

        for days_remaining in range(d - 1, 0, -1):
            for curr_day in range(days_remaining - 1, n - (d - days_remaining)):
                curr_hardest = 0
                for next_day in range(curr_day, n - (d - days_remaining)):
                    curr_hardest = max(curr_hardest, jobDifficulty[next_day])
                    # Recurrence relation
                    dp[curr_day][days_remaining] = min(dp[curr_day][days_remaining], curr_hardest + dp[next_day + 1][days_remaining + 1])

        return dp[0][1]
```

#### Optimized Space Bottom-Up Dynamic Programming

__Time complexity__: ```O(n^2 ⋅ d)```, since there are n * d possible states, and we need O(n) time to calculate the result for each state.

__Space complexity__: ```O(n)```, as we only use two arrays of length n+1 to store all relevant states at any given time.

```Python
class Solution:
    def minDifficulty(self, jobDifficulty: List[int], d: int) -> int:
        n = len(jobDifficulty)
        # Initialize the next_dp matrix to record the minimum difficulty of the job schedule
        next_dp = [float('inf')] * n + [0]

        for days_remaining in range(1, d + 1):
            curr_dp = [float('inf')] * n + [0]
            for curr_day in range(n - days_remaining + 1):
                curr_hardest = 0
                for next_day in range(curr_day + 1, n - days_remaining + 2):
                    # Use curr_hardest to record maximum job difficulty
                    curr_hardest = max(curr_hardest, jobDifficulty[next_day - 1])
                    # Recurrence relation
                    curr_dp[curr_day] = min(curr_dp[curr_day], curr_hardest + next_dp[next_day])

            next_dp = curr_dp

        return next_dp[0] if next_dp[0] != float('inf') else -1
```

---

### Monotonic Stack

```Python
        n = len(jobDifficulty)
        if n < d:
            return -1

        # curr_day and prev_day record the minimum total job difficulty for the current day and previous day, respectively
        prev_day, curr_day = [float('inf')] * n, [float('inf')] * n

        for day in range(d):
            # Use a monotonically decreasing stack to record job difficulties
            monotonic_stack = []

            # The number of jobs needs to be no less than number of days passed.
            for i in range(day, n):

                # We initialize curr_day[i] as only performing 1 job at the i-th index.
                # At day 0, the minimum total job difficulty is to complete the 0th job only.
                if i == 0:
                    curr_day[i] = jobDifficulty[0]
                # Otherwise, we increment prev_day[i - 1] by the i-th job difficulty
                else:
                    curr_day[i] = prev_day[i - 1] + jobDifficulty[i]

                # When we find the last element in the stack is smaller than or equal to current job,
                # we need to pop out the element to maintain a monotonic decreasing stack.
                while monotonic_stack and jobDifficulty[monotonic_stack[-1]] <= jobDifficulty[i]:

                    # If we include all jobs with index j+1 to i to the current day,
                    # total job difficulty of the current day will be increased.
                    # by the amount of jobDifficulty[i] - jobDifficulty[j]
                    j = monotonic_stack.pop()
                    diff_incr = jobDifficulty[i] - jobDifficulty[j]
                    curr_day[i] = min(curr_day[i], curr_day[j] + diff_incr)

                # When the last element in the stack is larger than current element,
                # If we include all jobs with index j+1 to i to the current day,
                # the overall job difficulty will not change.
                if monotonic_stack:
                    curr_day[i] = min(curr_day[i], curr_day[monotonic_stack[-1]])

                # Update the monotonic stack by adding in the current index
                monotonic_stack.append(i)

            prev_day, curr_day = curr_day, prev_day

        return prev_day[-1]
```
