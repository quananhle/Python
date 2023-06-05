## [1232. Check If It Is a Straight Line](https://leetcode.com/problems/check-if-it-is-a-straight-line/)

```Tag```: ```Array & String``` ```Math```

#### Difficulty: Easy

You are given an array coordinates, ```coordinates[i] = [x, y]```, where ```[x, y]``` represents the coordinate of a point. Check if these points make a straight line in the XY plane.

![image](https://github.com/quananhle/Python/assets/35042430/641ea729-1bfc-4354-a3e5-e83fc07baec2)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2019/10/15/untitled-diagram-2.jpg)
```
Input: coordinates = [[1,2],[2,3],[3,4],[4,5],[5,6],[6,7]]
Output: true
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2019/10/09/untitled-diagram-1.jpg)
```
Input: coordinates = [[1,1],[2,2],[3,4],[4,5],[5,6],[7,7]]
Output: false
```

__Constraints:__

- ```2 <= coordinates.length <= 1000```
- ```coordinates[i].length == 2```
- ```-10^4 <= coordinates[i][0], coordinates[i][1] <= 10^4```
- ```coordinates``` contains no duplicate point.

---

### Math

![image](https://github.com/quananhle/Python/assets/35042430/3fb70d93-001d-4a9c-97ab-283184d2cd9c)

![image](https://leetcode.com/problems/check-if-it-is-a-straight-line/Figures/1232/1232A.png)

![image](https://github.com/quananhle/Python/assets/35042430/51ebf320-28d5-43b7-a200-1bc587bd745f)

```Python
class Solution:
    def checkStraightLine(self, coordinates: List[List[int]]) -> bool:
        def get_x_diff(x0, x1):
            return x0 - x1
        
        def get_y_diff(y0, y1):
            return y0 - y1
        
        start_x, start_y = coordinates[0][0], coordinates[0][1]
        delta_x = get_x_diff(start_x, coordinates[1][0])
        delta_y = get_y_diff(start_y, coordinates[1][1])
        
        for next_x, next_y in coordinates[2:]:
            if delta_y * get_x_diff(start_x, next_x) != delta_x * get_y_diff(start_y, next_y):
                return False

        return True
```

### ```numpy```

```Python
import numpy as np
class Solution:
    def checkStraightLine(self, coordinates: List[List[int]]) -> bool:
        c = np.array(coordinates)
        return np.linalg.matrix_rank(c[1:] - c[0]) == 1
```
