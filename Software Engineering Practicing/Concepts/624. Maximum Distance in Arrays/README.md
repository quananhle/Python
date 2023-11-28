## [624. Maximum Distance in Arrays](https://leetcode.com/problems/maximum-distance-in-arrays)

```Tag```: ```Array & String``` ```Greedy Algorithm```

#### Difficulty: Medium

You are given ```m``` arrays, where each array is sorted in ascending order.

You can pick up two integers from two different arrays (each array picks one) and calculate the distance. We define the distance between two integers ```a``` and ```b``` to be their absolute difference ```|a - b|```.

Return _the maximum distance_.

---

__Example 1:__
```
Input: arrays = [[1,2,3],[4,5],[1,2,3]]
Output: 4
Explanation: One way to reach the maximum distance 4 is to pick 1 in the first or third array and pick 5 in the second array.
```

__Example 2:__
```
Input: arrays = [[1],[1]]
Output: 0
```

__Constraints:__

- $m == arrays.length$
- $2 \le m \le 10^5$
- $1 \le arrays[i].length \le 500$
- $-10^4 \le arrays[i][j] \le 10^4$
- ```arrays[i]``` is sorted in ascending order.
- There will be at most $10^5$ integers in all the arrays.

---

### Brute Force (Time Limit Exceeded)

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}((n \cdot x)^2)$
- __Space Complexity__: $\mathcal{O}(1)$

```Python
class Solution:
    def maxDistance(self, arrays: List[List[int]]) -> int:
        ans = 0
        n = len(arrays)

        for i in range(n):
            for j in range(len(arrays[i])):
                for k in range(i + 1, n):
                    for l in range(len(arrays[k])):
                        ans = max(ans, abs(arrays[i][j] - arrays[k][l]))
        
        return ans
```

#### Time-Optimized Brute Force

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(n^2)$
- __Space Complexity__: $\mathcal{O}(1)$

```Python
class Solution:
    def maxDistance(self, arrays: List[List[int]]) -> int:
        ans = 0
        n = len(arrays)

        for i in range(n - 1):
            for j in range(i + 1, n):
                ans = max(ans, abs(arrays[i][0] - arrays[j][-1]))
                ans = max(ans, abs(arrays[i][-1] - arrays[j][0]))
        return ans
```

### Greedy Algorithm

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(n)$
- __Space Complexity__: $\mathcal{O}(1)$

```Python
class Solution:
    def maxDistance(self, arrays: List[List[int]]) -> int:
        ans = 0
        start, end = arrays[0][0], arrays[0][-1]
        
        for array in arrays[1:]:
            ans = max(ans, max(abs(array[0] - end), abs(start - array[-1])))
            start = min(start, array[0])
            end = max(end, array[-1])
            
        return ans
```

