## 2244. Minimum Rounds to Complete All Tasks

```Tag```: ```Hash Table``` ```Counter``` ```Math```

#### Difficulty: Medium

You are given a __0-indexed__ integer array ```tasks```, where ```tasks[i]``` represents the difficulty level of a task. In each round, you can complete either 2 or 3 tasks of the __same difficulty level__.

Return _the minimum rounds required to complete all the tasks, or ```-1``` if it is not possible to complete all the tasks_.

![image](https://user-images.githubusercontent.com/35042430/210498639-ee122580-854e-49b2-844d-e9d74131fa89.png)

---

__Example 1:__
```
Input: tasks = [2,2,3,3,2,4,4,4,4,4]
Output: 4
Explanation: To complete all the tasks, a possible plan is:
- In the first round, you complete 3 tasks of difficulty level 2. 
- In the second round, you complete 2 tasks of difficulty level 3. 
- In the third round, you complete 3 tasks of difficulty level 4. 
- In the fourth round, you complete 2 tasks of difficulty level 4.  
It can be shown that all the tasks cannot be completed in fewer than 4 rounds, so the answer is 4.
```

__Example 2:__
```
Input: tasks = [2,3,3]
Output: -1
Explanation: There is only 1 task of difficulty level 2, but in each round, you can only complete either 2 or 3 tasks of the same difficulty level. Hence, you cannot complete all the tasks, and the answer is -1.
```

__Constraints:__
```
1 <= tasks.length <= 105
1 <= tasks[i] <= 109
```

---

![image](https://leetcode.com/problems/minimum-rounds-to-complete-all-tasks/solutions/2779140/Figures/2244/2244A.png)

To find the minimum number of groups for other integers, we can divide the integers into three groups:

- Integers that are multiples of ```3``` i.e., of the form ```3∗K```.
- Integers that leaves ```remainder of 1``` when divided by 3 i.e., of the form ```3∗K+1```.
- Integers that leaves ```remainder of 2``` when divided by 3 i.e., of the form ```3∗K+2```.

```Python
class Solution:
    def minimumRounds(self, tasks: List[int]) -> int:
        """
        freq = dict()
        count = 0
        for task in tasks:
            freq[task] = 1 + freq.get(task, 0)
        for val in freq.values():
            # Check if val == 1, cannot complete all the tasks
            if val == 1:
                return -1
            # Check if val == 3, 6, 9, 12,..., n + 3 for n % 3 == 0
            if val % 3 == 0:
                count += val // 3
            # Check if val == 4, 7, 10, 13,..., n + 3 for n % 3 == 1
            elif val % 3 == 1:
                count += val // 3 + 1
            # Check if val == 2, 5, 8, 11, 14,..., n + 3 for n % 3 == 2
            elif val % 3 == 2:
                count += val // 3 + 1
        return count
```

```Python
class Solution:
    def minimumRounds(self, tasks: List[int]) -> int:
        """
        round = 0
        counter = collections.Counter(tasks)
        for task in counter.values():
            if task == 1:
                return -1
            round += task // 3 + min(1, task % 3)
        return round

```
