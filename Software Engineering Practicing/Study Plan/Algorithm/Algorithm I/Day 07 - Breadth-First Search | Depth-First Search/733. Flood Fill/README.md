## [733. Flood Fill](https://leetcode.com/problems/flood-fill)

```Tag```: ```Array``` ```Depth-First Search``` ```Breadth-First Search``` ```Matrix```

#### Difficulty: Easy

An image is represented by an ```m x n``` integer grid ```image``` where ```image[i][j]``` represents the pixel value of the image.

You are also given three integers ```sr```, ```sc```, and ```color```. You should perform a flood fill on the image starting from the pixel ```image[sr][sc]```.

To perform a flood fill, consider the starting pixel, plus any pixels connected 4-directionally to the starting pixel of the same color as the starting pixel, plus any pixels connected 4-directionally to those pixels (also with the same color), and so on. Replace the color of all of the aforementioned pixels with ```color```.

Return *the modified image after performing the flood fill*.

![image](https://user-images.githubusercontent.com/35042430/209402370-c9919054-6479-402e-aa87-8d2f873db877.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/06/01/flood1-grid.jpg)
```
Input: image = [[1,1,1],[1,1,0],[1,0,1]], sr = 1, sc = 1, color = 2
Output: [[2,2,2],[2,2,0],[2,0,1]]
Explanation: From the center of the image with position (sr, sc) = (1, 1) (i.e., the red pixel), all pixels connected by a path of the same color as the starting pixel (i.e., the blue pixels) are colored with the new color.
Note the bottom corner is not colored 2, because it is not 4-directionally connected to the starting pixel.
```

__Example 2:__

```
Input: image = [[0,0,0],[0,0,0]], sr = 0, sc = 0, color = 0
Output: [[0,0,0],[0,0,0]]
Explanation: The starting pixel is already colored 0, so no changes are made to the image.
```

__Constraints:__

```
m == image.length
n == image[i].length
1 <= m, n <= 50
0 <= image[i][j], color < 216
0 <= sr < m
0 <= sc < n
```

---

### Depth-First Search

#### Time Complexity: O(N), where N is the number of pixels in the image. We might process every pixel.
#### Space Complexity: O(N), the size of the implicit call stack when calling dfs.

```Python
class Solution:
    def floodFill(self, image: List[List[int]], sr: int, sc: int, color: int) -> List[List[int]]:
        # Depth-First Search

        ROWS, COLS = len(image), len(image[0])
        DIRECTIONS = [(1,0), (0,1), (-1,0), (0,-1)]
        visited = set()
        start = image[sr][sc]

        def dfs(image, row, col, color):
            if not (0 <= row < ROWS and 0 <= col < COLS and image[row][col] == start and not (row, col) in visited):
                return
            image[row][col] = color
            visited.add((row, col))
            [dfs(image, row + x, col + y, color) for x, y in DIRECTIONS]

        dfs(image, sr, sc, color)
        return image
```

### Breadth-First Search

#### Time Complexity: O(N), where N is the number of pixels in the image. We might process every pixel.
#### Space Complexity: O(N), the size of the queue

```Python
class Solution:
    def floodFill(self, image: List[List[int]], sr: int, sc: int, color: int) -> List[List[int]]:
        # Breadth-First Search
        ROWS, COLS = len(image), len(image[0])
        DIRECTIONS = [(1,0), (0,1), (-1,0), (0,-1)]
        visited = set()
        queue = collections.deque()
        queue.append((sr, sc))
        start = image[sr][sc]

        while queue:
            row, col = queue.popleft()
            if not (0 <= row < ROWS and 0 <= col < COLS and image[row][col] == start and not (row, col) in visited):
                continue
            image[row][col] = color
            visited.add((row, col))
            queue.extend((row + x, col + y) for x, y in DIRECTIONS)
        
        return image
```

```Python
class Solution:
    def floodFill(self, image: List[List[int]], sr: int, sc: int, color: int) -> List[List[int]]:
        ROWS, COLS = len(image), len(image[0])
        DIRECTIONS = [(1, 0), (0, 1), (-1, 0), (0, -1)]
        source = image[sr][sc]

        queue = collections.deque([(sr, sc)])

        while queue:
            row, col = queue.popleft()
            if not (0 <= row < ROWS and 0 <= col < COLS and image[row][col] == source and image[row][col] != color):
                continue
            image[row][col] = color
            '''
            for dx, dy in DIRECTIONS:
                queue.append((row + dx, col + dy))
            '''
            queue.extend((row + dx, col + dy) for dx, dy in DIRECTIONS)

        return image
```
