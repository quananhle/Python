## [2660. Determine the Winner of a Bowling Game](https://leetcode.com/problems/determine-the-winner-of-a-bowling-game)

```Tag```: ```Array & String``` ```Brainteasing```

#### Difficulty: Easy

You are given two 0-indexed integer arrays ```player1``` and ```player2```, that represent the number of pins that player 1 and player 2 hit in a bowling game, respectively.

The bowling game consists of ```n``` turns, and the number of pins in each turn is exactly ```10```.

Assume a player hit x<sub>i</sub> pins in the i<sup>th</sup> turn. The value of the i<sup>th</sup> turn for the player is:

- 2x<sub>i</sub> if the player hit ```10``` pins in any of the previous two turns.
- Otherwise, It is x<sub>i</sub>.

The score of the player is the sum of the values of their ```n``` turns.

Return

- ```1``` if the score of player 1 is more than the score of player 2,
- ```2``` if the score of player 2 is more than the score of player 1, and
- ```0``` in case of a draw.
 
 ---
 
__Example 1:__
```
Input: player1 = [4,10,7,9], player2 = [6,5,2,3]
Output: 1
Explanation: The score of player1 is 4 + 10 + 2*7 + 2*9 = 46.
The score of player2 is 6 + 5 + 2 + 3 = 16.
Score of player1 is more than the score of player2, so, player1 is the winner, and the answer is 1.
```

__Example 2:__
```
Input: player1 = [3,5,7,6], player2 = [8,10,10,2]
Output: 2
Explanation: The score of player1 is 3 + 5 + 7 + 6 = 21.
The score of player2 is 8 + 10 + 2*10 + 2*2 = 42.
Score of player2 is more than the score of player1, so, player2 is the winner, and the answer is 2.
```

__Example 3:__
```
Input: player1 = [2,3], player2 = [4,1]
Output: 0
Explanation: The score of player1 is 2 + 3 = 5
The score of player2 is 4 + 1 = 5
The score of player1 equals to the score of player2, so, there is a draw, and the answer is 0.
```

__Constraints:__

- ```n == player1.length == player2.length```
- ```1 <= n <= 1000```
- ```0 <= player1[i], player2[i] <= 10```

---

```Python
class Solution:
    def isWinner(self, player1: List[int], player2: List[int]) -> int:
        def calculate_score(player): 
            ans = 0
            for i, x in enumerate(player): 
                ans += x
                if i and player[i-1] == 10 or i >= 2 and player[i-2] == 10: ans += x
            return ans
        
        diff = calculate_score(player1) - calculate_score(player2)
        return 1 if diff > 0 else 2 if diff < 0 else 0
```

```Python
class Solution:
    def isWinner(self, player1: List[int], player2: List[int]) -> int:
        player1_scored_10 = player2_scored_10 = 0
        score1 = score2 = 0
        
        for score in player1:
            if player1_scored_10 > 0:
                score1 += 2 * score
            else:
                score1 += score
            player1_scored_10 -= 1
            if score == 10:
                player1_scored_10 = 2
                
        for score in player2:
            if player2_scored_10 > 0:
                score2 += 2 * score
            else:
                score2 += score
            player2_scored_10 -= 1
            if score == 10:
                player2_scored_10 = 2

        if score1 == score2:
            return 0
        elif score1 > score2:
            return 1
        else:
            return 2
```
