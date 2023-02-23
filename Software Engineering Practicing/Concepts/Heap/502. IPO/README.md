## 502. IPO

```Tag```: ```Greedy``` ```Heap``` ```Dynamic Programming```

#### Difficulty: Hard

Suppose LeetCode will start its __IPO__ soon. In order to sell a good price of its shares to Venture Capital, LeetCode would like to work on some projects to increase its capital before the __IPO__. Since it has limited resources, it can only finish at most ```k``` distinct projects before the IPO. Help LeetCode design the best way to maximize its total capital after finishing at most ```k``` distinct projects.

You are given ```n``` projects where the i<sup>th<sup> project has a pure profit ```profits[i]``` and a minimum capital of ```capital[i]``` is needed to start it.

Initially, you have ```w``` capital. When you finish a project, you will obtain its pure profit and the profit will be added to your total capital.

Pick a list of __at most__ ```k``` distinct projects from given projects to __maximize your final capital__, and return _the final maximized capital_.

The answer is guaranteed to fit in a 32-bit signed integer.

![image](https://user-images.githubusercontent.com/35042430/220833147-c64f188b-75e4-4df8-a620-9c7289bde6c6.png)

---

__Example 1__:
```
Input: k = 2, w = 0, profits = [1,2,3], capital = [0,1,1]
Output: 4
Explanation: Since your initial capital is 0, you can only start the project indexed 0.
After finishing it you will obtain profit 1 and your capital becomes 1.
With capital 1, you can either start the project indexed 1 or the project indexed 2.
Since you can choose at most 2 projects, you need to finish the project indexed 2 to get the maximum capital.
Therefore, output the final maximized capital, which is 0 + 1 + 3 = 4.
```

__Example 2__:
```
Input: k = 3, w = 0, profits = [1,2,3], capital = [0,1,2]
Output: 6
```

__Constraints:__

![image](https://user-images.githubusercontent.com/35042430/220833413-64414d1f-a175-497d-b914-151ac059624a.png)

---

### Heap

#### Min Heap
    
```Python
    
```
    
#### Two Heaps
    
```Python
    
```
    
---

### Dynamic Programming

Solving the problem using the Top-Down Dynamic Programming Framework (Time Limit Exceeded)

```Python
class Solution:
    def findMaximizedCapital(self, k: int, w: int, profits: List[int], capital: List[int]) -> int:
        # Top-Down DP (Recursion)
        ### Time Limit Exceeded
        n = len(profits)
        memo = collections.defaultdict(int)
        
        def dp(i: int, total_capital: int, remaining: int) -> int:
            # Base case
            if remaining == 0 or i == len(profits) or i == len(capital):
                return total_capital

            if (i, total_capital, remaining) in memo:
                return memo[(i, total_capital, remaining)]

            for curr in range(i, len(profits)):
                if total_capital >= capital[curr]:
                    memo[(i, total_capital, remaining)] = max(total_capital, dp(curr + 1, total_capital + profits[curr], remaining - 1))

            return memo[(i, total_capital, remaining)]
        
        return dp(0, w, k)
```

```Python
class Solution:
    def findMaximizedCapital(self, k: int, w: int, profits: List[int], capital: List[int]) -> int:
        ### Time Limit Exceeded
        n = len(profits)
        
        @lru_cache(None)
        def dp(i: int, curr: int, remaining: int) -> int:
            # Base case
            if remaining == 0 or i == len(profits) or i == len(capital):
                return curr

            # initialize the maximum capital to current capital
            max_capital = curr  
            for j in range(i, len(profits)):
                if capital[j] <= curr:
                    max_capital = max(max_capital, dp(j+1, curr+profits[j], remaining-1))

            return max_capital
        
        return dp(0, w, k)
```
