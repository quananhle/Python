## 218. The Skyline Problem

```Tag```: ```Priority Queue``` ```Divide & Conquer```

#### Difficulty: Hard

A city's __skyline__ is the outer contour of the silhouette formed by all the buildings in that city when viewed from a distance. Given the locations and heights of all the buildings, return the skyline formed by these buildings collectively.

The geometric information of each building is given in the array __buildings__ where __buildings[i] = [lefti, righti, heighti]__:

- left<sub>i</sub> is the x coordinate of the left edge of the i<sup>th</sup> building.
- right<sub>i</sub> is the x coordinate of the right edge of the i<sup>th</sup> building.
- height<sub>i</sub> is the height of the i<sup>th</sup> building.

You may assume all buildings are perfect rectangles grounded on an absolutely flat surface at height ```0```.

The __skyline__ should be represented as a list of "key points" __sorted by their x-coordinate__ in the form ```[[x1,y1],[x2,y2],...]```s. Each key point is the left endpoint of some horizontal segment in the skyline except the last point in the list, which always has a y-coordinate ```0``` and is used to mark the skyline's termination where the rightmost building ends. Any ground between the leftmost and rightmost buildings should be part of the skyline's contour.

Note: There must be no consecutive horizontal lines of equal height in the output skyline. For instance, ```[...,[2 3],[4 5],[7 5],[11 5],[12 7],...]``` is not acceptable; the three lines of height 5 should be merged into one in the final output as such: ```[...,[2 3],[4 5],[12 7],...]```

![image](https://user-images.githubusercontent.com/35042430/218243642-e5474f83-00d4-4354-9ed5-0904a0872105.png)

---

In this problem, we are given a list of buildings and would like to construct the skyline, a set of key points that describes the contour of the buildings, as shown in the picture below.

![image](https://leetcode.com/problems/the-skyline-problem/solutions/2375781/Figures/218_re/218_description.png)

### Approach 1: Brute Force

__Time Complexity:__ ```O(N^2)```

__Space Complexity:__ ```O(N)```

```Python
class Solution:
    def getSkyline(self, buildings: List[List[int]]) -> List[List[int]]:
        # Get the unique positions of left and right edges of all buildings
        unique_positions = sorted(list(set([x for building in buildings for x in building[:2]])))

        # Map positions and index of edges in pair
        edge_index_map = {x:i for i, x in enumerate(unique_positions)}
        # To record maximum height of each index
        heights = [0] * len(unique_positions)

        # Iterate over all the buildings
        for left, right, height in buildings:
            left_index = edge_index_map[left]
            right_index = edge_index_map[right]
            # Update the maximum height within the range [left_index, right_index]
            for i in range(left_index, right_index):
                heights[i] = max(heights[i], height)

        res = list()

        for i in range(len(heights)):
            curr_height = heights[i]
            curr_index = unique_positions[i]
            # Record any change of height
            if not res or res[-1][1] != curr_height:
                res.append([curr_index, curr_height])
        
        return res
```
