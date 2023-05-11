## [746. Min Cost Climbing Stairs](https://leetcode.com/problems/min-cost-climbing-stairs)

```Tag```: ```Dynamic Programming```

#### Difficulty: Easy

You are given an integer array ```cost``` where ```cost[i]``` is the cost of i<sup>th</sup> step on a staircase. Once you pay the cost, you can either climb one or two steps.

You can either start from the step with index ```0```, or the step with index ```1```.

Return _the minimum cost to reach the top of the floor_.

![image](https://user-images.githubusercontent.com/35042430/218664062-1878a5c7-f879-491d-9f0c-212c08687493.png)

---

__Example 1:__
```
Input: cost = [10,15,20]
Output: 15
Explanation: You will start at index 1.
- Pay 15 and climb two steps to reach the top.
The total cost is 15.
```

__Example 2:__
```
Input: cost = [1,100,1,1,1,100,1,1,100,1]
Output: 6
Explanation: You will start at index 0.
- Pay 1 and climb two steps to reach index 2.
- Pay 1 and climb two steps to reach index 4.
- Pay 1 and climb two steps to reach index 6.
- Pay 1 and climb one step to reach index 7.
- Pay 1 and climb two steps to reach index 9.
- Pay 1 and climb one step to reach the top.
The total cost is 6.
```

__Constraints:__

- ```2 <= cost.length <= 1000```
- ```0 <= cost[i] <= 999```

---

### The Framework

#### Top-Down Recursion

__Time Complexity__: ```O(N)```, recursive call every element of input array

__Space Complexity__: ```O(N)```, recursive call stack size

```Python
class Solution:
    def minCostClimbingStairs(self, cost: List[int]) -> int:
        # Top-Down DP (Recursive)
        memo = collections.defaultdict(int)
        n = len(cost)
        def dp(i):
            # Base cases:
            if i <= 1:
                return 0
            if i in memo:
                return memo[i]
            # Recurrence relation
            memo[i] = min(dp(i - 1) + cost[i-1], dp(i - 2) + cost[i-2])
            return memo[i]

        return dp(n)
```

```Python
class Solution:
    def minCostClimbingStairs(self, cost: List[int]) -> int:
        n = len(cost)
        if n < 2:
            return min(cost)
        memo = [0 for _ in range(n + 1)]

        def dp(i):
            # Base case
            # The top can be reached from second to last step
            if i >= len(cost) - 2:
                return 0
            
            if memo[i]:
                return memo[i]

            # Recurrence relation
            memo[i] = min(dp(i + 1) + cost[i + 1], dp(i + 2) + cost[i + 2])
            return memo[i]
        
        return dp(-1)
```

#### Bottom-Up Tabulation

__Time Complexity__: ```O(N)```, iterate through the entire input array

__Space Complexity__: ```O(N)```, hash map memo size

```Python
class Solution:
    def minCostClimbingStairs(self, cost: List[int]) -> int:
        # Bottom-Up DP (Tabulation)
        memo = collections.defaultdict(int)
        n = len(cost)
        for i in range(2, len(cost)+1):
            memo[i] = min(memo[i-1] + cost[i-1], memo[i-2] + cost[i-2])
        return memo[n]
```

#### Bottom-Up Iteration

__Time Complexity__: ```O(N)```, iterate through the entire input array

__Space Complexity__: ```O(1)```, constant space for pointers

```Python
class Solution:
    def minCostClimbingStairs(self, cost: List[int]) -> int:
        # Bottom-Up DP (Iterative)
        '''
        for i in range(2, len(cost)):
            cost[i] = min(cost[i-1], cost[i-2]) + cost[i]
        return min(cost[-1], cost[-2])
        '''
        climb1 = climb2 = 0
        for i in range(2, len(cost) + 1):
            tmp = climb1
            climb1 = min(climb1 + cost[i-1], climb2 + cost[i-2])
            climb2 = tmp
        return climb1
```
