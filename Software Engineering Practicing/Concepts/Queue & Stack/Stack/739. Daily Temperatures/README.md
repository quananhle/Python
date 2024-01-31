## [739. Daily Temperatures](https://leetcode.com/problems/daily-temperatures)

```Tag```: ```Stack``` 

#### Difficulty: Medium

Given an array of integers ```temperatures``` represents the daily temperatures, return _an array ```answer``` such that ```answer[i]``` is the number of days you have to wait after the i<sup>th</sup> day to get a warmer temperature_. If there is no future day for which this is possible, keep ```answer[i] == 0``` instead.

![image](https://github.com/quananhle/Python/assets/35042430/7779aa75-c344-4736-ac36-f523c953f62a)

---

__Example 1:__

```
Input: temperatures = [73,74,75,71,69,72,76,73]
Output: [1,1,4,2,1,1,0,0]
```

__Example 2:__

```
Input: temperatures = [30,40,50,60]
Output: [1,1,1,0]
```

__Example 3:__

```
Input: temperatures = [30,60,90]
Output: [1,1,0]
```

__Constraints:__

- $1 \le temperatures.length \le 10^5$
- $30 \le temperatures[i] \le 100$

---
 
 ### Brute Force (Time Limit Exceeded)
 
 ```Python
 class Solution:
    def dailyTemperatures(self, temperatures: List[int]) -> List[int]:
        # Brute Force
        ### Time Limit Exceeded
        res = [0] * len(temperatures)
        for day in range(len(temperatures)):
            for future_day in range(day+1, len(temperatures)):
                if temperatures[future_day] > temperatures[day]:
                    res[day] = future_day - day
                    break
        return res
```

```Python
class Solution:
    def dailyTemperatures(self, temperatures: List[int]) -> List[int]:
        n = len(temperatures)
        res = [0] * n
        hottest = 0

        for today in range(n - 1, -1, -1):
            temp = temperatures[today]
            if hottest <= temp:
                hottest = temp
                continue
            
            days = 1
            while temperatures[today + days] <= temp:
                days += 1
            
            res[today] = days
        
        return res
```

### Monotonic Stack

 ```Python
 class Solution:
    def dailyTemperatures(self, temperatures: List[int]) -> List[int]:
        # Monotonic Stack
        #### Time Complexity: O(N), traversed through input array
        #### Space Complexity: O(N), space required to build answer array
        res = [0] * len(temperatures)
        stack = list()
        for curr_day, curr_tmp in enumerate(temperatures):
            while stack and temperatures[stack[-1]] < curr_tmp:
                    prev_day = stack.pop()
                    res[prev_day] = curr_day - prev_day
            stack.append(curr_day)
        return res
```

#### Space Optimized

```Python
 class Solution:
    def dailyTemperatures(self, temperatures: List[int]) -> List[int]:
        # Dynamic Programming with Tabulations
        #### Time Complexity: O(N), traversed through input array
        #### Space Complexity: O(N), space required to build answer array        
        res = [0] * len(temperatures)
        hottest = 0
        
        for curr_day in range(len(temperatures)-1, -1, -1):
            curr_temp = temperatures[curr_day]
            if curr_temp >= hottest:
                hottest = curr_temp
                continue
            days = 1
            while temperatures[curr_day + days] <= curr_temp:
                # Use information from output to search for the next warmer day
                days += res[curr_day + days]
            res[curr_day] = days
        return res
```
