## 1833. Maximum Ice Cream Bars

```Tag```: ```Greedy Algorithms``` ```Heapify``` ```Sorting``` ```Bucket Sort``` ```Priority Queue```

#### Difficulty: Medium

It is a sweltering summer day, and a boy wants to buy some ice cream bars.

At the store, there are ```n``` ice cream bars. You are given an array ```costs``` of length ```n```, where ```costs[i]``` is the price of the i<sup>th</sup> ice cream bar in coins. The boy initially has ```coins``` coins to spend, and he wants to buy as many ice cream bars as possible. 

Return __the __maximum__ number of ice cream bars the boy can buy with ```coins``` coins__.

Note: The boy can buy the ice cream bars in any order.

---

__Example 1:__
```
Input: costs = [1,3,2,4,1], coins = 7
Output: 4
Explanation: The boy can buy ice cream bars at indices 0,1,2,4 for a total price of 1 + 3 + 2 + 1 = 7.
```

__Example 2:__
```
Input: costs = [10,6,8,7,7,8], coins = 5
Output: 0
Explanation: The boy cannot afford any of the ice cream bars.
```

__Example 3:__
```
Input: costs = [1,6,3,1,2,5], coins = 20
Output: 6
Explanation: The boy can buy all the ice cream bars for a total price of 1 + 6 + 3 + 1 + 2 + 5 = 18.
```

__Constraints:__
```
costs.length == n
1 <= n <= 105
1 <= costs[i] <= 105
1 <= coins <= 108
```

---

### Priority Queue

```Python
class Solution:
    def maxIceCream(self, costs: List[int], coins: int) -> int:
        # Priority Queue and Greedy Algorithms
        #### Time Complexity: O(NlogN), heappop takes logN time while traversing through the size N of input list
        #### Space Complexity: O(logN), binary tree of height logN
        if not costs:
            return 0
        count = 0
        heapq.heapify(costs)
        while coins and costs:
            cost = heapq.heappop(costs)
            if coins >= cost:
                coins -= cost
                count += 1
        return count
```

### Sort()

```Python
class Solution:
    def maxIceCream(self, costs: List[int], coins: int) -> int:
        # Sort() and Greedy Algorithms
        #### Time Complexity: O(NlogN), sort operations cost NlogN time
        #### Space Complexity: O(N), extra memory space to build sorted list
        count = 0
        costs = sorted(costs)
        if not costs:
            return count
        for cost in costs:
            if coins >= cost:
                coins -= cost
                count += 1
            else:
                break
        return count
```
