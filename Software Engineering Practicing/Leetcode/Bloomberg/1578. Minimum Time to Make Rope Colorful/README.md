## [1578. Minimum Time to Make Rope Colorful](https://leetcode.com/problems/minimum-time-to-make-rope-colorful/)

```Tag```: ```Two Pointers``` ```Greedy``` ```Math```

#### Difficulty: Medium

Alice has ```n``` balloons arranged on a rope. You are given a __0-indexed__ string colors where ```colors[i]``` is the color of the i<sup>th</sup> balloon.

Alice wants the rope to be colorful. She does not want __two consecutive balloons__ to be of the same color, so she asks Bob for help. Bob can remove some balloons from the rope to make it colorful. You are given a __0-indexed__ integer array neededTime where ```neededTime[i]``` is the time (in seconds) that Bob needs to remove the i<sup>th</sup> balloon from the rope.

Return _the minimum time Bob needs to make the rope colorful_.

![image](https://github.com/quananhle/Python/assets/35042430/c91a5c75-dea5-4f10-8a80-96d42933efdc)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/12/13/ballon1.jpg)
```
Input: colors = "abaac", neededTime = [1,2,3,4,5]
Output: 3
Explanation: In the above image, 'a' is blue, 'b' is red, and 'c' is green.
Bob can remove the blue balloon at index 2. This takes 3 seconds.
There are no longer two consecutive balloons of the same color. Total time = 3.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2021/12/13/balloon2.jpg)
```
Input: colors = "abc", neededTime = [1,2,3]
Output: 0
Explanation: The rope is already colorful. Bob does not need to remove any balloons from the rope.
```

__Example 3:__

![image](https://assets.leetcode.com/uploads/2021/12/13/balloon3.jpg)
```
Input: colors = "aabaa", neededTime = [1,2,3,4,1]
Output: 2
Explanation: Bob will remove the ballons at indices 0 and 4. Each ballon takes 1 second to remove.
There are no longer two consecutive balloons of the same color. Total time = 1 + 1 = 2.
```

__Constraints:__

- $n == colors.length == neededTime.length$
- $1 \le n \le 10^5$
- $1 \le neededTime[i] \le 10^4$
- ```colors``` contains only lowercase English letters.

---

### Two Pointers

![image](https://github.com/quananhle/Python/assets/35042430/01d00a15-fa2c-4237-b2b6-b95c079d18a8)

![image](https://leetcode.com/problems/minimum-time-to-make-rope-colorful/Figures/1578/1578-p-3.png)

__Key facts__:

- We need to keep exactly one balloon from each group.
- We should keep the balloon with the largest removal time among each group

![image](https://github.com/quananhle/Python/assets/35042430/5920ee8d-5919-48ac-aeac-2cb3fe6ff146)

![image](https://github.com/quananhle/Python/assets/35042430/0154bfbe-c4aa-4919-aae2-3cbaace8bf5d)

![image](https://github.com/quananhle/Python/assets/35042430/b525691c-12e6-4b83-b485-fc79b6ace5e8)

__Algorithm__

1. Initalize ```totalTime```, ```left``` and ```right``` as ```0```.
2. Iterate over balloons, for each group of balloons, we record the total removal time as ```currTotal``` and the maximum removal time as ```currMax```.
3. While the balloon indexed at ```right``` has the same color as the balloon indexed at ```left```, we update ```currTotal``` and ```currMax```, and increment right by ```1```.
4. Otherwise, it means that we have finished iterating this group, we should add the removal time for this group ```currTotal - currMax``` to ```totalTime```, and reset ```left``` as ```right```.

- __Time complexity__: ```O(n)```
- __Space complexity__: ```O(1)```

```Python
class Solution:
    def minCost(self, colors: str, neededTime: List[int]) -> int:
        ans = 0
        n = len(colors)
        left = right = 0

        while right < n:
            curr_total = curr_max = 0

            # Check all the elements in the same group
            while right < m and colors[left] == colors[right]:
                # Get the total time needed to remove every balloon in the current group
                curr_total += neededTime[right]
                # Only track the maximum value in the group to keep
                curr_max = max(curr_max, neededTime[right])
                # Iterate to the right until the end of the current group
                right += 1

            # No matter how many balloons there are in a same group, can only have at most 1 balloon in each group => leave out the maximum one
            # Hence, the minimum time needed to remove all balloons except the most expensive one is (total - most expensive)
            ans += curr_total - curr_max
            # Move on to the next group
            left = right
        
        return ans
```

### One Pass

```Python
class Solution:
    def minCost(self, colors: str, neededTime: List[int]) -> int:
        ans = curr_max = 0
        n = len(colors)
        for i in range(n):
            # Check if the current balloon is the first balloon of the group
            if i > 0 and colors[i] != colors[i - 1]:
                # Reset the maximum time needed to remove the balloon for the new group
                curr_max = 0
            
            # Add the time needed to remove the least expensive balloons in the group
            ans += min(curr_max, neededTime[i])
            # Update the most expensive balloon
            curr_max = max(curr_max, neededTime[i])
        
        return ans
```

```Python
class Solution:
    def minCost(self, colors: str, neededTime: List[int]) -> int:
        ans = 0
        n = len(colors)
        for i in range(1, n):
            # Check all the adjacent balloons in the same color group
            if colors[i] == colors[i - 1]:
                # Add the minimum time needed to remove a balloon
                ans += min(neededTime[i], neededTime[i - 1])
                # Update the maximum time needed to remove the most expensive balloon so far
                neededTime[i] = max(neededTime[i], neededTime[i - 1])
        return ans
```

```Python
class Solution:
    def minCost(self, colors: str, neededTime: List[int]) -> int:
        ans = 0
        n = len(colors)
        for i in range(n - 1):
            if colors[i] == colors[i + 1]:
                ans += min(neededTime[i], neededTime[i + 1])
                neededTime[i + 1] = max(neededTime[i], neededTime[i + 1])
        return ans
```
