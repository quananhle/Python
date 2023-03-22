## [2492. Minimum Score of a Path Between Two Cities](https://leetcode.com/problems/minimum-score-of-a-path-between-two-cities/)

```Tag```: ```Graph```

#### Difficulty: Medium

You are given a positive integer ```n``` representing ```n``` cities numbered from ```1``` to ```n```. You are also given a 2D array ```roads``` where ```roads[i]``` = [a<sub>i</sub>, b<sub>i</sub>, distance<sub>i</sub>] indicates that there is a bidirectional road between cities a<sub>i</sub> and b<sub>i</sub> with a distance equal to distance<sub>i</sub>. The cities graph is not necessarily connected.

The __score__ of a path between two cities is defined as the __minimum__ distance of a road in this path.

Return _the minimum possible score of a path between cities ```1``` and ```n```_.

__Note__:

- A path is a sequence of roads between two cities.
- It is allowed for a path to contain the same road __multiple__ times, and you can visit cities ```1``` and ```n``` multiple times along the path.
- The test cases are generated such that there is __at least__ one path between ```1``` and ```n```.

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2022/10/12/graph11.png)
```
Input: n = 4, roads = [[1,2,9],[2,3,6],[2,4,5],[1,4,7]]
Output: 5
Explanation: The path from city 1 to 4 with the minimum score is: 1 -> 2 -> 4. The score of this path is min(9,5) = 5.
It can be shown that no other path has less score.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2022/10/12/graph22.png)
```
Input: n = 4, roads = [[1,2,2],[1,3,4],[3,4,7]]
Output: 2
Explanation: The path from city 1 to 4 with the minimum score is: 1 -> 2 -> 1 -> 3 -> 4. The score of this path is min(2,2,4,7) = 2.
```

__Constraints__:

- ```2 <= n <= 10^5```
- ```1 <= roads.length <= 10^5```
- ```roads[i].length == 3```
- ```1 <= ai, bi <= n```
- ```ai != bi```
- ```1 <= distancei <= 10^4```
- There are no repeated edges.
- There is at least one path between ```1``` and ```n```.

---
