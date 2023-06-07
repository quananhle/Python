## [1732. Find the Highest Altitude](https://leetcode.com/problems/find-the-highest-altitude)

```Tag```: ```Prefix Sum```

#### Difficulty: Easy

There is a biker going on a road trip. The road trip consists of ```n + 1``` points at different altitudes. The biker starts his trip on point ```0``` with altitude equal ```0```.

You are given an integer array ```gain``` of length ```n``` where ```gain[i]``` is the net gain in altitude between points ```i``` and ```i + 1``` for all ```(0 <= i < n)```. Return _the highest altitude of ```a``` point_.

![image](https://github.com/quananhle/Python/assets/35042430/19d472c8-5208-43a0-8df3-e0715c7ed550)

---

__Example 1:__
```
Input: gain = [-5,1,5,0,-7]
Output: 1
Explanation: The altitudes are [0,-5,-4,1,1,-6]. The highest is 1.
```

__Example 2:__
```
Input: gain = [-4,-3,-2,-1,4,3,2]
Output: 0
Explanation: The altitudes are [0,-4,-7,-9,-10,-6,-3,-1]. The highest is 0.
```

__Constraints:__

- ```n == gain.length```
- ```1 <= n <= 100```
- ```-100 <= gain[i] <= 100```

---
