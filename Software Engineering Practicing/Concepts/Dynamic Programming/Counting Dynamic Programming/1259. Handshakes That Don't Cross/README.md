## 1259. Handshakes That Don't Cross

```Tag```: ```Dynamic Programming``` ```Math```

#### Difficulty: Hard

You are given an __even__ number of people ```numPeople``` that stand around a circle and each person shakes hands with someone else so that there are ```numPeople / 2``` handshakes total.

Return _the number of ways these handshakes could occur such that none of the handshakes cross_.

Since the answer could be very large, return it __modulo__ ```10^9 + 7```.

![image](https://user-images.githubusercontent.com/35042430/220688007-d6651779-763b-4290-a4da-9bff67687ca7.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2019/07/11/5125_example_2.png)
```
Input: numPeople = 4
Output: 2
Explanation: There are two ways to do it, the first way is [(1,2),(3,4)] and the second one is [(2,3),(4,1)].
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2019/07/11/5125_example_3.png)
```
Input: numPeople = 6
Output: 5
```

__Constraints:__

- ```2 <= numPeople <= 1000```
- ```numPeople``` is even.

---

Consider a circle with ```i``` pairs of people or ```2*i``` people.

![image](https://leetcode.com/problems/handshakes-that-dont-cross/solutions/3058204/Figures/1259/1259_circle.drawio.png)

![image](https://user-images.githubusercontent.com/35042430/220707245-6eb4991c-071f-461c-9d87-773c1ca3a0f9.png)

### The Framwork

#### Top-Down Dynamic Programming (Recursion)

```Python
class Solution:
    def numberOfWays(self, numPeople: int) -> int:
        memo = collections.defaultdict(int)
        # Base case
        memo[0] = 1

        def dp(n):
            # Base case
            if n in memo:
                return memo[n]
            
            for i in range(0, n - 1, 2):
                # Recurrence relation: for 2i left people, there exist 2n - 2 - 2i right people
                memo[n] += dp(i) * dp(n - i - 2)

            return memo[n]

        return dp(numPeople) % (10**9 + 7)
```

```Python
class Solution:
    def numberOfWays(self, numPeople: int) -> int:
        @lru_cache(None)
        def dp(n):
            # Base cases
            if not n:
                return 1
            if n == 4:
                return 2

            ans = 0
            for i in range(0, n - 1, 2):
                # Recurrence relation: for 2i left people, there exist 2n - 2 - 2i right people
                ans += dp(i) * dp(n - i - 2)

            return ans

        return dp(numPeople) % (10**9 + 7)
```


#### Bottom-Up Dynamic Programming (Tabulation)

```Python
class Solution:
    def numberOfWays(self, numPeople: int) -> int:
        # Bottom-Up DP (Tabulation)
        dp = collections.defaultdict(int)
        dp[0] = 1
        n = numPeople

        for i in range(1, n + 1):
            for j in range(i):
                dp[(2*i)] += dp[(2*j)] * dp[(2*i) - (2*j) - 2]
        return dp[n] % (10**9 + 7)
```

```Python
class Solution:
    def numberOfWays(self, numPeople: int) -> int:
        dp = collections.defaultdict(int)
        dp[0] = 1
        n = numPeople

        for i in range(1, n // 2 + 1):
            for j in range(i):
                dp[i] += dp[j] * dp[i - j - 1]

        return dp[n // 2] % (10**9 + 7)
```

---

### One-Liner

```Python
class Solution:
    @lru_cache(None)
    def numberOfWays(self, numPeople: int) -> int:
        return sum(self.numberOfWays(i) * self.numberOfWays(numPeople - i - 2) for i in range(0, numPeople, 2)) % ((10**9 + 7)) if numPeople else 1
```
        
### Catalan Numbers

![image](https://leetcode.com/problems/handshakes-that-dont-cross/solutions/3058204/Figures/1259/1259_intersection.drawio.png)

![image](https://leetcode.com/problems/handshakes-that-dont-cross/solutions/3058204/Figures/1259/1259_intersection_straight.drawio.png)

```Python
class Solution:
    def numberOfWays(self, numPeople: int) -> int:
        m = (10**9 + 7)
        n = numPeople // 2
        memo = [None] * (n+2)
        memo[1] = 1
        for i in range(2, n+2):
            '''
            k = m // i
            r = m % i
            '''
            k, r = divmod(m, i)
            memo[i] = m - k * memo[r] % m
        C = 1
        for i in range(n):
            C = 2 * (2 * i + 1) * memo[i + 2] * C % m
        return C
```
