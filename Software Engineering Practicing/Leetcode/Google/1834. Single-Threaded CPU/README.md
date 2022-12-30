## 1834. Single-Threaded CPU

```Tag```: ```Heap``` ```Shortest Job First (SJF) CPU Scheduling```

#### Difficulty: Medium

You are given ```n``` tasks labeled from ```0``` to ```n - 1``` represented by a 2D integer array tasks, where ```tasks[i] = [enqueueTimei, processingTimei]``` means that the i<sup>th</sup> task will be available to process at enqueueTime<sub>i</sub> and will take processingTime<sub>i</sub> to finish processing.

You have a single-threaded CPU that can process __at most one__ task at a time and will act in the following way:

- If the CPU is idle and there are no available tasks to process, the CPU remains idle.
- If the CPU is idle and there are available tasks, the CPU will choose the one with the __shortest processing time__. If multiple tasks have the same shortest processing time, it will choose the task with the smallest index.
- Once a task is started, the CPU will __process the entire task__ without stopping.
- The CPU can finish a task then start a new one instantly.

Return _the order in which the CPU will process the tasks_.

---

---

![image](https://leetcode.com/problems/single-threaded-cpu/solutions/2216661/Figures/1834/Slide29.PNG)

The problem statement asks us to create a scheduling policy that prioritizes the shortest available task; this is known as __Shortest Job First (SJF) CPU Scheduling__. In __SJF CPU Scheduling__:

- If the CPU is idle and there are available tasks, the CPU will choose the one with the __shortest processing time__. If multiple tasks have the __same shortest processing time__, it will choose the task with the __smallest index__ (the task which arrived first).
- Once the CPU starts to execute a task, it will process the entire task without stopping, i.e. it is __non-preemptive__.

