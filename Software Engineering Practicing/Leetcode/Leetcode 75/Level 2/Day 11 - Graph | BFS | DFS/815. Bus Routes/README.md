## [815. Bus Routes](https://leetcode.com/problems/bus-routes/)

```Tag```: ```Graph``` ```Breadth-First Search```

#### Difficulty: Hard

You are given an array ```routes``` representing bus routes where ```routes[i]``` is a bus route that the i<sup>th</sup> bus repeats forever.

- For example, if ```routes[0] = [1, 5, 7]```, this means that the 0<sup>th</sup> bus travels in the sequence ```1 -> 5 -> 7 -> 1 -> 5 -> 7 -> 1 -> ...``` forever.

You will start at the bus stop ```source``` (You are not on any bus initially), and you want to go to the bus stop ```target```. You can travel between bus stops by buses only.

Return _the least number of buses you must take to travel from ```source``` to ```target```_. Return ```-1``` if it is not possible.

![image](https://user-images.githubusercontent.com/35042430/224812449-8c6fb8db-aa47-48c5-869e-eef4f10cced7.png)

---

__Example 1:__
```
Input: routes = [[1,2,7],[3,6,7]], source = 1, target = 6
Output: 2
Explanation: The best strategy is take the first bus to the bus stop 7, then take the second bus to the bus stop 6.
```

__Example 2:__
```
Input: routes = [[7,12],[4,5,15],[6],[15,19],[9,12,13]], source = 15, target = 12
Output: -1
```

__Constraints:__

- ```1 <= routes.length <= 500```.
- 1 <= ```routes[i].length``` <= 10<sup>5</sup>
- All the values of ```routes[i]``` are unique.
- ```sum(routes[i].length)``` <= 10<sup>5</sup>
- 0 <= ```routes[i][j]``` < 10<sup>6</sup>
- 0 <= ```source, target``` < 10<sup>6</sup>

---
