## [1402. Reducing Dishes](https://leetcode.com/problems/reducing-dishes/)

```Tag```: ```Dynamic Programming``` ```Greedy```

#### Difficulty: Hard

A chef has collected data on the ```satisfaction``` level of his ```n``` dishes. Chef can cook any dish in ```1``` unit of time.

__Like-time coefficient__ of a dish is defined as the time taken to cook that dish including previous dishes multiplied by its satisfaction level i.e. ```time[i] * satisfaction[i]```.

Return _the maximum sum of __like-time coefficient__ that the chef can obtain after dishes preparation_.

Dishes can be prepared in __any__ order and the chef can discard some dishes to get this maximum value.

![image](https://user-images.githubusercontent.com/35042430/228406066-b494a9b6-d16d-4a28-924e-4998f05019eb.png)

---

__Example 1:__
```
Input: satisfaction = [-1,-8,0,5,-9]
Output: 14
Explanation: After Removing the second and last dish, the maximum total like-time coefficient will be equal to (-1*1 + 0*2 + 5*3 = 14).
Each dish is prepared in one unit of time.
```

__Example 2:__
```
Input: satisfaction = [4,3,2]
Output: 20
Explanation: Dishes can be prepared in any order, (2*1 + 3*2 + 4*3 = 20)
```

__Example 3:__
```
Input: satisfaction = [-1,-4,-5]
Output: 0
Explanation: People do not like the dishes. No dish is prepared.
```

__Constraints:__

- ```n == satisfaction.length```
- ```1 <= n <= 500```
- ```-1000 <= satisfaction[i] <= 1000```

---

### The Framework

#### Top-Down Dynamic Programming

![image](https://user-images.githubusercontent.com/35042430/228454318-00afcbc1-097b-4074-b871-ed32f1b4db4e.png)

__Algorithm__

1. Sort the array ```satisfaction``` in ascending order.

2. Create a memoization table ```memo``` with size ```N x N```, and initialize all the values with ```-1```, representing that the answer for all the states has not been calculated yet.

3. Implement the following function, to be called with ```index = 0``` and ```time = 1``` to find the answer:

    - a. If we have reached the end of the array, i.e. ```index = satisfaction.length```, we should return ```0``` because there are no more dishes to cook, so we can't gain any more value.
    - b. If the value in the array ```memo``` for the pair ```{index, time}``` is not ```-1```, then return that value as it implies that we have already encountered this subproblem; thus a recursive call is not needed and we can return the value stored in the table ```memo```.
    - c. Check the below two options, calculate, memoize, and return the maximum of them:

        - i. Add the coefficient value for this dish as ```satisfaction[index] * time``` to the recursive result for with ```index = index + 1``` and ```time = time + 1```
        - ii. Skip the dish and make the recursive call for ```index = index + 1``` and ```time = time```. 

- __Time Complexity__: ```O(N^2)```
- __Space Complexity__: ```O(N)```
 
```Python
class Solution:
    def maxSatisfaction(self, satisfaction: List[int]) -> int:
        satisfaction.sort()
        n = len(satisfaction)

        memo = [[-1] * (n + 1) for _ in range(n + 1)]

        def dp(curr, time):
            # Base case
            if curr == n:
                return 0

            if memo[curr][time] != -1:
                return memo[curr][time]

            # Recurrence relation: to cook or to skip? To cook or to do nothing?
            # 1. If cook the current dish with time taken, move on to the next dish and time
            # 2. Skip the current dish and move on to the next dish
            '''
            memo[curr][time] = max(satisfaction[curr] * time + dp(curr + 1, time + 1), dp(curr + 1, time))
            '''

            skip = dp(curr + 1, time)
            cook = satisfaction[curr] * time + dp(curr + 1, time + 1)

            memo[curr][time] = max(skip, cook)
            return memo[curr][time]

        return dp(0, 1)
```

#### Bottom-Up Dynamic Programming (Tabulation)

```Python
class Solution:
    def maxSatisfaction(self, satisfaction: List[int]) -> int:
        satisfaction.sort()
        n = len(satisfaction)

        dp = [[0] * (n + 2) for _ in range(n + 1)]

        for curr in range(n - 1, -1, -1):
            for time in range(1, n + 1):
                dp[curr][time] = max(satisfaction[curr] * time + dp[curr + 1][time + 1], dp[curr + 1][time])

        return dp[0][1]
```

