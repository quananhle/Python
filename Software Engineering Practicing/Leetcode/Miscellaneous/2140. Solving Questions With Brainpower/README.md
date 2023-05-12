## [2140. Solving Questions With Brainpower](https://leetcode.com/problems/solving-questions-with-brainpower/)

```Tag```: ```Dynamic Programming```

#### Difficulty: Medium

You are given a 0-indexed 2D integer array ```questions``` where ```questions[i]``` = [```points```<sub>i</sub>, ```brainpower```<sub>i</sub>].

The array describes the questions of an exam, where you have to process the questions in order (i.e., starting from question ```0```) and make a decision whether to __solve__ or to __skip__ each question. Solving question ```i``` will earn you ```points```<sub>i</sub> points but you will be unable to solve each of the next ```brainpower```<sub>i</sub> questions. If you skip question ```i```, you get to make the decision on the next question.

- For example, given ```questions = [[3, 2], [4, 3], [4, 4], [2, 5]]```:
  - If question ```0``` is solved, you will earn ```3``` points but you will be unable to solve questions ```1``` and ```2```.
  - If instead, question ```0``` is skipped and question ```1``` is solved, you will earn ```4``` points but you will be unable to solve questions ```2``` and ```3```.

Return _the maximum points you can earn for the exam_.

---

__Example 1:__
```
Input: questions = [[3,2],[4,3],[4,4],[2,5]]
Output: 5
Explanation: The maximum points can be earned by solving questions 0 and 3.
- Solve question 0: Earn 3 points, will be unable to solve the next 2 questions
- Unable to solve questions 1 and 2
- Solve question 3: Earn 2 points
Total points earned: 3 + 2 = 5. There is no other way to earn 5 or more points.
```

__Example 2:__
```
Input: questions = [[1,1],[2,2],[3,3],[4,4],[5,5]]
Output: 7
Explanation: The maximum points can be earned by solving questions 1 and 4.
- Skip question 0
- Solve question 1: Earn 2 points, will be unable to solve the next 2 questions
- Unable to solve questions 2 and 3
- Solve question 4: Earn 5 points
Total points earned: 2 + 5 = 7. There is no other way to earn 7 or more points.
```

__Constraints:__

- ```1 <= questions.length <= 10^5```
- ```questions[i].length == 2```
- ```1 <= ```points```<sub>i</sub>, ```brainpower```<sub>i</sub> <= 10^5```

---

![image](https://leetcode.com/problems/solving-questions-with-brainpower/Figures/2140/intro.png)

### The Framework

#### Top-Down Dynamic Programming

```Python
class Solution:
    def mostPoints(self, questions: List[List[int]]) -> int:
        n = len(questions)

        @lru_cache(None)
        def dp(curr):
            # Base case
            if curr >= n:
                return 0
            
            points, brainpower = questions[curr][0], questions[curr][1]

            # Recurrence relation: to solve or to skip the current question?
            # Skip: move on to the next question
            skip = dp(curr + 1)
            # Solve: collect the point of current question, move on to the next possible question from brainpower
            solve = dp(curr + brainpower + 1) + points
            # What is the best decision though?
            return max(skip, solve)

        return dp(0)
```

```Python
class Solution:
    def mostPoints(self, questions: List[List[int]]) -> int:
        n = len(questions)
        memo = collections.defaultdict(int)

        def dp(curr):
            # Base case
            if curr >= n:
                return 0
            
            points, brainpower = questions[curr][0], questions[curr][1]

            if curr in memo:
                return memo[curr]

            # Recurrence relation: to solve or to skip the current question?
            # Skip: move on to the next question
            skip = dp(curr + 1)
            # Solve: collect the point of current question, move on to the next possible question from brainpower
            solve = dp(curr + brainpower + 1) + points
            # What is the best decision though?
            memo[curr] = max(skip, solve)
            return memo[curr]

        return dp(0)
```

#### Bottom-Up Dynamic Programming

```Python
class Solution:
    def mostPoints(self, questions: List[List[int]]) -> int:
        n = len(questions)
        dp = [0] * (n + 1)

        for curr in range(n - 1, -1, -1):
            points, brainpowers = questions[curr][0], questions[curr][1]
            skip, pick = 0, points
            if curr + brainpowers + 1 < n:
                pick += dp[curr + brainpowers + 1]
            if curr + 1 < n:
                skip += dp[curr + 1]
            dp[curr] = max(skip, pick)
        
        return dp[0]
```

__Algorithm__

1. Initialize an array ```dp``` of size ```n```, set ```dp[n - 1] = questions[n - 1][0]```.

2. Iterate backward over index ```i``` from ```n - 2```:

- If we skip question ```i```, we have ```dp[i] = dp[i + 1]```.
- If we solve question ```i```, we have ```dp[i] = questions[i][0] + dp[i + questions[i][1] + 1]```.

3. Update ```dp[i]``` as the larger one.

4. Return ```dp[0]``` once we finish the iteration.

```Python
class Solution:
    def mostPoints(self, questions: List[List[int]]) -> int:
        n = len(questions)
        dp = [0] * n
        dp[-1] = questions[-1][0]
        
        for curr in range(n - 2, -1, -1):
            dp[curr], skip = questions[curr][0], questions[curr][1]
            
            if curr + skip + 1 < n:
                dp[curr] += dp[curr + skip + 1]
            
            dp[curr] = max(dp[curr], dp[curr + 1])
        
        return dp[0]
```
