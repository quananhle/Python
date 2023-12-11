## [1287. Element Appearing More Than 25% In Sorted Array](https://leetcode.com/problems/element-appearing-more-than-25-in-sorted-array)

```Tag```: ```Binary Search``` ```Hash Map``` ```Array & String```

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

### Array & String

![image](https://leetcode.com/problems/element-appearing-more-than-25-in-sorted-array/Figures/1287/1.png)

![image](https://leetcode.com/problems/element-appearing-more-than-25-in-sorted-array/Figures/1287/2.png)

```Python
class Solution:
    def findSpecialInteger(self, arr: List[int]) -> int:
        size = len(arr) // 4
        for i in range(len(arr) - size):
            if arr[i] == arr[i + size]:
                return arr[i]
        
        return -1
```

### Binary Search

![image](https://leetcode.com/problems/element-appearing-more-than-25-in-sorted-array/Figures/1287/3.png)

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(\log{}n)$
- __Space Complexity__: $\mathcal{O}(1)$

```Python
class Solution:
    def findSpecialInteger(self, arr: List[int]) -> int:
        n = len(arr)
        candidates = [arr[n // 4], arr[n // 2], arr[3 * n // 4]]
        target = n // 4

        def binary_search_left(array, x):
            lo, hi = 0, len(array)

            while lo < hi:
                mi = lo + (hi - lo) // 2
                if array[mi] < x:
                    lo = mi + 1
                else:
                    hi = mi
            
            return lo
        
        def binary_search_right(array, x):
            lo, hi = 0, len(array)

            while lo < hi:
                mi = lo + (hi - lo) // 2
                if array[mi] <= x:
                    lo = mi + 1
                else:
                    hi = mi
                
            return lo

        for candidate in candidates:
            '''
            left = bisect.bisect_left(arr, candidate)
            '''
            left = binary_search_left(arr, candidate)
            '''
            right = bisect.bisect_right(arr, candidate)
            '''
            right = binary_search_right(arr, candidate)
            if right - left > target:
                return candidate
            
        return -1
```
