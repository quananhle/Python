## 733. Flood Fill

#### Difficulty: Easy

An image is represented by an ```m x n``` integer grid ```image``` where ```image[i][j]``` represents the pixel value of the image.

You are also given three integers ```sr```, ```sc```, and ```color```. You should perform a __flood fill__ on the image starting from the pixel ```image[sr][sc]```.

To perform a flood fill, consider the starting pixel, plus any pixels connected 4-directionally to the starting pixel of the same color as the starting pixel, plus any pixels connected 4-directionally to those pixels (also with the same color), and so on. Replace the color of all of the aforementioned pixels with ```color```.

Return _the modified image after performing the flood fill_.

![image](https://user-images.githubusercontent.com/35042430/206620981-6ddd3fe5-d440-4e7c-806a-0d3eba0e2747.png)

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



```Python
class Solution(object):
    def floodFill(self, image, sr, sc, color):
        """
        :type image: List[List[int]]
        :type sr: int
        :type sc: int
        :type color: int
        :rtype: List[List[int]]
        """
        ROWS, COLS = len(image), len(image[0])
        queue = collections.deque([sr, sc, 0])
        # Connected 4-directionally
        directions = [(1,0),(-1,0),(0,1),(0,-1)]
        # Mark the pixel as visited
        visited = set([sr,sc])
        base_color = image[sr][sc]
        # Base case:
        # Check if starting pixel is already colored the same as color 
        if base_color == color:
            # Make no changes to the image
            return image        
        # Depth-First Search
        #### Time Complexity: O(N), where N is the number of pixels in the image
        #### Space Complexity: O(N), the size of the implicit call stack when calling dfs
        def traverse(row, col):
            if image[row][col] == base_color:
                # Replace the color of all of the aforementioned pixels with color
                image[row][col] = color
                # Check pixels 4-directionally, plus any pixels connected 4-directionally to those pixels 
                # If row above
                if row > 0:
                    traverse(row-1, col)
                # If row below
                if row + 1 < ROWS:
                    traverse(row+1, col)
                # If col left
                if col > 0:
                    traverse(row, col-1)
                # If col right
                if col + 1 < COLS:
                    traverse(row, col+1)
        traverse(sr, sc)
        return image
```

        """
        def traverse(row, col):
            # Check if at the border of the image or the current pixel has different color than starting pixel
            if not (0 <= row < ROWS and 0 <= col < COLS) or image[row][col] != base_color:
                return image
            # Replace with color
            image[row][col] = color
            # Check pixels 4-directionally, plus any pixels connected 4-directionally to those pixels
            [traverse(row + x, col + y) for x, y in directions]
        # Check if starting pixel colored differently
        if image[sr][sc] != color:
            traverse(sr, sc)
        return image
