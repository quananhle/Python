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

```
