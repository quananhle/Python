## 414. Third Maximum Number

```Tag```: ```Sort``` ```Priority Queue``` ```Min-Heap``` ```Three Pointers``` ```Hash Set``` ```Hash Table```

#### Difficulty: Easy

Given an integer array ```nums```, return _the __third distinct maximum__ number in this array_. If the third maximum does not exist, return the __maximum__ number_.

![image](https://user-images.githubusercontent.com/35042430/213017833-73c6fa75-5436-47ce-8aa3-784d92d4cc89.png)

---

__Example 1:__
```
Input: nums = [3,2,1]
Output: 1
Explanation:
The first distinct maximum is 3.
The second distinct maximum is 2.
The third distinct maximum is 1.
```

__Example 2:__
```
Input: nums = [1,2]
Output: 2
Explanation:
The first distinct maximum is 2.
The second distinct maximum is 1.
The third distinct maximum does not exist, so the maximum (2) is returned instead.
```

__Example 3:__
```
Input: nums = [2,2,3,1]
Output: 1
Explanation:
The first distinct maximum is 3.
The second distinct maximum is 2 (both 2's are counted together since they have the same value).
The third distinct maximum is 1.
```

__Constraints:__
```
1 <= nums.length <= 104
-231 <= nums[i] <= 231 - 1
```

---

### Brute Force

```Python
class Solution:
    def thirdMax(self, nums: List[int]) -> int:
        # Brute Force
        #### Time Complexity : O(N), traverse through the input array twice
        #### Space Complexity: O(N), extra memory space to buid the lists
        if len(set(nums)) < 3:
            return max(nums)
        distinct_list = list()
        max_num = max(nums)
        for num in set(nums):
            if not num in distinct_list and num < max_num:
                distinct_list.append(num)
        res = list()
        max_num = max(distinct_list)
        for num in set(distinct_list):
            if not num in res and num <max_num:
                res.append(num)
        return max(res)
```

### Sorting

```Python
class Solution:
    def thirdMax(self, nums: List[int]) -> int:
        # Sorting
        #### Time Complexity : O(NlogN), sort operations take NlogN time
        #### Space Complexity: O(1), constant memory as the unique number array contains at most 3 elements
        if len(set(nums)) < 3:
            return max(nums)
        distinct_list = list()
        for num in sorted(nums)[::-1]:
            if not num in distinct_list:
                distinct_list.append(num)
            if len(distinct_list) == 4:
                distinct_list.pop()
        return distinct_list[2]
```

### Priority Queue

```Python
class Solution:
    def thirdMax(self, nums: List[int]) -> int:
        # Priority Queue
        #### Time Complexity : O(N), traverse through the input array to build min heap
        #### Space Complexity: O(N), extra memory space to buid the priority queue
        if len(set(nums)) < 3:
            return max(nums)
        min_heap = list()
        heapq.heapify(min_heap)
        for num in nums:
            if not -num in min_heap:
                heapq.heappush(min_heap, -num)
        for _ in range(3):
            ans = heapq.heappop(min_heap)
        return -ans
```

__Follow up__: Can you find an O(n) time and O(1) space solution?

### Priority Queue

```Python
class Solution:
    def thirdMax(self, nums: List[int]) -> int:
        # Priority Queue
        #### Time Complexity : O(N), traverse through the input array to build min heap
        #### Space Complexity: O(N), extra memory space to buid the priority queue
        if len(set(nums)) < 3:
            return max(nums)
        min_heap = list()
        heapq.heapify(min_heap)
        for num in nums:
            if not num in min_heap:
                heapq.heappush(min_heap, num)
            if len(min_heap) > 3:
                heapq.heappop(min_heap)
        return min_heap[0]
```

### Three Pointers

```Python
class Solution:
    def thirdMax(self, nums: List[int]) -> int:
        # Three Pointers
        #### Time Complexity : O(N), traverse through the input array thrrice takes 3*N time to find maximum numbers first, second, third
        #### Space Complexity: O(1), constant memory space for pointers
        first = float('-inf')
        second = float('-inf')
        third = float('-inf')
        for num in nums:
            if first < num:
                first = num
        for num in nums:
            if second < num < first:
                second = num
        for num in nums:
            if third < num < second:
                third = num
        if second == float('-inf') or third == float('-inf'):
            return int(first)
        return int(third)
```

```Python
class Solution:
    def thirdMax(self, nums: List[int]) -> int:
        # Three Pointers
        #### Time Complexity : O(N), traverse through the input array once to find maximum, second maximum, third maximum numbers
        #### Space Complexity: O(1), constant memory space for pointers
        first = float('-inf')
        second = float('-inf')
        third = float('-inf')
        for num in nums:
            # Check if num has already been encountered
            if first == num or second == num or third == num:
                continue
            if first < num:
                third, second, first = second, first, num
            elif second < num:
                third, second = second, num
            elif third < num:
                third = num
        # Check if third number was updated; if not, the third maximum does not exist
        if third == -inf:
            return first
        return third
```

#### In case environment does not support long, big integers, etc

```Python
class Solution:
    def thirdMax(self, nums: List[int]) -> int:
        # Three Pointers
        #### Time Complexity : O(N), traverse through the input array thrrice to find maximum numbers first, second, third
        #### Space Complexity: O(1), constant memory space for pointers
        first = (False, -1)
        second = (False, -1)
        third = (False, -1)
        for num in nums:
            # Check if num has already been encountered
            if (first[0] and first[1] == num) or (second[0] and second[1] == num) or (third[0] and third[1] == num):
                continue
            if not first[0] or first[1] < num:
                third, second, first = second, first, (True, num)
            elif not second[0] or second[1] < num:
                third, second = second, (True, num)
            elif not third[0] or third[1] < num:
                third = (True, num)
        # Check if third number was updated; if not, the third maximum does not exist
        if not third[0]:
            return first[1]
        return third[1]
```
