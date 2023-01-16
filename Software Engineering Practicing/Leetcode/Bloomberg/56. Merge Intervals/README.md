## 56. Merge Intervals

```Tag```:

#### Difficulty: Medium

Given an array of ```intervals``` where ```intervals[i]``` = [start<sub>i</sub>, end<sub>i</sub>], merge all overlapping intervals, and return _an array of the non-overlapping intervals that cover all the intervals in the input_.

![image](https://user-images.githubusercontent.com/35042430/212605592-49effbf1-3bd0-437b-b26c-9e42bf25ff68.png)

---

__Example 1:__
```
Input: intervals = [[1,3],[2,6],[8,10],[15,18]]
Output: [[1,6],[8,10],[15,18]]
Explanation: Since intervals [1,3] and [2,6] overlap, merge them into [1,6].
```

__Example 2:__
```
Input: intervals = [[1,4],[4,5]]
Output: [[1,5]]
Explanation: Intervals [1,4] and [4,5] are considered overlapping.
```

__Constraints:__
```
1 <= intervals.length <= 104
intervals[i].length == 2
0 <= starti <= endi <= 104
```

---

![image](https://leetcode.com/problems/merge-intervals/solutions/127480/Figures/56/sort.png)

### Sort

```Python
class Solution:
    def merge(self, intervals: List[List[int]]) -> List[List[int]]:
        # Time Complexity : O(NlogN), sort operations take NlogN time at worst
        # Space Complexity: O(N), extra memory space to rebuild the list of intervals
        intervals.sort(key=lambda x:x[0])
        res = []
        for interval in intervals:
            if not res or res[-1][1] < interval[0]:
                res.append(interval)
            else:
                merged_interval = [min(res[-1][0], interval[0]), max(res[-1][1], interval[1])]
                res[-1] = merged_interval
        return res
```
