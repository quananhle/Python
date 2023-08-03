## [486. Predict the Winner](https://leetcode.com/problems/predict-the-winner/)

```Tag```: ```Recursion``` ```Dynamic Programming``` ```Math```

#### Difficulty: Medium

You are given an integer array ```nums```. Two players are playing a game with this array: player 1 and player 2.

Player 1 and player 2 take turns, with player 1 starting first. Both players start the game with a score of ```0```. At each turn, the player takes one of the numbers from either end of the array (i.e., ```nums[0]``` or ```nums[nums.length - 1]```) which reduces the size of the array by ```1```. The player adds the chosen number to their score. The game ends when there are no more elements in the array.

Return _```true``` if Player 1 can win the game_. If the scores of both players are equal, then player 1 is still the winner, and you should also return ```true```. You may assume that both players are playing optimally.

![image](https://github.com/quananhle/Python/assets/35042430/7327181e-99fe-4ad9-96f7-a2bd6166528d)

---

__Example 1:__
```
Input: nums = [1,5,2]
Output: false
Explanation: Initially, player 1 can choose between 1 and 2. 
If he chooses 2 (or 1), then player 2 can choose from 1 (or 2) and 5. If player 2 chooses 5, then player 1 will be left with 1 (or 2). 
So, final score of player 1 is 1 + 2 = 3, and player 2 is 5. 
Hence, player 1 will never be the winner and you need to return false.
```

__Example 2:__
```
Input: nums = [1,5,233,7]
Output: true
Explanation: Player 1 first chooses 1. Then player 2 has to choose between 5 and 7. No matter which number player 2 choose, player 1 can choose 233.
Finally, player 1 has more score (234) than player 2 (12), so you need to return True representing player1 can win.
```

__Constraints:__

- $1 \le nums.length \le 20$
- $0 \le nums[i] \le 10^{7}$

---

### Recursion

![image](https://leetcode.com/problems/predict-the-winner/Figures/486/d1.png)

![image](https://leetcode.com/problems/predict-the-winner/Figures/486/d2.png)

__Complexity Analysis__

Let ```n``` be the length of the input array nums.

- __Time Complexity__: $\mathcal{O}(2^{n})$
- __Space Complexity__: $\mathcal{O}(n)$
 
```Python
class Solution:
    def predictTheWinner(self, nums: List[int]) -> bool:
        n = len(nums)

        def helper(left, right):
            # Base case
            if left == right:
                return nums[left]

            # Recurrence relation: take score from the left or right? Deduct the score after player2 took and add score to player 1
            left_score = nums[left] - helper(left + 1, right)
            right_score = nums[right] - helper(left, right - 1)

            return max(left_score, right_score)
        
        return helper(0, n - 1) >= 0
```

---

### The Framework

#### Top-Down Dynamic Programming

![image](https://leetcode.com/problems/predict-the-winner/Figures/486/d3.png)

__Complexity Analysis__

Let ```n``` be the length of the input array nums.

- __Time Complexity__: $\mathcal{O}(n^{2})$
- __Space Complexity__: $\mathcal{O}(n^{2})$

```Python
class Solution:
    def predictTheWinner(self, nums: List[int]) -> bool:
        n = len(nums)
        memo = collections.defaultdict(int)

        def dp(left, right):
            # Base case
            if left == right:
                return nums[left]

            if (left, right) in memo:
                return memo[(left, right)]

            # Recurrence relation
            left_score = nums[left] - dp(left + 1, right)
            right_score = nums[right] - dp(left, right - 1)
        
            memo[(left, right)] = max(left_score, right_score)
            return memo[(left, right)]
        
        return dp(0, n - 1) >= 0
```

```Python
class Solution:
    def predictTheWinner(self, nums: List[int]) -> bool:
        n = len(nums)

        @lru_cache(maxsize=None)
        def dp(left, right):
            # Base case
            if left == right:
                return nums[left]
            
            left_score = nums[left] - dp(left + 1, right)
            right_score = nums[right] - dp(left, right - 1)
        
            return max(left_score, right_score)
        
        return dp(0, n - 1) >= 0
```

#### Bottom-Up Dynamic Programming

![image](https://leetcode.com/problems/predict-the-winner/Figures/486/1.png)

![image](https://leetcode.com/problems/predict-the-winner/Figures/486/2.png)

__Complexity Analysis__

Let ```n``` be the length of the input array nums.

- __Time Complexity__: $\mathcal{O}(n^{2})$
- __Space Complexity__: $\mathcal{O}(n^{2})$

```Python
class Solution:
    def predictTheWinner(self, nums: List[int]) -> bool:
        n = len(nums)
        dp = [[0] * (n) for _ in range(n)]
        
        # Precompute the base case
        for i in range(n):
            dp[i][i] = nums[i]
        
        for diff in range(1, n):
            for left in range(n - diff):
                right = left + diff
                dp[left][right] = max(nums[left] - dp[left + 1][right], nums[right] - dp[left][right - 1])
            
        return dp[0][n - 1] >= 0
```

#### Space-Optimized Dynamic Programming

__Complexity Analysis__

Let ```n``` be the length of the input array nums.

- __Time Complexity__: $\mathcal{O}(n^{2})$
- __Space Complexity__: $\mathcal{O}(n)$

```Python
class Solution:
    def predictTheWinner(self, nums: List[int]) -> bool:
        n = len(nums)
        dp = nums[:]

        for diff in range(1, n):
            for left in range(n - diff):
                right = left + diff
                dp[left] = max(nums[left] - dp[left + 1], nums[right] - dp[left])
            
        return dp[0] >= 0
```

