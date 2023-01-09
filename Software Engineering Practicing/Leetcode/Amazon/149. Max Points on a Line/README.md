## 149. Max Points on a Line

```Tag```: ```Hash Table``` ```Counter``` ```Math```

#### Difficulty: Hard

Given an array of points where points[i] = [x<sub>i</sub>, y<sub>i</sub>] represents a point on the X-Y plane, return _the maximum number of points that lie on the same straight line_.

![image](https://user-images.githubusercontent.com/35042430/211234683-5598df3b-d5b3-446e-85c7-b41e09e6b04d.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/02/25/plane1.jpg)

```
Input: points = [[1,1],[2,2],[3,3]]
Output: 3
```

__Example 2:__

![image[(https://assets.leetcode.com/uploads/2021/02/25/plane2.jpg)
```
Input: points = [[1,1],[3,2],[5,3],[4,1],[2,3],[1,4]]
Output: 4
```

__Constraints:__
```
1 <= points.length <= 300
points[i].length == 2
-104 <= xi, yi <= 104
All the points are unique.
```

---

```Python
class Solution:
    def maxPoints(self, points: List[List[int]]) -> int:
        """
        point = 0
        for x1, y1 in points:
            memo = collections.Counter()
            for x2, y2 in points:
                dx, dy = x2 - x1, y2 - y1
                if dx == 0 and dy == 0:
                    continue
                g = math.gcd(dx, dy)
                dx /= g
                dy /= g
                memo[(dy, dx)] += 1
            point = max(point, max(memo.values(), default=0) + 1)
        return point
```

```Python
class Solution:
    def maxPoints(self, points: List[List[int]]) -> int:
        """
        n = len(points)
        if n == 1:
            return 1
        
        # Line equation: ax + by + c = 0
        def calculate_line_equation(x1, y1, x2, y2):
            if x1 == x2:
                return (1, 0, -x1)
            k = (y1 - y2) / (x1 - x2)
            b = y1 - k * x1
            return (k, -1, b)
        
        ans = 0
        for i in range(n):
            memo = collections.defaultdict(set)
            x1, y1 = points[i]
            for j in range(i + 1, n):
                x2, y2 = points[j]
                line = calculate_line_equation(x1, y1, x2, y2)
                memo[line].add((x1, y1))
                memo[line].add((x2, y2))
                ans = max(ans, len(memo[line]))
        return ans
```
