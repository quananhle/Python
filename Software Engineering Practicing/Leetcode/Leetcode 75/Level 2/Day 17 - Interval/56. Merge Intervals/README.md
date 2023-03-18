## [56. Merge Intervals](https://leetcode.com/problems/merge-intervals/?envType=study-plan&id=level-2)

```Tag```:

#### Difficulty: Medium

Given an array of ```intervals``` where ```intervals[i]``` = [start<sub>i</sub>, end<sub>i</sub>], merge all overlapping intervals, and return _an array of the non-overlapping intervals that cover all the intervals in the input_.

![image](https://user-images.githubusercontent.com/35042430/226142064-d05d537d-bc61-4e46-b8f2-8b9fa6c69776.png)

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

- ```1 <= intervals.length <= 10^4```
- ```intervals[i].length == 2```
- 0 <= start<sub>i</sub> <= end<sub>i</sub> <= 10<sup>4</sup>

---

