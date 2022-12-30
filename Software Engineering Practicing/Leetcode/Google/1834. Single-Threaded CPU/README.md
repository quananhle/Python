## 1834. Single-Threaded CPU

```Tag```: ```Heap``` ```Priority Queue``` ```Shortest Job First (SJF) CPU Scheduling```

#### Difficulty: Medium

You are given ```n``` tasks labeled from ```0``` to ```n - 1``` represented by a 2D integer array tasks, where ```tasks[i] = [enqueueTimei, processingTimei]``` means that the i<sup>th</sup> task will be available to process at enqueueTime<sub>i</sub> and will take processingTime<sub>i</sub> to finish processing.

You have a single-threaded CPU that can process __at most one__ task at a time and will act in the following way:

- If the CPU is idle and there are no available tasks to process, the CPU remains idle.
- If the CPU is idle and there are available tasks, the CPU will choose the one with the __shortest processing time__. If multiple tasks have the same shortest processing time, it will choose the task with the smallest index.
- Once a task is started, the CPU will __process the entire task__ without stopping.
- The CPU can finish a task then start a new one instantly.

Return _the order in which the CPU will process the tasks_.

---

__Example 1:__

```
Input: tasks = [[1,2],[2,4],[3,2],[4,1]]
Output: [0,2,3,1]
Explanation: The events go as follows: 
- At time = 1, task 0 is available to process. Available tasks = {0}.
- Also at time = 1, the idle CPU starts processing task 0. Available tasks = {}.
- At time = 2, task 1 is available to process. Available tasks = {1}.
- At time = 3, task 2 is available to process. Available tasks = {1, 2}.
- Also at time = 3, the CPU finishes task 0 and starts processing task 2 as it is the shortest. Available tasks = {1}.
- At time = 4, task 3 is available to process. Available tasks = {1, 3}.
- At time = 5, the CPU finishes task 2 and starts processing task 3 as it is the shortest. Available tasks = {1}.
- At time = 6, the CPU finishes task 3 and starts processing task 1. Available tasks = {}.
- At time = 10, the CPU finishes task 1 and becomes idle.
```

__Example 2:__

```
Input: tasks = [[7,10],[7,12],[7,5],[7,4],[7,2]]
Output: [4,3,2,0,1]
Explanation: The events go as follows:
- At time = 7, all the tasks become available. Available tasks = {0,1,2,3,4}.
- Also at time = 7, the idle CPU starts processing task 4. Available tasks = {0,1,2,3}.
- At time = 9, the CPU finishes task 4 and starts processing task 3. Available tasks = {0,1,2}.
- At time = 13, the CPU finishes task 3 and starts processing task 2. Available tasks = {0,1}.
- At time = 18, the CPU finishes task 2 and starts processing task 0. Available tasks = {1}.
- At time = 28, the CPU finishes task 0 and starts processing task 1. Available tasks = {}.
- At time = 40, the CPU finishes task 1 and becomes idle.
```

__Constraints:__
```
tasks.length == n
1 <= n <= 105
1 <= enqueueTimei, processingTimei <= 109
```
---

![image](https://leetcode.com/problems/single-threaded-cpu/solutions/2216661/Figures/1834/Slide29.PNG)

The problem statement asks us to create a scheduling policy that prioritizes the shortest available task; this is known as __Shortest Job First (SJF) CPU Scheduling__. In __SJF CPU Scheduling__:

- If the CPU is idle and there are available tasks, the CPU will choose the one with the __shortest processing time__. If multiple tasks have the __same shortest processing time__, it will choose the task with the __smallest index__ (the task which arrived first).
- Once the CPU starts to execute a task, it will process the entire task without stopping, i.e. it is __non-preemptive__.

### Greedy Algorithm and Min Heap

#### Time Complexity: O(NlogN), sort operations take NlogN time
#### Space Complexity: O(N), extra memory space required to build heap

```Python
class Solution:
    def getOrder(self, tasks: List[List[int]]) -> List[int]:
        # Greedy Algorithm and Min Heap
        # If all tasks enqueue at the same time, the shortest processing time task starts first
        # If multiple tasks have the same shortest processing time, the task enqueued first starts first
        res = list()
        # Sort the task by enqueue time, processing time, and index to keep reference to original task index positions
        tasks = sorted([(t[0], t[1], i) for i, t in enumerate(tasks)])
        start = tasks[0][0]
        i = 0
        h = list()
        while len(res) < len(tasks):
            # Build the heap with all tasks which start time <= current time -> to search for the candidate task to start 
            while i < len(tasks) and tasks[i][0] <= start:
                heapq.heappush(h, (tasks[i][1], tasks[i][2]))    # processing time, original index
                i += 1
            # Any task in the heap is already past its start time 
            if h:
                # Pop the first task to start processing
                processing_time, index = heapq.heappop(h)
                start += processing_time
                res.append(index)
            # If no task to start, let CPU sit idle and update the enqueue time
            elif i < len(tasks):
                start = tasks[i][0]
        return res
```
