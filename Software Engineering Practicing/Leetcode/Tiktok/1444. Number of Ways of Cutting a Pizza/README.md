## [1444. Number of Ways of Cutting a Pizza](https://github.com/quananhle/Python/edit/main/Software%20Engineering%20Practicing/Leetcode/Tiktok/1444.%20Number%20of%20Ways%20of%20Cutting%20a%20Pizza/)

```Tag```: ```Dynamic Programming```

#### Difficulty: Hard

Given a rectangular ```pizza``` represented as a ```rows x cols``` matrix containing the following characters: ```'A'``` (an apple) and ```'.'``` (empty cell) and given the integer ```k```. You have to cut the pizza into ```k``` pieces using ```k - 1``` cuts. 

For each cut you choose the direction: vertical or horizontal, then you choose a cut position at the cell boundary and cut the pizza into two pieces. If you cut the pizza vertically, give the left part of the pizza to a person. If you cut the pizza horizontally, give the upper part of the pizza to a person. Give the last piece of pizza to the last person.

Return _the number of ways of cutting the pizza such that each piece contains at least one apple_. Since the answer can be a huge number, return _this modulo 10^9 + 7_.

![image](https://user-images.githubusercontent.com/35042430/229003199-f21a3e55-2fb0-4e79-b899-91f0d64aba50.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/04/23/ways_to_cut_apple_1.png)
```
Input: pizza = ["A..","AAA","..."], k = 3
Output: 3 
Explanation: The figure above shows the three ways to cut the pizza. Note that pieces must contain at least one apple.
```

__Example 2:__
```
Input: pizza = ["A..","AA.","..."], k = 3
Output: 1
```

__Example 3:__
```
Input: pizza = ["A..","A..","..."], k = 1
Output: 1
```

__Constraints:__

- ```1 <= rows, cols <= 50```
- ```rows == pizza.length```
- ```cols == pizza[i].length```
- ```1 <= k <= 10```
- ```pizza``` consists of characters ```'A'``` and ```'.'``` only

---

### The Framework

1. The state of the DP is the triplet ```(row, col, remain)```.

2. The matrix apples is the cumulative region sum matrix. One can calculate this matrix using the reccurrence relation

```
apples[row][col] = (pizza[row][col] == 'A') + apples[row + 1][col] + apples[row][col + 1] - apples[row + 1][col + 1]
```

3. The base case of the DP is ```remain = 0``` when one does not need to make any more cuts. If ```pizza[row..rows-1][col..cols-1]``` contains at least one apple, then ```dp[0][row][col] = 1``` – there is one way to make no cuts and give the piece to the last person. Otherwise, ```pizza[row..rows-1][col..cols-1]``` contains no apples, and there are no ways to give the piece to the person, thus ```dp[0][row][col] = 0```.

![image](https://leetcode.com/problems/number-of-ways-of-cutting-a-pizza/Figures/1444/cuts.drawio.png)

#### Top-Down Dynamic Programming

```Python
class Solution:
    def ways(self, pizza: List[str], k: int) -> int:
        ROWS, COLS = len(pizza), len(pizza[0])

        apples = [[0] * (COLS + 1) for _ in range(ROWS + 1)]
        for row in range(ROWS - 1, -1, -1):
            for col in range(COLS - 1, -1, -1):
                apples[row][col] = (1 if pizza[row][col] == 'A' else 0) \
                                    + apples[row + 1][col] + apples[row][col + 1] \
                                    - apples[row + 1][col + 1]

        memo = collections.defaultdict(int)

        def dp(curr_row, curr_col, remaining):
            # Base cases
            if apples[curr_row][curr_col] == 0:
                return 0

            if remaining == 0:
                return 1

            if (curr_row, curr_col, remaining) in memo:
                return memo[(curr_row, curr_col, remaining)]

            ans = 0
            curr_cut = apples[curr_row][curr_col]

            for next_row in range(curr_row + 1, ROWS):
                if curr_cut - apples[next_row][curr_col]:
                    ans += dp(next_row, curr_col, remaining - 1)

            for next_col in range(curr_col + 1, COLS):
                if curr_cut - apples[curr_row][next_col]:
                    ans += dp(curr_row, next_col, remaining - 1)

            memo[(curr_row, curr_col, remaining)] = ans
            return ans

        return dp(0, 0, k - 1) % (10**9 + 7)
```

```Python
class Solution:
    def ways(self, pizza: List[str], k: int) -> int:
        def check_apple(curr_row, curr_col, last_row, last_col):
            for row in range(curr_row, last_row + 1):
                for col in range(curr_col, last_col + 1):
                    if pizza[row][col] == 'A':
                        return True
            return False

        ROWS, COLS = len(pizza), len(pizza[0])

        @lru_cache(None)
        def dp(curr_row, curr_col, remaining):
            last_row, last_col = ROWS - 1, COLS - 1
            # Base case
            if remaining == 1:
                if check_apple(curr_row, curr_col, last_row, last_col):
                    return 1

            ans = 0

            for next_col in range(curr_col + 1, COLS):
                if check_apple(curr_row, curr_col, last_row, next_col - 1):
                    ans += dp(curr_row, next_col, remaining - 1)

            for next_row in range(curr_row + 1, ROWS):
                if check_apple(curr_row, curr_col, next_row - 1, last_col):
                    ans += dp(next_row, curr_col, remaining - 1)

            return ans

        return dp(0, 0, k) % (10**9 + 7)
```

```Python
class Solution:
    def ways(self, pizza: List[str], k: int) -> int:
        ROWS, COLS = len(pizza), len(pizza[0])

        apples = [[0] * (COLS + 1) for _ in range(ROWS + 1)]
        for row in range(ROWS - 1, -1, -1):
            for col in range(COLS - 1, -1, -1):
                apples[row][col] = (1 if pizza[row][col] == 'A' else 0) + \
                                   apples[row + 1][col] + apples[row][col + 1] - apples[row + 1][col + 1]

        @lru_cache(None)
        def dp(curr_row, curr_col, remaining):
            # Base cases
            if apples[curr_row][curr_col] == 0:
                return 0

            if remaining == 0:
                return 1

            ans = 0
            curr_cut = apples[curr_row][curr_col]

            for next_row in range(curr_row + 1, ROWS):
                if curr_cut - apples[next_row][curr_col]:
                    ans += dp(next_row, curr_col, remaining - 1)

            for next_col in range(curr_col + 1, COLS):
                if curr_cut - apples[curr_row][next_col]:
                    ans += dp(curr_row, next_col, remaining - 1)

            return ans

        return dp(0, 0, k - 1) % (10**9 + 7)
```

#### Bottom-Up Dynamic Programming

__Algorithm__

1. Declare the matrices ```apples[rows + 1][cols + 1]``` and ```dp[k][rows][cols]```.
2. First, calculate ```apples```. Iterate ```row``` from ```rows - 1``` to ```0```.
    - Iterate ```col``` from ```cols - 1``` to ```0```.
        - Calculate ```apples[row][col]``` as ```(pizza[row][col] == 'A') + apples[row + 1][col] + apples[row][col + 1] - apples[row + 1][col + 1]```.
        - If ```apples[row][col] > 0```, set ```dp[0][row][col] = 1```, otherwise set ```dp[0][row][col] = 0``` (the base case of the DP).
3. Iterate ```remain``` from ```1``` to ```k - 1```.
    - Iterate ```row``` from ```0``` to ```rows - 1```.
        - Iterate ```col``` from ```0``` to ```cols - 1```.
            - We will now calculate ```dp[remain][row][col]``` by considering all cuts.
            - Consider all horizontal cuts. Iterate ```next_row``` from ```row + 1``` to ```rows - 1```.
                - If the top piece has an apple, i.e. ```apples[row][col] - apples[next_row][col] > 0```, add ```dp[remain-1][next_row][col]``` to ```dp[remain][row][col]```.
            - Consider all vertical cuts. Iterate ```next_col``` from ```col + 1``` to ```cols - 1```.
                - If the left piece has an apple, i.e. ```apples[row][col] - apples[row][next_col] > 0```, add ```dp[remain-1][row][next_col]``` to ```dp[remain][row][col]```.
4. Return ```dp[k-1][0][0]```. This represents the original pizza with ```k - 1``` cuts, which is what the original problem is asking for.

```Python
class Solution:
    def ways(self, pizza: List[str], k: int) -> int:
        ROWS, COLS = len(pizza), len(pizza[0])

        apples = [[0] * (COLS + 1) for _ in range(ROWS + 1)]
        for row in range(ROWS - 1, -1, -1):
            for col in range(COLS - 1, -1, -1):
                apples[row][col] = (1 if pizza[row][col] == 'A' else 0) \
                                    + apples[row + 1][col] + apples[row][col + 1] \
                                    - apples[row + 1][col + 1]
        
        dp = [[[0] * (COLS) for _ in range(ROWS)] for _ in range(k)]
        # Base case
        dp[0] = [[int(apples[row][col] > 0) for col in range(COLS)] for row in range(ROWS)]
        mod = 10**9 + 7

        for remain in range(1, k):
            for row in range(ROWS):
                for col in range(COLS):
                    ans = 0

                    # Check the horizontal cuts
                    for next_row in range(row + 1, ROWS):
                        if apples[row][col] - apples[next_row][col] > 0:
                            ans += dp[remain - 1][next_row][col]

                    # Check the vertical cuts
                    for next_col in range(col + 1, COLS):
                        if apples[row][col] - apples[row][next_col] > 0:
                            ans += dp[remain -1][row][next_col]
                    
                    dp[remain][row][col] = ans % mod

        return dp[k - 1][0][0]
```
