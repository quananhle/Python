## [11. Container With Most Water](https://leetcode.com/problems/container-with-most-water)

```Tag```: ```Two Pointers```

#### Difficulty: Medium

You are given an integer array ```height``` of length ```n```. There are ```n``` vertical lines drawn such that the two endpoints of the i<sup>th</sup> line are ```(i, 0)``` and ```(i, height[i])```.

Find two lines that together with the x-axis form a container, such that the container contains the most water.

Return _the maximum amount of water a container can store_.

Notice that you may not slant the container.

![image](https://github.com/quananhle/Python/assets/35042430/991c793d-b4b2-4017-8d0c-8fa8c9d67341)

---

__Example 1:__

![image](https://s3-lc-upload.s3.amazonaws.com/uploads/2018/07/17/question_11.jpg)
```
Input: height = [1,8,6,2,5,4,8,3,7]
Output: 49
Explanation: The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In this case, the max area of water (blue section) the container can contain is 49.
```

__Example 2:__
```
Input: height = [1,1]
Output: 1
```

__Constraints:__

- ```n == height.length```
- ```2 <= n <= 10^5```
- ```0 <= height[i] <= 10^4```

---

### Brute Force (Time Limit Exceeded)

![image](https://github.com/quananhle/Python/assets/35042430/d6ef26be-213a-4af8-812b-4c913f157889)

```Python
class Solution:
    def maxArea(self, height: List[int]) -> int:
        # Brute Force
        ans = float('-inf')
        n = len(height)
        for i in range(1, n):
            for j in range(i):
                dy = min(height[i], height[j])
                dx = i - j
                ans = max(ans, dx * dy)
        
        return ans
```

### Two Pointers

![image](https://github.com/quananhle/Python/assets/35042430/453acda9-6353-4e93-8a16-9e4b26e382b6)

```Python
class Solution:
    def maxArea(self, height: List[int]) -> int:
        left, right = 0, len(height) - 1
        ans = float('-inf')

        while left < right:
            dy = min(height[left], height[right])
            dx = right - left
            ans = max(ans, dx * dy)

            if height[left] > height[right]:
                right -= 1
            elif height[left] < height[right]:
                left += 1
            else:
                left += 1
                right -= 1
        
        return ans
```

```Python
class Solution:
    def maxArea(self, height: List[int]) -> int:
        left, right = 0, len(height) - 1
        ans = float('-inf')

        while left < right:
            dy = min(height[left], height[right])
            dx = right - left
            ans = max(ans, dx * dy)

            if height[left] <= height[right]:
                left += 1
            else:
                right -= 1
        
        return ans
```
