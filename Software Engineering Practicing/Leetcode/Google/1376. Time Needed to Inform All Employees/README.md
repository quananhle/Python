## [1376. Time Needed to Inform All Employees](https://leetcode.com/problems/time-needed-to-inform-all-employees)

```Tag```: ```Depth-First Search``` ```Breadth-First Search```

#### Difficulty: Medium

A company has ```n``` employees with a unique ID for each employee from ```0``` to ```n - 1```. The head of the company is the one with ```headID```.

Each employee has one direct manager given in the ```manager``` array where ```manager[i]``` is the direct manager of the ```i-th``` employee, ```manager[headID] = -1```. Also, it is guaranteed that the subordination relationships have a tree structure.

The head of the company wants to inform all the company employees of an urgent piece of news. He will inform his direct subordinates, and they will inform their subordinates, and so on until all employees know about the urgent news.

The ```i-th``` employee needs ```informTime[i]``` minutes to inform all of his direct subordinates (i.e., After ```informTime[i]``` minutes, all his direct subordinates can start spreading the news).

Return _the number of minutes needed to inform all the employees about the urgent news_.

![image](https://github.com/quananhle/Python/assets/35042430/659262eb-7522-4bda-a4f4-7042cabd7508)

---

__Example 1:__
```
Input: n = 1, headID = 0, manager = [-1], informTime = [0]
Output: 0
Explanation: The head of the company is the only employee in the company.
```

__Example 2__:

```
Input: n = 6, headID = 2, manager = [2,2,-1,2,2,2], informTime = [0,0,1,0,0,0]
Output: 1
Explanation: The head of the company with id = 2 is the direct manager of all the employees in the company and needs 1 minute to inform them all.
The tree structure of the employees in the company is shown.
```

__Constraints:__

- ```1 <= n <= 10^5```
- ```0 <= headID < n```
- ```manager.length == n```
- ```0 <= manager[i] < n```
- ```manager[headID] == -1```
- ```informTime.length == n```
- ```0 <= informTime[i] <= 1000```
- ```informTime[i] == 0``` if employee ```i``` has no subordinates.
- It is guaranteed that all the employees can be informed.

---

![image](https://leetcode.com/problems/time-needed-to-inform-all-employees/Figures/1376/1376A.png)

### Depth-First Search (DFS)

```Python
class Solution:
    def numOfMinutes(self, n: int, headID: int, manager: List[int], informTime: List[int]) -> int:
        ans = float('-inf')
        adjacent_graph = collections.defaultdict(list)

        for i in range(n):
            if manager[i] != -1:
                adjacent_graph[manager[i]].append(i)
        
        print (adjacent_graph)

        def dfs(curr, time):
            nonlocal ans

            ans = max(ans, time)

            for next in adjacent_graph[curr]:
                dfs(next, time + informTime[curr])

        dfs(headID, 0)
        return ans
```
