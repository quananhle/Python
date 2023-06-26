## [2462. Total Cost to Hire K Workers](https://leetcode.com/problems/total-cost-to-hire-k-workers/)

```Tag```: ```Priority Queue```

#### Difficulty: Medium

You are given a __0-indexed__ integer array ```costs``` where ```costs[i]``` is the cost of hiring the i<sup>th</sup> worker.

You are also given two integers ```k``` and ```candidates```. We want to hire exactly ```k``` workers according to the following rules:

- You will run ```k``` sessions and hire exactly one worker in each session.
- In each hiring session, choose the worker with the lowest cost from either the first ```candidates``` workers or the last candidates workers. Break the tie by the smallest index.
  - For example, if ```costs = [3,2,7,7,1,2]``` and ```candidates = 2```, then in the first hiring session, we will choose the 4<sup>th</sup> worker because they have the lowest cost ```[3,2,7,7,1,2]```.
  - In the second hiring session, we will choose 1<sup>st</sup> worker because they have the same lowest cost as 4<sup>th</sup> worker but they have the smallest index ```[3,2,7,7,2]```. Please note that the indexing may be changed in the process.
- If there are fewer than candidates workers remaining, choose the worker with the lowest cost among them. Break the tie by the smallest index.
- A worker can only be chosen once.

Return _the total cost to hire exactly ```k``` workers_.

---

__Example 1__:
```
Input: costs = [17,12,10,2,7,2,11,20,8], k = 3, candidates = 4
Output: 11
Explanation: We hire 3 workers in total. The total cost is initially 0.
- In the first hiring round we choose the worker from [17,12,10,2,7,2,11,20,8]. The lowest cost is 2, and we break the tie by the smallest index, which is 3. The total cost = 0 + 2 = 2.
- In the second hiring round we choose the worker from [17,12,10,7,2,11,20,8]. The lowest cost is 2 (index 4). The total cost = 2 + 2 = 4.
- In the third hiring round we choose the worker from [17,12,10,7,11,20,8]. The lowest cost is 7 (index 3). The total cost = 4 + 7 = 11. Notice that the worker with index 3 was common in the first and last four workers.
The total hiring cost is 11.
```

__Example 2__:
```
Input: costs = [1,2,4,1], k = 3, candidates = 3
Output: 4
Explanation: We hire 3 workers in total. The total cost is initially 0.
- In the first hiring round we choose the worker from [1,2,4,1]. The lowest cost is 1, and we break the tie by the smallest index, which is 0. The total cost = 0 + 1 = 1. Notice that workers with index 1 and 2 are common in the first and last 3 workers.
- In the second hiring round we choose the worker from [2,4,1]. The lowest cost is 1 (index 2). The total cost = 1 + 1 = 2.
- In the third hiring round there are less than three candidates. We choose the worker from the remaining workers [2,4]. The lowest cost is 2 (index 0). The total cost = 2 + 2 = 4.
The total hiring cost is 4.
```

__Constraints__:

- ```1 <= costs.length <= 10^5``` 
- ```1 <= costs[i] <= 10^5```
- ```1 <= k, candidates <= costs.length```

---

### Priority Queue

#### 2 Priority Queues

![image](https://leetcode.com/problems/total-cost-to-hire-k-workers/Figures/2462/1.png)

![image](https://leetcode.com/problems/total-cost-to-hire-k-workers/Figures/2462/2.png)

![image](https://leetcode.com/problems/total-cost-to-hire-k-workers/Figures/2462/3.png)

![image](https://leetcode.com/problems/total-cost-to-hire-k-workers/Figures/2462/4.png)

![image](https://leetcode.com/problems/total-cost-to-hire-k-workers/Figures/2462/5.png)

![image](https://leetcode.com/problems/total-cost-to-hire-k-workers/Figures/2462/6.png)

__Algorithm__

1. Initialize two priority queues ```heads``` workers and ```tails``` workers that store the first ```m``` workers and the last ```m``` workers, where the worker with the lowest cost has the highest priority.
2. Set up two pointers ```next_head = m```, ```next_tail = n - m - 1``` indicating the next worker to be added to two queues.
3. Compare the top workers in both queues, and hire the one with the lowest cost, if both workers have the same cost, hire the worker from ```heads```. Add the cost of this worker to the total cost.
4. If ```next_head <= next_tail```, we need to fill the queue with one worker:
- If the hired worker is from ```heads``` workers, we add the worker ```costs[next_head]``` to it and increment ```next_head``` by ```1```.
- If the hired worker is from ```tails``` workers, we add the worker ```costs[tail_head]``` to it and decrement ```tail_head``` by ```1```.
5. Otherwise, skip this step.
6. Repeat steps 3 and 4 ```k``` times.
7. Return the total cost of all the hired workers.

```Python
class Solution:
    def totalCost(self, costs: List[int], k: int, candidates: int) -> int:
        heads = costs[:candidates]
        tails = costs[max(candidates, len(costs) - candidates):]

        heapify(heads)
        heapify(tails)

        ans = 0
        next_head, next_tail = candidates, len(costs) - 1 - candidates

        for _ in range(k):
            if not tails or heads and heads[0] <= tails[0]:
                ans += heappop(heads)

                if next_head <= next_tail:
                    heappush(heads, costs[next_head])
                    next_head += 1
            
            else:
                ans += heappop(tails)

                if next_head <= next_tail:
                    heappush(tails, costs[next_tail])
                    next_tail -= 1
                
        return ans
```
