## 1626. Best Team With No Conflicts

```Tag```: ```Dynamic Programming```

#### Difficulty: Medium

You are the manager of a basketball team. For the upcoming tournament, you want to choose the team with the highest overall score. The score of the team is the __sum__ of scores of all the players in the team.

However, the basketball team is not allowed to have conflicts. A __conflict__ exists if a younger player has a __strictly higher score__ than an older player. A conflict does not occur between players of the same age.

Given two lists, ```scores``` and ```ages```, where each ```scores[i]``` and ```ages[i]``` represents the score and age of the i<sup>th</sup> player, respectively, return _the highest overall score of all possible basketball teams_.

![image](https://user-images.githubusercontent.com/35042430/215686094-5af240a7-e53e-42d3-bf2a-2d259b091e0d.png)

---

__Example 1:__
```
Input: scores = [1,3,5,10,15], ages = [1,2,3,4,5]
Output: 34
Explanation: You can choose all the players.
```

__Example 2:__
```
Input: scores = [4,5,6,5], ages = [2,1,2,1]
Output: 16
Explanation: It is best to choose the last 3 players. Notice that you are allowed to choose multiple people of the same age.
```

__Example 3:__
```
Input: scores = [1,2,3,5], ages = [8,9,10,1]
Output: 6
Explanation: It is best to choose the first 3 players. 
```

__Constraints:__

- ```1 <= scores.length, ages.length <= 1000```
- ```scores.length == ages.length```
- 1 <= scores[i] <= 10<sup>6</sup>
- ```1 <= ages[i] <= 1000```

---

### Bottom-Up Dynamic Programming

```Python
class Solution:
    def bestTeamScore(self, scores: List[int], ages: List[int]) -> int:
        # Bottom-Up Dynamic Programming
        player_info = sorted(zip(ages, scores), key=lambda x: (x[0], x[1]))
        n = len(player_info)
        dp = [0] * n
        for i in range(n):
            age, score = player_info[i]
            dp[i] = score
            for j in range(i):
                _, pre_score = player_info[j]
                if pre_score <= score:
                    dp[i] = max(dp[i], dp[j] + score)
        return max(dp)
```

```Python
class Solution:
    def bestTeamScore(self, scores: List[int], ages: List[int]) -> int:
        # Bottom-Up Dynamic Programming
        n = len(scores)
        memo = [0] * n
        ans = 0
        
        players = [(ages[i], scores[i]) for i in range(n)]
        players.sort(key = lambda x: (x[0], x[1]))
        
        for i in range(n):
            memo[i] = players[i][1]
            for j in range(i):
                if players[j][1] <= players[i][1]:
                    memo[i] = max(memo[i], memo[j] + players[i][1])
            ans = max(ans, memo[i])

        return ans
```
