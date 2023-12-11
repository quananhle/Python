## [1287. Element Appearing More Than 25% In Sorted Array](https://leetcode.com/problems/element-appearing-more-than-25-in-sorted-array)

```Tag```: ```Binary Search``` ```Hash Map```

#### Difficulty: Easy

Given an integer ```array``` sorted in non-decreasing order, there is exactly one integer in the array that occurs more than 25% of the time, return _that integer_.

---

__Example 1:__
```
Input: arr = [1,2,2,6,6,6,6,7,10]
Output: 6
```

__Example 2:__
```
Input: arr = [1,1]
Output: 1
```

__Constraints:__

- $1 \le arr.length \le 10^4$
- $0 \le arr[i] \le 10^5$

---

### Counter with Hash Map

```Python
class Solution:
    def findSpecialInteger(self, arr: List[int]) -> int:        
        counter = collections.Counter(arr)
        for key, val in counter.items():
            if val > len(arr) // 4:
                return key
        
        return -1
```

```Python
class Solution:
    def findSpecialInteger(self, arr: List[int]) -> int:
        counter = collections.defaultdict(int)
        for num in arr:
            counter[num] += 1
            if counter[num] > len(arr) // 4:
                return num
        
        return -1
```
