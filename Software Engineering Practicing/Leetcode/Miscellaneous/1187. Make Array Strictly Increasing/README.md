## [1187. Make Array Strictly Increasing](https://leetcode.com/problems/make-array-strictly-increasing/)

```Tag```: ```Dynamic Programming``` ```Binary Search```

#### Difficulty: Hard

Given two integer arrays ```arr1``` and ```arr2```, return _the minimum number of operations (possibly zero) needed to make arr1 strictly increasing_.

In one operation, you can choose two indices ```0 <= i < arr1.length``` and ```0 <= j < arr2.length``` and do the assignment ```arr1[i] = arr2[j]```.

If there is no way to make ```arr1``` strictly increasing, return ```-1```.

---

__Example 1:__
```
Input: arr1 = [1,5,3,6,7], arr2 = [1,3,2,4]
Output: 1
Explanation: Replace 5 with 2, then arr1 = [1, 2, 3, 6, 7].
```

__Example 2:__
```
Input: arr1 = [1,5,3,6,7], arr2 = [4,3,1]
Output: 2
Explanation: Replace 5 with 3 and then replace 3 with 4. arr1 = [1, 3, 4, 6, 7].
```

__Example 3:__
```
Input: arr1 = [1,5,3,6,7], arr2 = [1,6,3,3]
Output: -1
Explanation: You can't make arr1 strictly increasing.
```

__Constraints:__

- ```1 <= arr1.length, arr2.length <= 2000```
- ```0 <= arr1[i], arr2[i] <= 10^9```

---

### The Framework

#### Top-Down Dynamic Programming

```Python

```

```Python
class Solution:
    def makeArrayIncreasing(self, arr1: List[int], arr2: List[int]) -> int:
        n, m = len(arr1), len(arr2)
        arr2.sort()

        @lru_cache(None)
        def dp(i, prev):
            # Base case
            if i == n:
                return 0
            
            ans = float('inf')

            # Recurrence relation: to replace or to skip
            if arr1[i] > prev:
                ans = dp(i + 1, arr1[i])
            
            curr = bisect.bisect_right(arr2, prev)

            if curr < m:
                ans = min(ans, dp(i + 1, arr2[curr]) + 1)
            
            return ans
        
        ans = dp(0, -1)
        return ans if ans != float('inf') else -1
```
