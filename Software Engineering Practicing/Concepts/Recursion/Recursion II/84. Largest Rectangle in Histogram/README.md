## 84. Largest Rectangle in Histogram

```Tag```: ```Recursion``` ```Divide and Conquer``` ```Monotonic Stack```

#### Difficulty: Hard

Given an array of integers heights representing the histogram's bar height where the width of each bar is 1, return the area of the largest rectangle in the histogram.

![image](https://user-images.githubusercontent.com/35042430/218206802-191f90da-2552-437f-ac77-22121486632d.png)

---

Example 1:

![image](https://assets.leetcode.com/uploads/2021/01/04/histogram.jpg)
```
Input: heights = [2,1,5,6,2,3]
Output: 10
Explanation: The above is a histogram where width of each bar is 1.
The largest rectangle is shown in the red area, which has an area = 10 units.
```

__Example 2:__

```
Input: heights = [2,4]
Output: 4
```

__Constraints:__

- 1 <= ```heights.length``` <= 10<sup>5</sup>
- 0 <= ```heights[i]``` <= 10<sup>4</sup>

---

### Brute Force

![image](https://leetcode.com/media/original_images/84_Largest_Rectangle1.PNG)

__Time Complexity__: O(N<sup>3</sup>), looping inside a nested loop

__Space Complexity__: ```O(1)```, constant memory space for pointers

```Python
class Solution:
    def largestRectangleArea(self, heights: List[int]) -> int:
        max_area = 0
        # Start from a bar i
        for i in range(len(heights)):
            # Iterate from the i-th bar
            for j in range(i, len(heights)):
                # The height of the rectangle formed between any two bars will always be limited by the height of the shortest bar lying between them
                min_height = math.inf
                # Find the minimum height of the rectangle formed by i-th bar to j-th bar
                for bar in heights[i:j+1]:
                    min_height = min(min_height, bar)
                max_area = max( max_area, min_height * (j + 1 - i) )
        return max_area
```

### Optimized Brute Force

We can do one slight modification in the previous approach to optimize it to some extent. Instead of taking every possible pair and then finding the bar of minimum height lying between them everytime, we can find the bar of minimum height for current pair by using the minimum height bar of the previous pair.

```Python
class Solution:
    def largestRectangleArea(self, heights: List[int]) -> int:
        max_area = 0
        # Start from a bar i
        for i in range(len(heights)):
            # The height of the rectangle formed between any two bars will always be limited by the height of the shortest bar lying between them
            min_height = math.inf
            # Iterate from the i-th bar
            for j in range(i, len(heights)):
                # Find the minimum height of the rectangle formed by i-th bar to j-th bar
                min_height = min(min_height, heights[j])
                # Get the maximum area
                max_area = max( max_area, min_height * (j + 1 - i) )
        return max_area
```

### Divide and Conquer

![image](https://leetcode.com/media/original_images/84_Largest_Rectangle2.PNG)

__Time complexity:__ average Case: ```O(nlog⁡n)```, worst Case: ```O(n^2)```, if the numbers in the array are sorted, we don't gain the advantage of divide and conquer.

__Space complexity:__ ```O(n)```, recursion with worst case depth ```n```.

__Algorithm__

This approach relies on the observation that the rectangle with maximum area will be the maximum of:

    1. The widest possible rectangle with height equal to the height of the shortest bar.

    2. The largest rectangle confined to the left of the shortest bar(subproblem).

    3. The largest rectangle confined to the right of the shortest bar(subproblem).

```Python
class Solution:
    def largestRectangleArea(self, heights: List[int]) -> int:
        def divide_and_conquer(heights, start, end):
            # Base case
            if start > end:
                return 0
            
            min_idx = start
            for i in range(start, end + 1):
                if heights[min_idx] > heights[i]:
                    min_idx = i
                
            return max(heights[min_idx] * (end + 1 - start), 
                       divide_and_conquer(heights, start, min_idx - 1), 
                       divide_and_conquer(heights, min_idx + 1, end))

        return divide_and_conquer(heights, 0, len(heights) - 1)
```

### Monotonic Stack (Increasing Stack)

__Time complexity:__ ```O(n)```, n numbers are pushed and popped.

__Space complexity:__ ```O(n)```, stack of n numbers is built.

```Python
class Solution:
    def largestRectangleArea(self, heights: List[int]) -> int:
        stack = [-1]
        max_area = 0

        # Iterate through the histogram and keep track of increasing height bars only
        for i in range(len(heights)):
            # Check if the next bar is taller than its standing before neighbor
            while stack[-1] != -1 and heights[stack[-1]] >= heights[i]:
                # Pop out the the last element in stack which is the tallest bar before i-th bar
                curr_height = heights[stack.pop()]
                curr_width = i - stack[-1] - 1
                max_area = max(max_area, curr_height * curr_width)
            # Update the new tallest bar
            stack.append(i)

        # For the case where area of a single bar is bigger than or equals to the largest rectangle
        while stack[-1] != -1:
            curr_height = heights[stack.pop()]
            curr_width = len(heights) - stack[-1] - 1
            max_area = max(max_area, curr_height * curr_width)

        return max_area
```

```Python
class Solution:
    def largestRectangleArea(self, heights: List[int]) -> int:
        stack = []
        max_area = 0

        for idx, bar in enumerate(heights + [0]):
            while stack and heights[stack[-1]] >= bar:
                height = heights[stack.pop()]
                width = idx if not stack else idx - stack[-1] - 1
                max_area = max(max_area, height * width)
            stack.append(idx)
        return max_area
```
