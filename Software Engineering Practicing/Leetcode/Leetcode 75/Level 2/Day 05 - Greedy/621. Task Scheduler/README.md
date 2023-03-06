## [621. Task Scheduler](https://leetcode.com/problems/task-scheduler/)

```Tag```: ```Greedy```

#### Difficulty: Medium

Given a characters array ```tasks```, representing the tasks a CPU needs to do, where each letter represents a different task. Tasks could be done in any order. Each task is done in one unit of time. For each unit of time, the CPU could complete either one task or just be idle.

However, there is a non-negative integer ```n``` that represents the cooldown period between two same tasks (the same letter in the array), that is that there must be at least ```n``` units of time between any two same tasks.

Return _the least number of units of times that the CPU will take to finish all the given tasks_.

![image](https://user-images.githubusercontent.com/35042430/223026966-0a79acbf-5692-4324-aff2-1948607fc69f.png)

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

- 1 <= ```task.length``` <= 10<sup>4</sup>
- ```tasks[i]``` is upper-case English letter.
- The integer ```n``` is in the range ```[0, 100]```.

---
