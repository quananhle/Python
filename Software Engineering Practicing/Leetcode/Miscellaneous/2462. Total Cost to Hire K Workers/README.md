## [2462. Total Cost to Hire K Workers](https://leetcode.com/problems/total-cost-to-hire-k-workers/)

```Tag```:

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
