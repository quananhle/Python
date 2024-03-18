## [452. Minimum Number of Arrows to Burst Balloons](https://leetcode.com/problems/minimum-number-of-arrows-to-burst-balloons)

```Tag```: ```Greedy```

#### Difficulty: Medium

There are some spherical balloons taped onto a flat wall that represents the XY-plane. The balloons are represented as a 2D integer array ```points``` where $points[i] = x_{start}, x_{end}$ denotes a balloon whose __horizontal diameter__ q  stretches between x<sub>start</sub> and x<sub>end</sub>. You do not know the exact y-coordinates of the balloons.

Arrows can be shot up __directly vertically__ (in the positive y-direction) from different points along the x-axis. A balloon with x<sub>start</sub> and x<sub>end</sub> is __burst__ by an arrow shot at ```x``` if $x_{start} \le x \le x_{end}$. There is no limit to the number of arrows that can be shot. A shot arrow keeps traveling up infinitely, bursting any balloons in its path.

Given the array ```points```, return _the minimum number of arrows that must be shot to burst all balloons_.

![image](https://github.com/quananhle/Python/assets/35042430/ad1eae8f-c8a9-4126-9b4a-76ff31ef5924)

---

__Example 1:__
```
Input: points = [[10,16],[2,8],[1,6],[7,12]]
Output: 2
Explanation: The balloons can be burst by 2 arrows:
- Shoot an arrow at x = 6, bursting the balloons [2,8] and [1,6].
- Shoot an arrow at x = 11, bursting the balloons [10,16] and [7,12].
```

__Example 2:__
```
Input: points = [[1,2],[3,4],[5,6],[7,8]]
Output: 4
Explanation: One arrow needs to be shot for each balloon for a total of 4 arrows.
```

__Example 3:__
```
Input: points = [[1,2],[2,3],[3,4],[4,5]]
Output: 2
Explanation: The balloons can be burst by 2 arrows:
- Shoot an arrow at x = 2, bursting the balloons [1,2] and [2,3].
- Shoot an arrow at x = 4, bursting the balloons [3,4] and [4,5].
```

__Constraints:__

- $1 \le points.length \le 10^5$
- $points[i].length == 2$
- $-2^{31} \le x_{start} < x_{end} \le 2^{31} - 1$

---

### Greedy Algorithms

Greedy problems usually look like "Find minimum number of something to do something" or "Find maximum number of something to fit in some conditions", and typically propose an unsorted input.

    The idea of greedy algorithm is to pick the locally optimal move at each step, that will lead to the globally optimal solution.

![image](https://leetcode.com/problems/minimum-number-of-arrows-to-burst-balloons/solutions/288049/Figures/452/balloons.png)

![image](https://leetcode.com/problems/minimum-number-of-arrows-to-burst-balloons/solutions/288049/Figures/452/arrows.png)

![image](https://leetcode.com/problems/minimum-number-of-arrows-to-burst-balloons/solutions/288049/Figures/452/sorted.png)

That means that one could always track the end of the current balloon, and ignore all the balloons which end before it. Once the current balloon is ended (= the next balloon starts after the current balloon), one has to increase the number of arrows by one and start to track the end of the next balloon.

Let's sort the points using the end of each point; when we try to shoot the first balloon (cover the first interval), we want to shoot as many other balloons as possible (cover as many different intervals as possible).

The best thing to do would be to shoot at the balloon's end (right side) so that it can cover as many overlapped balloons as possible since they are sorted.

```Python
class Solution:
    def findMinArrowShots(self, points: List[List[int]]) -> int:
        # Greedy Algorithms
        # Since all balloons must be bursted, the best way to shoot is the very right end of each balloon to get the overlapses
        
        # Sort the balloons by x-end coordinator
        points.sort(key = lambda x: x[1])
        
        count = 1
        first_balloon_x_end = points[0][1]
        for x_start, x_end in points:
            # Check if the current balloons starts after the end of another one
            if first_balloon_x_end < x_start:
                # Increase the number of arrows needed
                count += 1
                # Update the first end to the x-end coordinator of the current balloon
                first_balloon_x_end = x_end
        
        return count
```

```Python
class Solution:
    def findMinArrowShots(self, points: List[List[int]]) -> int:
        # Sort by the end coordinates of the balloons
        points.sort(key=lambda x:x[1])
        first_end = points[0][1]
        count = 1

        for next_start, next_end in points[1:]:
            if first_end < next_start:
                first_end = next_end
                count += 1

        return count
```
