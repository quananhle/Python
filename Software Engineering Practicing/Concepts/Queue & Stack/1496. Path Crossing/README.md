## [1496. Path Crossing](https://leetcode.com/problems/path-crossing)

```Tag```: ```Depth-First Search``` ```Breadth-First Search```

#### Difficulty: Easy

Given a string ```path```, where ```path[i]``` = ```'N'```, ```'S'```, ```'E'``` or ```'W'```, each representing moving one unit ```north```, ```south```, ```east```, or ```west```, respectively. You start at the origin ```(0, 0)``` on a 2D plane and walk on the path specified by ```path```.

Return _```True``` if the path crosses itself at any point, that is, if at any time you are on a location you have previously visited_. Return _```False``` otherwise_.

![image](https://github.com/quananhle/Python/assets/35042430/20947a76-ee4e-4cb0-80c0-b41dd3338fb7)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/06/10/screen-shot-2020-06-10-at-123929-pm.png)

```
Input: path = "NES"
Output: false 
Explanation: Notice that the path doesn't cross any point more than once.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2020/06/10/screen-shot-2020-06-10-at-123843-pm.png)
```
Input: path = "NESWW"
Output: true
Explanation: Notice that the path visits the origin twice.
``` 

__Constraints:__

- $1 \le path.length \le 10^4$
- ```path[i]``` is either ```'N'```, ```'S'```, ```'E'```, or ```'W'```.

---
