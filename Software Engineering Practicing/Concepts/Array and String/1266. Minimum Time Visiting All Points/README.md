## [1266. Minimum Time Visiting All Points](https://leetcode.com/problems/minimum-time-visiting-all-points)

```Tag```: ```Array & String``` ```Math```

#### Difficulty: Easy

On a 2D plane, there are ```n``` points with integer coordinates $points[i] = [x_i, y_i]$. Return _the minimum time in seconds to visit all the points in the order given by ```points```_.

You can move according to these rules:

- In ```1``` second, you can either:
  - move vertically by one unit,
  - move horizontally by one unit, or
  - move diagonally ```sqrt(2)``` units (in other words, move one unit vertically then one unit horizontally in ```1``` second).
- You have to visit the points in the same order as they appear in the array.
- You are allowed to pass through points that appear later in the order, but these do not count as visits.

![image](https://github.com/quananhle/Python/assets/35042430/3117a033-5a9d-4b0b-8719-3d240eb86935)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2019/11/14/1626_example_1.PNG)
```
Input: points = [[1,1],[3,4],[-1,0]]
Output: 7
Explanation: One optimal path is [1,1] -> [2,2] -> [3,3] -> [3,4] -> [2,3] -> [1,2] -> [0,1] -> [-1,0]   
Time from [1,1] to [3,4] = 3 seconds 
Time from [3,4] to [-1,0] = 4 seconds
Total time = 7 seconds
```

__Example 2:__
```
Input: points = [[3,2],[-2,2]]
Output: 5
```

__Constraints:__

- $points.length == n$
- $1 \le n \le 100$
- $points[i].length == 2$
- $-1000 \le points[i][0], points[i][1] \le 1000$

---

### Array & String

```Python
class Solution:
    def minTimeToVisitAllPoints(self, points: List[List[int]]) -> int:
        ans = 0
        n = len(points)

        for i in range(1, n):
            ans += max(abs(points[i][0] - points[i - 1][0]), abs(points[i][1] - points[i - 1][1]))
        
        return ans
```

#### One-Liner

```Python
class Solution:
    def minTimeToVisitAllPoints(self, points: List[List[int]]) -> int:
        return sum([max(abs(points[i][0] - points[i - 1][0]), abs(points[i][1] - points[i - 1][1])) for i in range(1, len(points))])
```
