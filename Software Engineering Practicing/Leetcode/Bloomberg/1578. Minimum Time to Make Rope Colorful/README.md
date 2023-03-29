## [1578. Minimum Time to Make Rope Colorful](https://leetcode.com/problems/minimum-time-to-make-rope-colorful/)

```Tag```: ```Two Pointers```

#### Difficulty: Medium

Alice has ```n``` balloons arranged on a rope. You are given a __0-indexed__ string colors where ```colors[i]``` is the color of the i<sup>th</sup> balloon.

Alice wants the rope to be colorful. She does not want __two consecutive balloons__ to be of the same color, so she asks Bob for help. Bob can remove some balloons from the rope to make it colorful. You are given a __0-indexed__ integer array neededTime where ```neededTime[i]``` is the time (in seconds) that Bob needs to remove the i<sup>th</sup> balloon from the rope.

Return _the minimum time Bob needs to make the rope colorful_.

![image](https://user-images.githubusercontent.com/35042430/228646894-ed83a100-2026-401b-9673-894bbaa49614.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/12/13/ballon1.jpg)
```
Input: colors = "abaac", neededTime = [1,2,3,4,5]
Output: 3
Explanation: In the above image, 'a' is blue, 'b' is red, and 'c' is green.
Bob can remove the blue balloon at index 2. This takes 3 seconds.
There are no longer two consecutive balloons of the same color. Total time = 3.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2021/12/13/balloon2.jpg)
```
Input: colors = "abc", neededTime = [1,2,3]
Output: 0
Explanation: The rope is already colorful. Bob does not need to remove any balloons from the rope.
```

__Example 3:__

![image](https://assets.leetcode.com/uploads/2021/12/13/balloon3.jpg)
```
Input: colors = "aabaa", neededTime = [1,2,3,4,1]
Output: 2
Explanation: Bob will remove the ballons at indices 0 and 4. Each ballon takes 1 second to remove.
There are no longer two consecutive balloons of the same color. Total time = 1 + 1 = 2.
```

__Constraints:__

- ```n == colors.length == neededTime.length```
- ```1 <= n <= 10z^5```
- ```1 <= neededTime[i] <= 10^4```
- ```colors``` contains only lowercase English letters.

---

