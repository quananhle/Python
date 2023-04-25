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

### Brute Force

```Python
class Solution:
    def minimumTotal(self, triangle: List[List[int]]) -> int:
        ans = 0
        
        for row in range(len(triangle)):
            curr = float('inf')
            for col in range(len(triangle[row])):
                curr = min(curr, triangle[row][col])
            ans += curr
        
        return ans
```

### The Framework

#### Top-Down Dynamic Programming

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

#### Bottom-Up Dynamic Programming

```Python

```

__Follow up__: Could you do this using only ```O(n)``` extra space, where ```n``` is the total number of rows in the triangle?


