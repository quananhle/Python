## [624. Maximum Distance in Arrays](https://leetcode.com/problems/maximum-distance-in-arrays)

```Tag```: ```Array & String```

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

### Brute Force

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
