## [1637. Widest Vertical Area Between Two Points Containing No Points](https://leetcode.com/problems/widest-vertical-area-between-two-points-containing-no-points)

```Tag```: ```Array & String``` ```Greedy Algorithm``` ```Sort```

#### Difficulty: Medium

Given ```n``` points on a 2D plane where $points[i] = [x_i, y_i]$, return _the widest vertical area between two points such that no points are inside the area_.

A vertical area is an area of fixed-width extending infinitely along the y-axis (i.e., infinite height). The widest vertical area is the one with the maximum width.

Note that points on the edge of a vertical area are not considered included in the area.

---

__Example 1:__

​![image](https://assets.leetcode.com/uploads/2020/09/19/points3.png)

```
Input: points = [[8,7],[9,9],[7,4],[9,7]]
Output: 1
Explanation: Both the red and the blue area are optimal.
```

__Example 2:__
```
Input: points = [[3,1],[9,0],[1,0],[1,4],[5,3],[8,8]]
Output: 3
```

__Constraints:__

- $n == points.length$
- $2 \le n \le 10^5$
- $points[i].length == 2$
- $0 \le x_i, y_i \le 10^9$

---

### Greedy Algorithm

```Python
class Solution:
    def maxWidthOfVerticalArea(self, points: List[List[int]]) -> int:
        points.sort()
        ans = -math.inf
        n = len(points)

        for i in range(1, n):
            ans = max(ans, points[i][0] - points[i - 1][0])

        return ans
```

#### One Liner

```Python
class Solution:
    def maxWidthOfVerticalArea(self, points: List[List[int]]) -> int:
        return max(b - a for a, b in pairwise(sorted(list(zip(*points))[0])))
```

