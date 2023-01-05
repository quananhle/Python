## 435. Non-overlapping Intervals

```Tag```: ```Greedy Algorithms```

#### Difficulty: Medium

Given an array of intervals ```intervals``` where ```intervals[i]``` = [start<sub>i</sub >, end<sub>i</sub>], return _the minimum number of intervals you need to remove to make the rest of the intervals non-overlapping_.

![image](https://user-images.githubusercontent.com/35042430/210716590-f53a7d83-1494-44cd-9f0b-43fce7e48264.png)

---

__Example 1:__
```
Input: intervals = [[1,2],[2,3],[3,4],[1,3]]
Output: 1
Explanation: [1,3] can be removed and the rest of the intervals are non-overlapping.
```

__Example 2:__
```
Input: intervals = [[1,2],[1,2],[1,2]]
Output: 2
Explanation: You need to remove two [1,2] to make the rest of the intervals non-overlapping.
```

__Example 3:__
```
Input: intervals = [[1,2],[2,3]]
Output: 0
Explanation: You don't need to remove any of the intervals since they're already non-overlapping.
```

__Constraints:__
```
1 <= intervals.length <= 105
intervals[i].length == 2
-5 * 104 <= starti < endi <= 5 * 104
```

---
