## 218. The Skyline Problem

```Tag```:

#### Difficulty: Hard

A city's __skyline__ is the outer contour of the silhouette formed by all the buildings in that city when viewed from a distance. Given the locations and heights of all the buildings, return the skyline formed by these buildings collectively.

The geometric information of each building is given in the array __buildings__ where __buildings[i] = [lefti, righti, heighti]__:

- left<sub<i</sub> is the x coordinate of the left edge of the i<sup<th</sup> building.
- right<sub<i</sub> is the x coordinate of the right edge of the i<sup<th</sup> building.
- height<sub<i</sub> is the height of the i<sup<th</sup> building.

You may assume all buildings are perfect rectangles grounded on an absolutely flat surface at height ```0```.

The __skyline__ should be represented as a list of "key points" __sorted by their x-coordinate__ in the form ```[[x1,y1],[x2,y2],...]```s. Each key point is the left endpoint of some horizontal segment in the skyline except the last point in the list, which always has a y-coordinate ```0``` and is used to mark the skyline's termination where the rightmost building ends. Any ground between the leftmost and rightmost buildings should be part of the skyline's contour.

Note: There must be no consecutive horizontal lines of equal height in the output skyline. For instance, ```[...,[2 3],[4 5],[7 5],[11 5],[12 7],...]``` is not acceptable; the three lines of height 5 should be merged into one in the final output as such: ```[...,[2 3],[4 5],[12 7],...]```

![image](https://user-images.githubusercontent.com/35042430/218243642-e5474f83-00d4-4354-9ed5-0904a0872105.png)

---
