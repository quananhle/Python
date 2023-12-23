## [1496. Path Crossing](https://leetcode.com/problems/path-crossing)

```Tag```: ```Hash Map``` ```Hash Set```

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

### Stack

```Python
class Solution:
    def isPathCrossing(self, path: str) -> bool:
        memo = {'N' : [1, 0], 'S' : [-1, 0], 'E' : [0, 1], 'W' : [0, -1]}
        visited = set()
        n = len(path)

        stack = [(0, 0, 0)]

        while stack:
            curr, row, col = stack.pop()
            if (row, col) in visited:
                return True
            if curr == n:
                return False
            
            visited.add((row, col))
            dx, dy = memo[path[curr]]
            stack.append((curr + 1, row + dx, col + dy))
```

### Queue

```Python
class Solution:
    def isPathCrossing(self, path: str) -> bool:
        memo = {'N' : [1, 0], 'S' : [-1, 0], 'E' : [0, 1], 'W' : [0, -1]}
        visited = set()
        n = len(path)

        queue = collections.deque([(0, 0, 0)])

        while queue:
            curr, row, col = queue.popleft()
            if (row, col) in visited:
                return True
            if curr == n:
                return False
            
            visited.add((row, col))
            dx, dy = memo[path[curr]]
            queue.append((curr + 1, row + dx, col + dy))
```

---

```Python
class Solution:
    def isPathCrossing(self, path: str) -> bool:
        memo = {'N' : [1, 0], 'S' : [-1, 0], 'E' : [0, 1], 'W' : [0, -1]}
        visited = set([(0, 0)])
        row = col = 0

        for direction in path:
            dx, dy = memo[direction]
            row += dx; col += dy
            if (row, col) in visited:
                return True
            visited.add((row, col))
        
        return False
```
