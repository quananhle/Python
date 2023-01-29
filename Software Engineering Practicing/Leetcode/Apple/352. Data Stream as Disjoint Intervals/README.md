## 352. Data Stream as Disjoint Intervals

```Tag```: ```Binary Search```

#### Difficulty: Medium

Given a data stream input of non-negative integers ```a1, a2, ..., an```, summarize the numbers seen so far as a list of disjoint intervals.

Implement the ```SummaryRanges``` class:

- ```SummaryRanges()``` Initializes the object with an empty stream.
- ```void addNum(int value)``` Adds the integer ```value``` to the stream.
- ```int[][] getIntervals()``` Returns a summary of the integers in the stream currently as a list of disjoint intervals [start<sup>i</sup>, end<sup>i</sup>]. The answer should be sorted by start<sup>i</sup>.

![image](https://user-images.githubusercontent.com/35042430/215296641-6425695f-4657-4c16-b05c-44216b3eaef0.png)

---

__Example 1:__
```
Input
["SummaryRanges", "addNum", "getIntervals", "addNum", "getIntervals", "addNum", "getIntervals", "addNum", "getIntervals", "addNum", "getIntervals"]
[[], [1], [], [3], [], [7], [], [2], [], [6], []]
Output
[null, null, [[1, 1]], null, [[1, 1], [3, 3]], null, [[1, 1], [3, 3], [7, 7]], null, [[1, 3], [7, 7]], null, [[1, 3], [6, 7]]]

Explanation
SummaryRanges summaryRanges = new SummaryRanges();
summaryRanges.addNum(1);      // arr = [1]
summaryRanges.getIntervals(); // return [[1, 1]]
summaryRanges.addNum(3);      // arr = [1, 3]
summaryRanges.getIntervals(); // return [[1, 1], [3, 3]]
summaryRanges.addNum(7);      // arr = [1, 3, 7]
summaryRanges.getIntervals(); // return [[1, 1], [3, 3], [7, 7]]
summaryRanges.addNum(2);      // arr = [1, 2, 3, 7]
summaryRanges.getIntervals(); // return [[1, 3], [7, 7]]
summaryRanges.addNum(6);      // arr = [1, 2, 3, 6, 7]
summaryRanges.getIntervals(); // return [[1, 3], [6, 7]]
```

__Constraints:__

- 0 <= value <= 10<sup>4</sup>
- At most 3 * 10<sup>4</sup> calls will be made to ```addNum``` and ```getIntervals```.

__Follow up__: What if there are lots of merges and the number of disjoint intervals is small compared to the size of the data stream?

---

```Python
class SummaryRanges:
    def __init__(self):
        self.intervals = []

    def addNum(self, value: int) -> None:
        if not self.intervals:
            self.intervals.append([value, value])
            return
        left, right = 0, len(self.intervals) - 1
        while left <= right:
            mid = (left + right) // 2
            if self.intervals[mid][1] < value:
                left = mid + 1
            else:
                right = mid - 1
        if left < len(self.intervals) and self.intervals[left][0] <= value <= self.intervals[left][1]:
            return
        if left > 0 and self.intervals[left - 1][1] + 1 == value:
            self.intervals[left - 1][1] = value
            if left < len(self.intervals) and value + 1 == self.intervals[left][0]:
                self.intervals[left - 1][1] = self.intervals[left][1]
                self.intervals.pop(left)
        elif left < len(self.intervals) and value + 1 == self.intervals[left][0]:
            self.intervals[left][0] = value
        else:
            self.intervals.insert(left, [value, value])

    def getIntervals(self) -> List[List[int]]:
        return self.intervals


# Your SummaryRanges object will be instantiated and called as such:
# obj = SummaryRanges()
# obj.addNum(value)
# param_2 = obj.getIntervals()
```
