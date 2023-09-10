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
class Solution:
    def countOrders(self, n: int) -> int:
        MOD = 10**9 + 7
        memo = collections.defaultdict(int)
        
        def dp(unpicked, undelivered):
            # Base case
            if unpicked < 0 or undelivered < 0 or undelivered < unpicked:
                return 0

            if not unpicked and not undelivered:
                return 1

            if (unpicked, undelivered) in memo:
                return memo[(unpicked, undelivered)]

            # DP Transitions: 
            pick_up = unpicked * dp(unpicked - 1, undelivered) % MOD

            deliver = (undelivered - unpicked) * dp(unpicked, undelivered - 1) % MOD

            memo[(unpicked, undelivered)] = pick_up + deliver
            return pick_up + deliver

        return dp(n, n)
```

```Python
class Solution:
    def countOrders(self, n: int) -> int:
        MOD = 10**9 + 7

        @functools.lru_cache(maxsize=None)
        def dp(unpicked, undelivered):
            # Base case: can't pick or deliver more than N items, and number of deliveries can't exceed number of pickups as we can only deliver after a pickup.
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

```Python
class Solution:
    def countOrders(self, n: int) -> int:
        MOD = 10**9 + 7

        @functools.lru_cache(maxsize=None)
        def dp(curr):
            # Base case
            if curr == 1:
                return 1
            
            # DP Transitions:
            ans = dp(curr - 1) * (2 * curr - 1) * curr % MOD

            return ans

        return dp(n)
```

#### Bottom-Up Dynamic Programming

```Python
class Solution:
    def countOrders(self, n: int) -> int:
        MOD = 10**9 + 7
        dp = collections.defaultdict(int)

        for unpicked in range(n + 1):
            for undelivered in range(unpicked, n + 1):
                if not unpicked and not undelivered:
                    dp[(unpicked, undelivered)] = 1
                    continue
                if unpicked > 0:
                    dp[(unpicked, undelivered)] += unpicked * dp[(unpicked - 1, undelivered)]
                dp[(unpicked, undelivered)] %= MOD

                if undelivered > unpicked:
                    dp[(unpicked, undelivered)] += (undelivered - unpicked) * dp[(unpicked, undelivered - 1)]
                dp[(unpicked, undelivered)] %= MOD
        
        return dp[(n, n)]
```

__Step 1: Setting a Starting Point (Base Case)__

- Why do we start with ```count = 1```?
Imagine you have just one order. This order has one pickup (P1) and one delivery (D1). The only rule is that the delivery (D1) must come after the pickup (P1). This gives you just one way to arrange this order: (P1, D1). So, you start your count at 1.

__Step 2: Building Up the Solution (Iterative Computation)__

- Why do we start the loop from 2?

You've already solved the problem for 1 order. Now you start adding more orders into the mix, one at a time, starting from the second order.

- What's the deal with ```2i - 1``` and ```i```?

Let's say you're at the ```i```-th order. You would have ```i``` pickups and ```i``` deliveries, making it ```2i``` positions in total.
Now, when you're adding the pickup (Pi) for the ```i-th``` order, you can put it anywhere except at the end. That's ```2i - 1``` choices for Pi.
For Di, you only have ```i``` choices, because it must come after Pi.

- How do we update ```count```?

Multiply your current count by ```(2i - 1) * i``` to get the new count. This gives you the total number of sequences for ```i``` orders.

__Step 3: The Final Answer__

- How do you get the final answer?

After you've gone through all the orders, the value in ```count``` will be the total number of valid sequences. Return this value.

```Python
class Solution:
    def countOrders(self, n: int) -> int:
        MOD = 10**9 + 7
        ans = 1

        for i in range(2, n + 1):
            ans = ans * (2 * i - 1) * i % MOD

        return ans
```
