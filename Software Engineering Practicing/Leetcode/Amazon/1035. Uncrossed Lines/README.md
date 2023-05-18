## [1035. Uncrossed Lines](https://leetcode.com/problems/uncrossed-lines)

```Tag```: ```Dynamic Programming```

#### Difficulty: Medium

You are given two integer arrays ```nums1``` and ```nums2```. We write the integers of ```nums1``` and ```nums2``` (in the order they are given) on two separate horizontal lines.

We may draw connecting lines: a straight line connecting two numbers ```nums1[i]``` and ```nums2[j]``` such that:

- ```nums1[i] == nums2[j]```, and
- the line we draw does not intersect any other connecting (non-horizontal) line.

Note that a connecting line cannot intersect even at the endpoints (i.e., each number can only belong to one connecting line).

Return _the maximum number of connecting lines we can draw in this way_.

![image](https://github.com/quananhle/Python/assets/35042430/0c9f9c42-a11d-4b8e-a611-7a0aaea07999)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2019/04/26/142.png)
```
Input: nums1 = [1,4,2], nums2 = [1,2,4]
Output: 2
Explanation: We can draw 2 uncrossed lines as in the diagram.
We cannot draw 3 uncrossed lines, because the line from nums1[1] = 4 to nums2[2] = 4 will intersect the line from nums1[2]=2 to nums2[1]=2.
```

__Example 2:__
```
Input: nums1 = [2,5,1,2,5], nums2 = [10,5,2,1,5,2]
Output: 3
```

__Example 3:__
```
Input: nums1 = [1,3,7,1,7,5], nums2 = [1,9,2,5,1]
Output: 2
```

__Constraints:__

- ```1 <= nums1.length, nums2.length <= 500```
- ```1 <= nums1[i], nums2[j] <= 2000```

---

### The Framework

#### Top-Down Dynamic Programming

![image](https://leetcode.com/problems/uncrossed-lines/Figures/1035/1035-1.png)

```Python
class Solution:
    def maxUncrossedLines(self, nums1: List[int], nums2: List[int]) -> int:
        m, n = len(nums1), len(nums2)

        @lru_cache(None)
        def dp(i, j):
            # Base case
            if i == m or j == n:
                return 0
            
            # Recurrence relation
            if nums1[i] == nums2[j]:
                ans = 1 + dp(i + 1, j + 1)
            else:
                ans = max(dp(i + 1, j), dp(i, j + 1))
            return ans

        return dp(0, 0)
```

```Python
class Solution:
    def maxUncrossedLines(self, nums1: List[int], nums2: List[int]) -> int:
        m, n = len(nums1), len(nums2)
        memo = collections.defaultdict(int)

        def dp(i, j):
            # Base case
            if i >= m or j >= n:
                return 0

            if (i, j) in memo:
                return memo[(i, j)]

            # Recurrence relation: matched or unmatched?
            # Matched: iterate both pointers if matching elements found, and increment the count
            if nums1[i] == nums2[j]: 
                memo[(i, j)] = dp(i + 1, j + 1) + 1
            # Not matched: iterate either pointer, what will be the best outcome?
            else:
                memo[(i, j)] = max(dp(i + 1, j), dp(i, j + 1))
            return memo[(i, j)]

        return dp(0, 0)
```

#### Bottom-Up Dynamic Programming

```Python
class Solution:
    def maxUncrossedLines(self, nums1: List[int], nums2: List[int]) -> int:
        m, n = len(nums1), len(nums2)
        dp = collections.defaultdict(int)

        for i in range(m - 2, -2, -1):
            for j in range(n - 2, -2, -1):
                if nums1[i + 1] == nums2[j + 1]:
                    dp[(i, j)] = 1 + dp[(i + 1, j + 1)]
                else:
                    dp[(i, j)] = max(dp[(i + 1, j)], dp[(i, j + 1)])
        
        return dp[(-1, -1)]
```

```Python

```

#### Space Optimized Bottom-Up Dynamic Programming

```Python

```
