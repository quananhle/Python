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

- $1 \le costs.length \le 10^{5}$ 
- $1 \le costs[i] \le 10^{5}$
- $1 \le k, candidates \le costs.length$

---

### Priority Queue

#### 2 Priority Queues

__Algorithm__

![image](https://leetcode.com/problems/total-cost-to-hire-k-workers/Figures/2462/1.png)

1. Initialize two priority queues ```heads``` workers and ```tails``` workers that store the first ```m``` workers and the last ```m``` workers, where the worker with the lowest cost has the highest priority.

![image](https://leetcode.com/problems/total-cost-to-hire-k-workers/Figures/2462/2.png)

2. Set up two pointers ```next_head = m```, ```next_tail = n - m - 1``` indicating the next worker to be added to two queues.

![image](https://leetcode.com/problems/total-cost-to-hire-k-workers/Figures/2462/3.png)

3. Compare the top workers in both queues, and hire the one with the lowest cost, if both workers have the same cost, hire the worker from ```heads```. Add the cost of this worker to the total cost.

![image](https://leetcode.com/problems/total-cost-to-hire-k-workers/Figures/2462/4.png)

4. If ```next_head <= next_tail```, we need to fill the queue with one worker:
  - If the hired worker is from ```heads``` workers, we add the worker ```costs[next_head]``` to it and increment ```next_head``` by ```1```.
  - If the hired worker is from ```tails``` workers, we add the worker ```costs[tail_head]``` to it and decrement ```tail_head``` by ```1```.

![image](https://leetcode.com/problems/total-cost-to-hire-k-workers/Figures/2462/5.png)

5. Otherwise, skip this step.

6. Repeat steps 3 and 4 ```k``` times.

![image](https://leetcode.com/problems/total-cost-to-hire-k-workers/Figures/2462/6.png)

7. Return the total cost of all the hired workers.

- __Time Complexity__: $\mathcal{O}((k+m) \cdot \mathcal{log}(⁡m))$
- __Space Complexity__: $\mathcal{O}(m)$

```Python
class Solution:
    def totalCost(self, costs: List[int], k: int, candidates: int) -> int:
        n = len(costs)
        # First candidates workers
        head = costs[:candidates]
        # Last candidates workers or the remaining of candidates workers, whichever is greater
        tail = costs[max(candidates, n - candidates):]
        heapify(head)
        heapify(tail)

        ans = 0
        # Pointers indicating the next worker to be added to two queues
        next_head, next_tail = candidates, n - 1 - candidates
        
        # Run k sessions
        for _ in range(k):
            # If there are no workers left in tail or comparing the cheapest workers in two queues
            if (not tail) or (head and head[0] <= tail[0]):
                # Hire the worker from head
                ans += heappop(head)

                # Add next worker to head
                if next_head <= next_tail:
                    heappush(head, costs[next_head])
                    next_head += 1
            # Otherwise, if there are workers left in tail or the cheapest worker is from tail 
            else:
                # Hire the worker from tail
                ans += heappop(tail)

                # Add next worker to tail
                if next_head <= next_tail:
                    heappush(tail, costs[next_tail])
                    next_tail -= 1
                
            # If tail pointer is larger than head pointer, there are no more workers outside of the queue to hire
        return ans
```

#### 1 Priority Queue

![image](https://leetcode.com/problems/total-cost-to-hire-k-workers/Figures/2462/7.png)

![image](https://leetcode.com/problems/total-cost-to-hire-k-workers/Figures/2462/8.png)

```Python
class Solution:
    def totalCost(self, costs: List[int], k: int, candidates: int) -> int:
        n = len(costs)
        h = list()

        # 0 for the first candidates workers, and 1 for the last candidates workers
        for i in range(candidates):
            h.append((costs[i], 0))
        for i in range(max(candidates, n - candidates), n):
            h.append((costs[i], 1))
        
        heapify(h)
        ans = 0
        next_head, next_tail = candidates, n - 1 - candidates

        for _ in range(k):
            curr_cost, curr_id = heapq.heappop(h)
            ans += curr_cost

            if next_head <= next_tail:
                if curr_id == 0:
                    heappush(h, (costs[next_head], 0))
                    next_head += 1
                else:
                    heappush(h, (costs[next_tail], 1))
                    next_tail -= 1
            
        return ans
```
