## 746. Min Cost Climbing Stairs

#### Difficulty: Easy

You are given an integer array ```cost``` where ```cost[i]``` is the cost of i<sup>th</sup> step on a staircase. Once you pay the cost, you can either climb ```one``` or ```two``` steps.

You can either start from the step with index ```0```, or the step with index ```1```.

Return _the minimum cost to reach the top of the floor_.

![image](https://user-images.githubusercontent.com/35042430/206831275-8f52e4f1-8bed-4a6e-8258-3671fdb927c3.png)

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
```
2 <= cost.length <= 1000
0 <= cost[i] <= 999
```

---

### Bottom-Up Dynamic Programming with Tabulation

```Python
class Solution(object):
    def minCostClimbingStairs(self, cost):
        """
        :type cost: List[int]
        :rtype: int
        """
        '''
        cost = 2, min(cost)
        cost = 3, min(0+2,1)
        cost = 4, min(0+2,1+2,1+3)
        '''
        # Bottom-Up Dynamic Programming with Tabulation
        #### Time Complexity: O(N), traverse through the end of cost
        #### Space Complexity: O(N), stack keeps up to the size N of input
        """
        dp = [0 for i in range(len(cost)+1)]
        for i in range(2, len(cost)+1):
            climb_one = dp[i-1] + cost[i-1]
            climb_two = dp[i-2] + cost[i-2]
            dp[i] = min(climb_one, climb_two)
        return dp[-1]
        """
        dp = [0 for i in range(len(cost))]
        dp[0], dp[1] = cost[0], cost[1]
        for i in range(2, len(cost)):
            dp[i] = min(dp[i-2], dp[i-1]) + cost[i]
        return min(dp[-1], dp[-2])
```

### Top-Down Dynamic Programming with Memoization

```Python
class Solution(object):
    def minCostClimbingStairs(self, cost):
        """
        :type cost: List[int]
        :rtype: int
        """
        # Top-Down Dynamic Programming with Memoization
        #### Time Complexity: O(N), recusively traverse through the end of cost
        #### Space Complexity: O(1), hash table keeps up to the size N of input   
        """
        def dfs(n):
            if n <= 1:
                return 0
            if n in memo:
                return memo[n]
            
            climb_one = cost[n-1] + dfs(n-1)
            climb_two = cost[n-2] + dfs(n-2)
            memo[n] = min(climb_one, climb_two)
            return memo[n]
        
        memo = dict()
        return dfs(len(cost))
```

### Iterative Bottom-Up Dynamic Programming

```Python
class Solution(object):
    def minCostClimbingStairs(self, cost):
        """
        :type cost: List[int]
        :rtype: int
        """
        # Iterative Bottom-Up Dynamic Programming
        #### Time Complexity: O(N), traverse through the end of cost
        #### Space Complexity: O(1), constant pointers memory space
        if cost <= 1:
            return 0
        climb_one, climb_two = cost[0], cost[1]
        for i in range(2, len(cost)):
            current = min(climb_one, climb_two) + cost[i]
            climb_one = climb_two
            climb_two = current
        return min(climb_two, climb_one)
```

```Python
class Solution(object):
    def minCostClimbingStairs(self, cost):
        """
        :type cost: List[int]
        :rtype: int
        """
        # Iterative Dynamic Programming
        #### Time Complexity: O(N), traverse through the end of cost
        #### Space Complexity: O(1), modify in-space memory

        for i in range(2, len(cost)):
            cost[i] = min(cost[i-2], cost[i-1]) + cost[i]
        return min(cost[-1], cost[-2])
```
