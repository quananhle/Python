## 651. [4 Keys Keyboard](https://leetcode.com/problems/4-keys-keyboard)

```Tag```: ```Dynamic Programming```

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

### The Frameworkd

#### Top-Down Dynamic Programming

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

```

```Python

```

#### Bottom-Up Dynamic Programming

```Python

```

```Python

```



