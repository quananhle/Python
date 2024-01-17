## [128. Longest Consecutive Sequence](https://leetcode.com/problems/longest-consecutive-sequence)

```Tag```: ```Array & String``` ```Hash Set``` ```Sorting```

#### Difficulty: Medium

Given an unsorted array of integers ```nums```, return _the length of the longest consecutive elements sequence_.

You must write an algorithm that runs in ```O(n)``` time.

![image](https://github.com/quananhle/Python/assets/35042430/ba7c4e55-67d8-4a2c-8f5c-f13ab21ab459)

---

__Example 1:__
```
Input: nums = [100,4,200,1,3,2]
Output: 4
Explanation: The longest consecutive elements sequence is [1, 2, 3, 4]. Therefore its length is 4.
```

__Example 2:__
```
Input: nums = [0,3,7,2,5,8,4,6,0,1]
Output: 9
```

__Constraints:__

- $0 \le nums.length \le 10^5$
- $-10^9 \le nums[i] \le 10^9$

---

### Brute Force

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N^3)$.
- __Space Complexity__: $\mathcal{O}(1)$.

```Python
class Solution:
    def longestConsecutive(self, nums: List[int]) -> int:
        memo = set(nums)
        ans = 0
        
        for num in nums:
            start, end = num, num + 1
            curr_len = 1
            while end in memo:
                end += 1
                curr_len += 1
            ans = max(ans, curr_len)
        
        return ans
```

### Sorting & Hash Set

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N \log N)$.
- __Space Complexity__: $\mathcal{O}(N)$ or $\mathcal{O}(1)$.


```Python
class Solution:
    def longestConsecutive(self, nums: List[int]) -> int:
        num_set = set(nums)
        nums = list()

        for num in num_set:
            nums.append(num)

        ans = 0
        nums.sort()
        n = len(nums)
        i = 0
        while i < n:
            curr = 1
            while i + 1 < n and nums[i] + 1 == nums[i + 1]:
                i += 1
                curr += 1
            ans = max(ans, curr)
            i += 1
        
        return ans
```

#### ```SortedList()```

```Python
from sortedcontainers import SortedList
class Solution:
    def longestConsecutive(self, nums: List[int]) -> int:
        num_set = set()
        arr = SortedList()

        for num in nums:
            if num in num_set:
                continue
            arr.add(num)
            num_set.add(num)

        ans = 0
        n = len(arr)
        i = 0
        while i < n:
            curr = 1
            while i + 1 < n and arr[i] + 1 == arr[i + 1]:
                i += 1
                curr += 1
            ans = max(ans, curr)
            i += 1
        
        return ans
```

---

### Optimized Brute Force & Hash Set for Intelligent Sequence Building

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N)$.
- __Space Complexity__: $\mathcal{O}(N)$.

```Python
class Solution:
    def longestConsecutive(self, nums: List[int]) -> int:
        memo = set(nums)
        ans = 0
        
        for num in memo:
            # Only build sequences from numbers that are not already part of a longer sequence
            if not (num - 1) in memo:        # O(1)
                start_num = num
                start_len = 1

                while start_num + 1 in memo:
                    start_len += 1
                    start_num += 1

                ans = max(ans, start_len)

        return ans
```


