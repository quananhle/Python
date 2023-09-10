## [1359. Count All Valid Pickup and Delivery Options](https://leetcode.com/problems/count-all-valid-pickup-and-delivery-options/)

```Tag```: ```Dynamic Programming```

#### Difficulty: Hard

Given ```n``` orders, each order consist in pickup and delivery services. 

Count all valid pickup/delivery possible sequences such that delivery(i) is always after of pickup(i). 

Since the answer may be too large, return it modulo $10^{9} + 7$.

![image](https://github.com/quananhle/Python/assets/35042430/2d24b79d-b614-49dc-a4b5-2c7033681fd0)

---

__Example 1:__
```
Input: n = 1
Output: 1
Explanation: Unique order (P1, D1), Delivery 1 always is after of Pickup 1.
```

__Example 2:__
```
Input: n = 2
Output: 6
Explanation: All possible orders: 
(P1,P2,D1,D2), (P1,P2,D2,D1), (P1,D1,P2,D2), (P2,P1,D1,D2), (P2,P1,D2,D1) and (P2,D2,P1,D1).
This is an invalid order (P1,D2,P2,D1) because Pickup 2 is after of Delivery 2.
```

__Example 3:__
```
Input: n = 3
Output: 90
```

__Constraints:__

- $1 \le n \le 500$

--- 

![image](https://leetcode.com/problems/count-all-valid-pickup-and-delivery-options/Figures/1359/Slide1.PNG)

### The Framework

Let's say we have ```unpicked``` number of orders that have not been picked up and ```undelivered``` number orders to be delivered.
If we want to pick one order then there are ```unpicked``` different choices to pick at the current step. Or if we want to deliver one order then there are ```undelivered - unpicked``` (orders which are picked but not delivered) different choices.

Hence, we can say,

```JavaScript
// If we want to pick one order then,
waysToPick = unpicked * totalWays(unpicked - 1, undelivered)

// If we want to deliver one order then,    
waysToDeliver = (undelivered - unpicked) * totalWays(unpicked, undelivered - 1)
```

#### Top-Down Dynamic Programming

![image](https://leetcode.com/problems/count-all-valid-pickup-and-delivery-options/Figures/1359/Slide2.PNG)

```Python

```

```Python
class Solution:
    def countOrders(self, n: int) -> int:
        MOD = 10**9 + 7

        @functools.lru_cache(maxsize=None)
        def dp(unpicked, undelivered):
            # Base case
            if unpicked < 0 or undelivered < 0 or undelivered < unpicked:
                return 0

            if not unpicked and not undelivered:
                return 1

            # DP Transitions: 
            pick_up = unpicked * dp(unpicked - 1, undelivered) % MOD

            deliver = (undelivered - unpicked) * dp(unpicked, undelivered - 1) % MOD

            return pick_up + deliver

        return dp(n, n)
```

#### Bottom-Up Dynamic Programming

```Python

```

```Python

```
