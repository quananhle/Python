## [120. Triangle](https://leetcode.com/problems/triangle)

```Tag```: ```Recursion``` ```Dynamic Programming```

#### Difficulty: Medium

Given a ```triangle``` array, return _the minimum path sum from top to bottom_.

For each step, you may move to an adjacent number of the row below. More formally, if you are on index ```i``` on the current row, you may move to either index ```i``` or index ```i + 1``` on the next row.

![image](https://user-images.githubusercontent.com/35042430/234337303-519ce4de-e804-4403-8b37-4f4c0787ea7b.png)

---

__Example 1:__
```
Input: triangle = [[2],[3,4],[6,5,7],[4,1,8,3]]
Output: 11
Explanation: The triangle looks like:
   2
  3 4
 6 5 7
4 1 8 3
The minimum path sum from top to bottom is 2 + 3 + 5 + 1 = 11 (underlined above).
```

__Example 2:__
```
Input: triangle = [[-10]]
Output: -10
```

__Constraints:__

- ```1 <= triangle.length <= 200```
- ```triangle[0].length == 1```
- ```triangle[i].length == triangle[i - 1].length + 1```
- -10<sup>4</sup> <= ```triangle[i][j]``` <= 10<sup>4</sup>

---

__Interview Tip: In-place Algorithms__

      In-place algorithms overwrite the input to save space, but sometimes this can cause problems. 
      Here are a couple of situations where an in-place algorithm might not be suitable.

      - The algorithm needs to run in a multi-threaded environment, without exclusive access to the array. 
      Other threads might need to read the array too, and might not expect it to be modified.
      - Even if there is only a single thread, or the algorithm has exclusive access to the array while running, 
      the array might need to be reused later or by another thread once the lock has been released.
      
      In an interview, you should always check whether or not the interviewer minds you overwriting the input. 
      Be ready to explain the pros and cons of doing so if asked!

### Brute Force

- __Time Complexity__: ```O(N * M)```.
- __Time Complexity__: ```O(1)```.

```Python
class Solution:
    def minimumTotal(self, triangle: List[List[int]]) -> int:
        for row in range(len(triangle) - 2, -1, -1):
            for col in range(len(triangle[row])):
                triangle[row][col] += min(triangle[row + 1][col], triangle[row + 1][col + 1])
                
        return triangle[0][0]
```

### The Framework

#### Bottom-Up Dynamic Programming

![image](https://leetcode.com/problems/triangle/Figures/120/triangle_coordinates.png)

```Python
class Solution:
    def minimumTotal(self, triangle: List[List[int]]) -> int:
        m = len(triangle)

        for row in range(1, m):
            for col in range(row + 1):
                curr = math.inf
                if col > 0:
                    curr = triangle[row - 1][col - 1]
                if col < row:
                    curr = min(curr, triangle[row - 1][col])
                triangle[row][col] += curr
        
        return min(triangle[-1])
```

#### Top-Down Dynamic Programming

- __Time Complexity__: ```O(N^2)```.
- __Time Complexity__: ```O(N^2)```.

```Python
class Solution:
    def minimumTotal(self, triangle: List[List[int]]) -> int:
        m = len(triangle)
        memo = collections.defaultdict(int)

        def dp(row, col):
            # Base case
            if not (0 <= row < m):
                return 0
            
            if (row, col) in memo:
                return memo[(row, col)]

            memo[(row, col)] = triangle[row][col]
            # Recurrence relation: find the minimum number in the next row to add to the final output
            memo[(row, col)] += min(dp(row + 1, col), dp(row + 1, col + 1))
            return memo[(row, col)]

        return dp(0, 0)
```

```Python
class Solution:
    def minimumTotal(self, triangle: List[List[int]]) -> int:
        m = len(triangle)

        @lru_cache(None)
        def dp(row, col):
            # Base case
            if not (0 <= row < m):
                return 0
            
            # Recurrence relation: find the minimum number in the next row to add to the final output
            path = triangle[row][col]
            path += min(dp(row + 1, col), dp(row + 1, col + 1))
            return path

        return dp(0, 0)
```



__Follow up__: Could you do this using only ```O(n)``` extra space, where ```n``` is the total number of rows in the triangle?


