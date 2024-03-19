## [621. Task Scheduler](https://leetcode.com/problems/task-scheduler/)

```Tag```: ```Greedy``` ```Hash Map``` ```Math``` ```Heap```

#### Difficulty: Medium

Given a characters array ```tasks```, representing the tasks a CPU needs to do, where each letter represents a different task. Tasks could be done in any order. Each task is done in one unit of time. For each unit of time, the CPU could complete either one task or just be idle.

However, there is a non-negative integer ```n``` that represents the cooldown period between two same tasks (the same letter in the array), that is that there must be at least ```n``` units of time between any two same tasks.

Return _the least number of units of times that the CPU will take to finish all the given tasks_.

![image](https://github.com/quananhle/Python/assets/35042430/b4148952-ae0f-4d25-b088-5110bfe9a86a)

---

__Example 1:__
```
Input: tasks = ["A","A","A","B","B","B"], n = 2
Output: 8
Explanation: 
A -> B -> idle -> A -> B -> idle -> A -> B
There is at least 2 units of time between any two same tasks.
```

__Example 2:__
```
Input: tasks = ["A","A","A","B","B","B"], n = 0
Output: 6
Explanation: On this case any permutation of size 6 would work since n = 0.
["A","A","A","B","B","B"]
["A","B","A","B","A","B"]
["B","B","B","A","A","A"]
...
And so on.
```

__Example 3:__
```
Input: tasks = ["A","A","A","A","A","A","B","C","D","E","F","G"], n = 2
Output: 16
Explanation: 
One possible solution is
A -> B -> C -> A -> D -> E -> A -> F -> G -> A -> idle -> idle -> A -> idle -> idle -> A
```

__Constraints:__

- $1 \le task.length \le 10^4$
- ```tasks[i]``` is upper-case English letter.
- The integer ```n``` is in the range ```[0, 100]```.

---

### Greedy

![image](https://user-images.githubusercontent.com/35042430/223217500-3439fc4e-f26e-456a-ba18-ce2b69026ecc.png)

![image](https://user-images.githubusercontent.com/35042430/223217660-1ed67d1f-3f11-4d0a-80fa-85105ffe8d8e.png)
![image](https://user-images.githubusercontent.com/35042430/223217706-2b4c4c41-f35f-44eb-bee1-431a1ebf471c.png)
![image](https://user-images.githubusercontent.com/35042430/223217789-36d007ec-ddcb-4e3d-a1e6-5fa41382960a.png)
![image](https://user-images.githubusercontent.com/35042430/223217858-2cd02863-82bd-4508-a5cb-64809fe8a384.png)
![image](https://user-images.githubusercontent.com/35042430/223217889-4c36b94b-c473-4041-8433-ea13d2f2d3fa.png)

```Python
class Solution:
    def leastInterval(self, tasks: List[str], n: int) -> int:
        freq = [0] * 26
        for task in tasks:
            freq[ord(task) - ord('A')] += 1
        freq.sort()

        max_freq = freq.pop()
        idle_time = (max_freq - 1) * n

        while freq and idle_time > 0:
            curr_freq = freq.pop()
            if curr_freq == max_freq:
                idle_time  -= (max_freq - 1)
            else:
                idle_time -= curr_freq
            '''
            idle_time -= min(max_freq - 1, freq.pop())
            '''
        idle_time = max(0, idle_time)

        return idle_time + len(tasks)
```

### Heap

```Python
class Solution:
    def leastInterval(self, tasks: List[str], n: int) -> int:
        freq = [0] * 26
        for task in tasks:
            freq[ord(task) - ord('A')] += 1
        h = list()
        for f in freq:
            if f:
                heapq.heappush(h, -f)
        # Get the most frequent task
        f_max = -heapq.heappop(h)
        # Compute the maximum possible idle time needed
        idle_time = (f_max - 1) * n

        while h and idle_time > 0:
            curr_freq = -heapq.heappop(h)
            # Check if the current task has the same frequency as the most frequent task, only need current frequecy - 1 to fill the slots
            if curr_freq == f_max:
                idle_time -= (curr_freq - 1)
            # Otherwise, the current task has lower frequency, fill them all into slots
            else:
                idle_time -= curr_freq

        return idle_time + len(tasks) if idle_time > 0 else len(tasks)
```

### Math

There are two possible situations:

- The most frequent task is not frequent enough to force the presence of idle slots.

![image](https://leetcode.com/problems/task-scheduler/Figures/621/all2.png)

The first situation is straightforward because the total number of slots is defined by the number of tasks: ```len(tasks)```.

- The most frequent task is frequent enough to force some idle slots.

![image](https://leetcode.com/problems/task-scheduler/Figures/621/frequent2.png)

The second situation is a bit more tricky and requires to know the number ```n_max``` and the frequency ```f_max``` of the most frequent tasks.

![image](https://leetcode.com/problems/task-scheduler/Figures/621/f_max.png)

![image](https://leetcode.com/problems/task-scheduler/Figures/621/compute.png)

```Python
class Solution:
    def leastInterval(self, tasks: List[str], n: int) -> int:
        freq = [0] * 26
        for task in tasks:
            freq[ord(task) - ord('A')] += 1
        
        f_max = max(freq)
        n_max = 0
        for f in freq:
            if f == f_max:
                n_max += 1

        return max(len(tasks), (f_max - 1) * (n + 1) + n_max) 
```
