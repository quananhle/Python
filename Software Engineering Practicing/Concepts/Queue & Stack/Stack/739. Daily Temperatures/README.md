## 739. Daily Temperatures

```Tag```: ```Stack``` ```Dynamic Programming```

#### Difficulty: Medium

Given an array of integers ```temperatures``` represents the daily temperatures, return _an array ```answer``` such that ```answer[i]``` is the number of days you have to wait after the i<sup>th</sup> day to get a warmer temperature_. If there is no future day for which this is possible, keep ```answer[i] == 0``` instead.

![image](https://user-images.githubusercontent.com/35042430/208484491-996afd9e-6ae7-46b6-a878-ef668120f78b.png)

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
```
1 <= temperatures.length <= 105
30 <= temperatures[i] <= 100
```

---
 
