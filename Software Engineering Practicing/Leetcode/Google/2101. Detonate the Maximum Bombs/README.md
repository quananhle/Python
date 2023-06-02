## [2101. Detonate the Maximum Bombs](https://leetcode.com/problems/detonate-the-maximum-bombs/)

```Tag```: ```Depth-First Search``` ```Breadth-First Search``` ```Matrix```

#### Difficulty: Medium

You are given a list of bombs. The range of a bomb is defined as the area where its effect can be felt. This area is in the shape of a circle with the center as the location of the bomb.

The bombs are represented by a 0-indexed 2D integer array bombs where ```bombs[i] = [xi, yi, ri]```. x<sub>i</sub> and y<sub>i</sub> denote the __X-coordinate__ and __Y-coordinate__ of the location of the i<sup>th</sup> bomb, whereas r<sub>i</sub> denotes the radius of its range.

You may choose to detonate a single bomb. When a bomb is detonated, it will detonate all bombs that lie in its range. These bombs will further detonate the bombs that lie in their ranges.

Given the list of ```bombs```, return _the maximum number of bombs that can be detonated if you are allowed to detonate only one bomb_.

![image](https://github.com/quananhle/Python/assets/35042430/1cd37014-58d5-440f-9bfa-f1aa7ff54a0c)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/11/06/desmos-eg-3.png)

```
Input: bombs = [[2,1,3],[6,1,4]]
Output: 2
Explanation:
The above figure shows the positions and ranges of the 2 bombs.
If we detonate the left bomb, the right bomb will not be affected.
But if we detonate the right bomb, both bombs will be detonated.
So the maximum bombs that can be detonated is max(1, 2) = 2.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2021/11/06/desmos-eg-2.png)
```
Input: bombs = [[1,1,5],[10,10,5]]
Output: 1
Explanation:
Detonating either bomb will not detonate the other bomb, so the maximum number of bombs that can be detonated is 1.
```

__Example 3:__

![image](https://assets.leetcode.com/uploads/2021/11/07/desmos-eg1.png)
```
Input: bombs = [[1,2,3],[2,3,1],[3,4,2],[4,5,3],[5,6,4]]
Output: 5
Explanation:
The best bomb to detonate is bomb 0 because:
- Bomb 0 detonates bombs 1 and 2. The red circle denotes the range of bomb 0.
- Bomb 2 detonates bomb 3. The blue circle denotes the range of bomb 2.
- Bomb 3 detonates bomb 4. The green circle denotes the range of bomb 3.
Thus all 5 bombs are detonated.
```

__Constraints:__

- ```1 <= bombs.length <= 100```
- ```bombs[i].length == 3```
- ```1 <= xi, yi, ri <= 10^5```

---

![image](https://leetcode.com/problems/detonate-the-maximum-bombs/Figures/2101/1.png)

![image](https://leetcode.com/problems/detonate-the-maximum-bombs/Figures/2101/3.png)

![image](https://github.com/quananhle/Python/assets/35042430/8549a303-d668-4693-b98a-815c714baab5)

We consider all different pairs of nodes, and note that two pairs of the same bombs in different orders are considered to be different. In short, we consider both ```(i, j)``` and ```(j, i)```.

![image](https://leetcode.com/problems/detonate-the-maximum-bombs/Figures/2101/2.png)

### Depth-First Search

![image](https://leetcode.com/problems/detonate-the-maximum-bombs/Figures/2101/d1.png)

```Python
class Solution:
    def maximumDetonation(self, bombs: List[List[int]]) -> int:
        graph = collections.defaultdict(list)
        n = len(bombs)

        for i in range(n):
            for j in range(n):
                if i == j:
                    continue
                
                x1, y1, r1 = bombs[i]
                x2, y2, r2 = bombs[j]

                # Create a path from bomb i to bomb j if bomb i detonates bomb j
                if r1 ** 2 >= (x1 - x2) ** 2 + (y1 - y2) ** 2:
                    graph[i].append(j)
        
        def dfs(curr):
            visited.add(curr)
            for neighbor in graph[curr]:
                if not neighbor in visited:
                    dfs(neighbor)

            return len(visited)

        ans = 0
        for i in range(n):
            visited = set()
            ans = max(ans, dfs(i))
        
        return ans
```

### Depth-First Search with Stack

![image](https://leetcode.com/problems/detonate-the-maximum-bombs/Figures/2101/d2.png)

```Python
class Solution:
    def maximumDetonation(self, bombs: List[List[int]]) -> int:
        graph = collections.defaultdict(list)
        n = len(bombs)

        for i in range(n):
            for j in range(n):
                if i == j:
                    continue
                
                x1, y1, r1 = bombs[i]
                x2, y2, r2 = bombs[j]

                # Create a path from bomb i to bomb j if bomb i detonates bomb j
                if r1 ** 2 >= (x1 - x2) ** 2 + (y1 - y2) ** 2:
                    graph[i].append(j)

        def dfs(i):
            stack = [i]
            visited = set([i])

            while stack:
                curr = stack.pop()
                for next in graph[curr]:
                    if not next in visited:
                        visited.add(next)
                        stack.append(next)
                
            return len(visited)

        
        ans = 0
        for i in range(n):
            ans = max(ans, dfs(i))

        return ans
```

### Breadth-First Search

![image](https://leetcode.com/problems/detonate-the-maximum-bombs/Figures/2101/b1.png)

```Python
class Solution:
    def maximumDetonation(self, bombs: List[List[int]]) -> int:
        graph = collections.defaultdict(list)
        n = len(bombs)

        for i in range(n):
            for j in range(n):
                if i == j:
                    continue
                
                x1, y1, r1 = bombs[i]
                x2, y2, r2 = bombs[j]

                # Create a path from bomb i to bomb j if bomb i detonates bomb j
                if r1 ** 2 >= (x1 - x2) ** 2 + (y1 - y2) ** 2:
                    graph[i].append(j)

        ans = 0

        def bfs(i):
            queue = collections.deque([i])
            visited = set([i])

            while queue:
                curr = queue.popleft()
                for next in graph[curr]:
                    if not next in visited:
                        visited.add(next)
                        queue.append(next)
            
            return len(visited)
        
        for i in range(n):
            ans = max(ans, bfs(i))
        
        return ans
```
