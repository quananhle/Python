## [1335. Minimum Difficulty of a Job Schedule](https://leetcode.com/problems/minimum-difficulty-of-a-job-schedule)

```Tag```: ```Monotonic Stack```

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

### Monotonic Stack

__Time complexity__: ```O(n ⋅ d)``` as there are ```n ⋅ d``` possible states. Using the stack solution, we need ```O(n)``` time to calculate all ```n``` states for each day.

__Space complexity__: ```O(n)``` as we only use one array of length ```n``` to store all DP states for the prior day and the current day, and the stack that will contain at most ```n``` elements.

```Python
class Solution:
    def minDifficulty(self, jobDifficulty: List[int], d: int) -> int:
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
