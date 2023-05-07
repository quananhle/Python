## [1964. Find the Longest Valid Obstacle Course at Each Position](https://leetcode.com/problems/find-the-longest-valid-obstacle-course-at-each-position/)

```Tag```:

#### Difficulty: Hard

You want to build some obstacle courses. You are given a __0-indexed__ integer array ```obstacles``` of length ```n```, where ```obstacles[i]``` describes the height of the i<sup>th</sup> obstacle.

For every index ```i``` between ```0``` and ```n - 1``` (inclusive), find the length of the longest obstacle course in ```obstacles``` such that:

- You choose any number of ```obstacles``` between ```0``` and ```i``` inclusive.
- You must include the i<sup>th</sup> obstacle in the course.
- You must put the chosen obstacles in the same order as they appear in ```obstacles```.
- Every ```obstacle``` (except the first) is taller than or the same height as the ```obstacle``` immediately before it.

Return an array ```ans``` of length ```n```, where ```ans[i]``` is the length of the longest obstacle course for index ```i``` as described above.

![image](https://user-images.githubusercontent.com/35042430/236702544-2695b4c9-7460-4d63-baa9-5928784a5d19.png)

---

__Example 1:__
```
Input: obstacles = [1,2,3,2]
Output: [1,2,3,3]
Explanation: The longest valid obstacle course at each position is:
- i = 0: [1], [1] has length 1.
- i = 1: [1,2], [1,2] has length 2.
- i = 2: [1,2,3], [1,2,3] has length 3.
- i = 3: [1,2,3,2], [1,2,2] has length 3.
```

__Example 2:__
```
Input: obstacles = [2,2,1]
Output: [1,2,1]
Explanation: The longest valid obstacle course at each position is:
- i = 0: [2], [2] has length 1.
- i = 1: [2,2], [2,2] has length 2.
- i = 2: [2,2,1], [1] has length 1.
```

__Example 3:__
```
Input: obstacles = [3,1,5,6,4,2]
Output: [1,1,2,3,2,2]
Explanation: The longest valid obstacle course at each position is:
- i = 0: [3], [3] has length 1.
- i = 1: [3,1], [1] has length 1.
- i = 2: [3,1,5], [3,5] has length 2. [1,5] is also valid.
- i = 3: [3,1,5,6], [3,5,6] has length 3. [1,5,6] is also valid.
- i = 4: [3,1,5,6,4], [3,4] has length 2. [1,4] is also valid.
- i = 5: [3,1,5,6,4,2], [1,2] has length 2.
```

__Constraints:__

- ```n == obstacles.length```
- ```1 <= n <= 10^5```
- ```1 <= obstacles[i] <= 10^7```

---

__Overview__

As shown in the picture, we have ```4``` obstacles.

- The longest course ending at ```obstacles[0]``` contains ```1``` obstacle, ```obstacles[0]``` itself.
- The longest course ending at ```obstacles[1]``` contains ```2``` obstacles, ```obstacles[0]``` and ```[1]```.
- The longest course ending at ```obstacles[2]``` contains ```3``` obstacles, ```obstacles[0]```, ```[1]```, and ```[2]```.
- The longest course ending at ```obstacles[3]``` contains ```3``` obstacles, ```obstacles[0]```, ```[1]```, and ```[3]```. Note that the course must be non-decreasing so it can't contain ```obstacles[2]``` as it is taller than ```obstacles[3]```.

![image](https://leetcode.com/problems/find-the-longest-valid-obstacle-course-at-each-position/Figures/1964/1.png)

We need to find ```answer```, where ```answer[i]``` represents the length of the longest course that ends with ```obstacles[i]```. In our case, ```answer = [1, 2, 3, 3]```.

### Greedy & Binary Search

![image](https://leetcode.com/problems/find-the-longest-valid-obstacle-course-at-each-position/Figures/1964/3.png)

![image](https://leetcode.com/problems/find-the-longest-valid-obstacle-course-at-each-position/Figures/1964/4.png)

![image](https://leetcode.com/problems/find-the-longest-valid-obstacle-course-at-each-position/Figures/1964/5.png)

![image](https://leetcode.com/problems/find-the-longest-valid-obstacle-course-at-each-position/Figures/1964/2.png)

![image](https://leetcode.com/problems/find-the-longest-valid-obstacle-course-at-each-position/Figures/1964/2_1.png)

__Algorithm__

1. Initialize an empty array ```lis```, an array ```answer``` of the same length as ```obstacles```.
2. Iterate over ```obstacles```. At each step ```i```, we find ```idx```, the __rightmost insertion position__ of ```obstacles[i]``` to ```lis```.
- If ```idx``` equals the length of ```lis```, append ```obstacles[i]``` to ```lis```.
- Otherwise, update ```lis[idx] = obstacles[i]```.
- Update ```answer[i] = idx + 1```.
3. Return ```answer``` once the iteration ends.

```Python
class Solution:
    def longestObstacleCourseAtEachPosition(self, obstacles: List[int]) -> List[int]:
        n = len(obstacles)
        answer = [1] * n

        lis = list()

        for i, height in enumerate(obstacles):
            lo, hi = 0, len(lis)
            while lo < hi:
                mi = lo + (hi - lo) // 2
                if lis[mi] <= height:
                    lo = mi + 1
                else:
                    hi = mi                
            idx = lo
            if idx == len(lis):
                lis.append(height)
            else:
                lis[idx] = height

            answer[i] = idx + 1
        
        return answer
```

```Python
class Solution:
    def longestObstacleCourseAtEachPosition(self, obstacles: List[int]) -> List[int]:
        n = len(obstacles)
        answer = [1] * n

        lis = list()

        for i, height in enumerate(obstacles):
            idx = bisect.bisect_right(lis, height)
            if idx == len(lis):
                lis.append(height)
            else:
                lis[idx] = height

            answer[i] = idx + 1
        
        return answer
```
