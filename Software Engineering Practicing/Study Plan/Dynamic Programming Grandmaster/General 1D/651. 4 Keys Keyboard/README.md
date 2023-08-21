## 651. [4 Keys Keyboard](https://leetcode.com/problems/4-keys-keyboard)

```Tag```: ```Dynamic Programming``` ```Recursive```

#### Difficulty: Medium

Imagine you have a special keyboard with the following keys:

- ```A```: Print one ```'A'``` on the screen.
- ```Ctrl-A```: Select the whole screen.
- ```Ctrl-C```: Copy selection to buffer.
- ```Ctrl-V```: Print buffer on screen appending it after what has already been printed.

Given an integer ```n```, return _the maximum number of ```'A'``` you can print on the screen with at most ```n``` presses on the keys_.

![image](https://github.com/quananhle/Python/assets/35042430/483d12c7-6cd8-4d26-b94e-83a616d014ec)

---

__Example 1:__
```
Input: n = 3
Output: 3
Explanation: We can at most get 3 A's on screen by pressing the following key sequence:
A, A, A
```

__Example 2:__
```
Input: n = 7
Output: 9
Explanation: We can at most get 9 A's on screen by pressing following key sequence:
A, A, A, Ctrl A, Ctrl C, Ctrl V, Ctrl V
```

__Constraints:__

- $1 \le n \le 50$

---

### Brute Force

There is no need to press ```Ctrl+V``` more than four times in a row. Let the current length be $l$. Assume we press ```Ctrl+A```, ```Ctrl+C```, then ```Ctrl+V``` $5$ times. After this sequence, the length becomes $6l$, and the buffer contains $l$ characters.

However, if we press ```Ctrl+A, Ctrl+C, Ctrl+V, Ctrl+A, Ctrl+C, Ctrl+V, Ctrl+V``` instead, the length also becomes $6l$, but the buffer contains $2l$ characters now, which is not worse than in the former case. In both scenarios, we used seven presses.

Now we want to describe transitions (the recurrence relation). As stated above, it is inefficient to press ```Ctrl+V``` $5$ times or more in a row. This means we will press ```Ctrl+A```, ```Ctrl+C```, and then ```Ctrl+V``` up to four times:

- $dp[i+3]=2⋅dp[i]\text{dp}[i + 3] = 2 \cdot \text{dp}[i]dp[i+3]=2⋅dp[i]$
- $dp[i+4]=3⋅dp[i]\text{dp}[i + 4] = 3 \cdot \text{dp}[i]dp[i+4]=3⋅dp[i]$
- $dp[i+5]=4⋅dp[i]\text{dp}[i + 5] = 4 \cdot \text{dp}[i]dp[i+5]=4⋅dp[i]$
- $dp[i+6]=5⋅dp[i]\text{dp}[i + 6] = 5 \cdot \text{dp}[i]dp[i+6]=5⋅dp[i]$

In general, we have dp[j]=(j−i−1)⋅dp[i]\text{dp}[j] = (j - i - 1) \cdot \text{dp}[i]dp[j]=(j−i−1)⋅dp[i], where i+3≤j≤i+6i + 3 \le j \le i + 6i+3≤j≤i+6. We want to take the maximum value, and this gives us our recurrence relation.

```Python
class Solution:
    def maxA(self, n: int) -> int:
        if n <= 5:
            return n

        return max(n, max(i * self.maxA(n - i - 1) for i in [3, 4, 5, 6]))
```

### The Frameworkd

#### Top-Down Dynamic Programming

```Python

```

```Python
class Solution:
    def maxA(self, n: int) -> int:
        # Time Limit Exceeded
        @lru_cache(maxsize=None)
        def dp(curr, total, selected, buffered):
            # Base case
            if curr == n:
                return total
            
            # DP Transitions: should press 'A' better than select + copy + paste?
            a = dp(curr + 1, total + 1, selected, buffered)
            select = dp(curr + 1, total, total, buffered)
            copy = dp(curr + 1, total, selected, selected)
            paste = dp(curr + 1, total + buffered, selected, buffered)
        
            return max(a, select, copy, paste)
        
        return dp(0, 0, 0, 0)
```

```Python
class Solution:
    def maxA(self, n: int) -> int:
        @lru_cache(maxsize=None)
        def dp(curr, total, buffered):
            # Base case
            if curr > n:
                return 0
            
            if curr == n:
                return total

            # DP Transitions: should press 'A' better than select + copy + paste, and repeated paste after that?
            ans = max(
                # 'A': press 1 character at a time, increment the total printed characters by 1, buffered number remains same
                dp(curr + 1, total + 1, buffered),
                # Ctrl + A, Ctrl + C, Ctrl + V: 3 presses, double the total printed characters, update buffered size
                dp(curr + 3, total + total, total),
                # Ctrl + V: 1 press, increment the total printed character by buffered size, buffered size remains same
                dp(curr + 1, total + buffered, buffered)
            )

            return ans
        
        return dp(0, 0, 0)
```

#### Bottom-Up Dynamic Programming

```Python

```

```Python

```



