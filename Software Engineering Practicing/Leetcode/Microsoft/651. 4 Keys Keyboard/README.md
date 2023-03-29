## [651. 4 Keys Keyboard](https://leetcode.com/problems/4-keys-keyboard/)

```Tag```: ```Dynamic Programming``` ```Math```

#### Difficulty: Medium

Imagine you have a special keyboard with the following keys:

- A: Print one ```'A'``` on the screen.
- Ctrl-A: Select the whole screen.
- Ctrl-C: Copy selection to buffer.
- Ctrl-V: Print buffer on screen appending it after what has already been printed.

Given an integer ```n```, return _the maximum number of ```'A'``` you can print on the screen with at most n presses on the keys_.

![image](https://user-images.githubusercontent.com/35042430/228407757-8953d1e5-7b8d-41c8-bf80-eca0368f87d6.png)

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

- ```1 <= n <= 50```

---

#### Bottom-Up Dynamic Programming (2D Tabulation)

```Python
class Solution:
    def maxA(self, n: int) -> int:
        # Bottom-Up Dynamic Programming
        
        # 3 scenarios:
        # 1. Press 1 key to print 'A'
        # 2. Print Ctrl V to paste the buffer in the clipboard
        # 3. Print Ctrl A + Ctrl C + Ctrl V to double the number of 'A'

        # To store the results of 3 scenarios
        dp = [[0] * (n + 1) for _ in range(3)]
        # To store the current number of 'A' in clipboard of scenario 2 and 3
        clipboard = [[0] * (n + 1) for _ in range(2)]

        for i in range(1, n + 1):
            # Scenario 1
            dp[0][i] = max(dp[0][i - 1], dp[1][i - 1], dp[2][i - 1]) + 1

            # Scenario 2
            if i >= 1:
                # Paste result of scenario 2
                scenario_2 = dp[1][i - 1] + clipboard[0][i - 1]
                # Paste result of scenario 3
                scenario_3 = dp[2][i - 1] + clipboard[1][i - 1]
                # Check which scenario yields more 'A'
                if scenario_2 <= scenario_3:
                    dp[1][i] = scenario_3
                    clipboard[0][i] = clipboard[1][i - 1]
                else:
                    dp[1][i] = scenario_2
                    clipboard[0][i] = clipboard[0][i - 1]

            # Scenario 3
            if i >= 3:
                clipboard[1][i] = max(dp[0][i - 3], dp[1][i - 3], dp[2][i - 3])
                dp[2][i] = clipboard[1][i] * 2

        return max(dp[i][-1] for i in range(3))
```

#### Bottom-Up Dynamic Programming (1D Array)

- __Time complexity__: ```O(n)```.
- __Space complexity__: ```O(n)```.

__Algorithm__

1. Create an array ```dp``` of length ```n + 1```. Initialize ```dp[i] = i```.
2. Iterate with a variable ```i``` until ```n − 3```:
    - For each ```j``` from ```i + 3``` to ```min⁡(n, i + 6)```, update (if greater) ```dp[j]``` with ```(j − i − 1) * dp[i]```.
3. Return ```dp[n]```.

```Python
class Solution:
    def maxA(self, n: int) -> int:
        dp = list(range(n + 1))
        for i in range(n - 2):
            for j in range(i + 3, min(n, i + 6) + 1):
                dp[j] = max(dp[j], (j - i - 1) * dp[i])
        return dp[n]
```

We can prove that the operations can be simplified into two types:

- 1 move: Add one ```A```.
- k + 1 moves: Multiply the number of ```A```'s by ```k```

Say ```dp[k]``` is the maximum number of ```A```'s that can be printed after ```k``` moves. The last (simplified) operation must have been addition or multiplication. Thus, ```dp[k] = max(dp[k - 1] + 1, dp[k - 2] * 1, dp[k - 3] * 2, dp[k - 4] * 3, ...)```.

```Python
class Solution:
    def maxA(self, n: int) -> int:
        dp = [0, 1]
        for i in range(2, n + 1):
            curr = dp[i - 1] + 1
            for j in range(i - 1):
                curr = max(curr, dp[j] * (i - j - 1))
            best.append(curr)
        return dp[n]
```
