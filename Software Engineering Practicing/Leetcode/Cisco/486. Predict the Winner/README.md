## [486. Predict the Winner](https://leetcode.com/problems/predict-the-winner/)

```Tag```: ```Recursion``` ```Dynamic Programming```

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

```Python

```

---

### The Framework

#### Top-Down Dynamic Programming

```Python

```

```Python
class Solution:
    def PredictTheWinner(self, nums: List[int]) -> bool:
        n = len(nums)

        def dp(player1, player2):
            # Base case
            if player1 == player2:
                return nums[player1]
            
            # Recurrence relation
            p1_score = nums[player1] - dp(player1 + 1, player2)
            p2_score = nums[player2] - dp(player1, player2 - 1)

            return max(p1_score, p2_score)
        
        return dp(0, n - 1) >= 0
```

#### Bottom-Up Dynamic Programming

```Python

```

