## 223. Rectangle Area

#### Difficulty: Medium

Given the coordinates of two __rectilinear__ rectangles in a 2D plane, return the total area covered by the two rectangles.

The first rectangle is defined by its __bottom-left__ corner (```ax1```, ```ay1```) and its __top-right__ corner (```ax2```, ```ay2```).

The second rectangle is defined by its __bottom-left__ corner (```bx1```, ```by1```) and its __top-right__ corner (```bx2```, ```by2```).

#### Example 1:

![image](https://assets.leetcode.com/uploads/2021/05/08/rectangle-plane.png)

```
Input: ax1 = -3, ay1 = 0, ax2 = 3, ay2 = 4, bx1 = 0, by1 = -1, bx2 = 9, by2 = 2
Output: 45
```

#### Example 2:
```
Input: ax1 = -2, ay1 = -2, ax2 = 2, ay2 = 2, bx1 = -2, by1 = -2, bx2 = 2, by2 = 2
Output: 16
```

#### Constraints:
```
-104 <= ax1 <= ax2 <= 104
-104 <= ay1 <= ay2 <= 104
-104 <= bx1 <= bx2 <= 104
-104 <= by1 <= by2 <= 104
```

---

![image](https://leetcode.com/problems/rectangle-area/Figures/223/overview.png)

To find the overlap, we need to find the width and height of the overlapping area (if there is any). We can get the width by finding the overlap in the horizontal or x direction. height can be calculated by finding the overlap in the y direction.

To find the x overlap, let's think about the projection made by the corners of the rectangles on the x-axis. In other words, draw a line perpendicular to the x-axis from both rectangles' bottom left and top right corners. We mark the points at which these lines meet the x-axis. We can see that these points create two line segments - one formed by (ax1, 0), (ax2, 0)(ax1, 0),(ax2, 0), and the other one formed by (bx1, 0), (bx2, 0)(bx1, 0),(bx2, 0).

![image](https://leetcode.com/problems/rectangle-area/Figures/223/projection.png)

![image](https://leetcode.com/problems/rectangle-area/Figures/223/not-overlapping-lines.png)

![image](https://leetcode.com/problems/rectangle-area/Figures/223/overlapping-lines.png)

From the image above, we can see that if there is an overlap, ```min(ax2, bx2) - max(ax1, bx1)``` will be a positive quantity equal to the x overlap of the two rectangles. If the amount is negative or 0, there is no overlap between the two lines (and rectangles).

```xOverlap = min(ax2, bx2) - max(ax1, bx1)```

In a similar way, we can find the y overlap of the two rectangles.

```yOverlap = min(ay2, by2) - max(ay1, by1)```

The area of the overlap ```overlap = xOverlap * yOverlap```

The total area considering the overlap between the two rectangles:

```area = areaA + areaB - overlap```

#### Algorithm

1. We are given four points - ```{ax1, ay1}, {ax2, ay2} and {bx1, by1}, {bx2, by2}```.

2. Calculate ```area1``` and ```area2``` by multiplying width and height of the respective rectangles.

3. Calculate the x overlap:

```xOverlap = min(ax2, bx2) - max(ax1, bx1)```

4. Calculate the y overlap:

```yOverlap = min(ay2, by2) - max(ay1, by1)```

5. If ```xOverlap``` and ```yOverlap```, both are positive, multiply x and y overlaps to get the area of the overlap. Otherwise, it is 0.

6. Calculate the total area as - ```area1 + area2 - overlap```

7. Return the total area.
