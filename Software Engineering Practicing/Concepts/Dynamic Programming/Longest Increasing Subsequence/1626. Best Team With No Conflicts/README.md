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

### Top-Down Dynamic Programming

__Time Complexity__: ```O(N^2)```

__Space Complexity__: ```O(N)```

![image](https://leetcode.com/problems/best-team-with-no-conflicts/solutions/2886659/Figures/1626/1626A.png)

```Python
class Solution:
    def bestTeamScore(self, scores: List[int], ages: List[int]) -> int:
        # Top-Down Dynamic Programming
        n = len(scores)
        ages_scores = list(zip(ages, scores))
        ages_scores.sort()
        ans = 0
        
        @lru_cache(None)
        def dp(curr):
            score = ages_scores[curr][1]
            for j in range(curr + 1, n):
                if ages_scores[curr][0] == ages_scores[j][0] or ages_scores[curr][1] <= ages_scores[j][1]:
                    score = max(score, dp(j) + ages_scores[curr][1])
            return score

        for i in range(n):
            ans = max(ans, dp(i))

        return ans
```

```Python
class Solution:
    def bestTeamScore(self, scores: List[int], ages: List[int]) -> int:
        # Top-Down Dynamic Programming
        ages, scores = zip(*sorted(zip(ages, scores)))

        @lru_cache(None)
        def dp(i):
            # Return max score up to ith player included
            if i < 0:
                return 0
            return scores[i] + max((dp(j) for j in range(i) if ages[j] == ages[i] or scores[j] <= scores[i]), default=0)

        return max(dp(i) for i in range(len(scores)))
```

### Bottom-Up Dynamic Programming

__Time Complexity__: ```O(N^2)```

__Space Complexity__: ```O(N)```

#### Algorithm

1. Store the ```ages``` and ```scores``` of all the players in the list ```player_info```.

2. Sort the list player_info in ascending order of ```age``` and then in ascending order of ```score```.

3. Initialize the array ```cache``` of size ```N```. The ```cache[i]``` represents the maximum score possible by taking i<sup>th</sup> player and possible players before it. All values initially will be equal to the score of individual players.

4. Iterate over players from ```0``` to ```N - 1``` for each player at index ```i```

    - Iterate over the players on the left, i.e., from ```0``` to ```i - 1```. For each such player, ```j```, check if the score of the i<sup>th</sup> player is greater than or equal to the j<sup>th</sup> player's score. If it is, we can add the total score of the j<sup>th</sup> player ```(dp[j])``` to the score of the i<sup>th</sup> player and update the maximum score of the i<sup>th</sup> player ```dp[i]``` accordingly.

6. Store the maximum of all ```dp[i]``` in the variable ```answer```.

7. Return answer.

```Python
class Solution:
    def bestTeamScore(self, scores: List[int], ages: List[int]) -> int:
        # Bottom-Up Dynamic Programming
        player_info = sorted(zip(ages, scores), key=lambda x: (x[0], x[1]))
        n = len(player_info)
        cache = [0] * n
        for i in range(n):
            age, score = player_info[i]
            cache[i] = score
            for j in range(i):
                _, pre_score = player_info[j]
                if pre_score <= score:
                    cache[i] = max(dp[i], cache[j] + score)
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
