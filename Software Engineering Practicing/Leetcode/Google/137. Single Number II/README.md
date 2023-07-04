## [137. Single Number II](https://leetcode.com/problems/single-number-ii/)

```Tag```: ```Sorting``` ```Hash Map``` ```Bitmasking```

#### Difficulty: Medium

Given an integer array ```nums``` where every element appears __three times__ except for one, which appears exactly once. Find the single element and return it.

You must implement a solution with a linear runtime complexity and use only constant extra space.

![image](https://github.com/quananhle/Python/assets/35042430/9f3167a4-bda8-45ab-ad62-6e4e3051b1cd)

---

__Example 1:__
```
Input: nums = [2,2,3,2]
Output: 3
```

__Example 2:__
```
Input: nums = [0,1,0,1,0,1,99]
Output: 99
```

__Constraints:__

- $1 <=$ ```nums.length``` $<= 3 * 10^{4}$
- $-2^{31} <=$ ```nums[i]``` $<= 2^{31} - 1$
- Each element in ```nums``` appears exactly three times except for one element which appears once.

---

### Sorting

```Python
class Solution:
    def singleNumber(self, nums: List[int]) -> int:
        nums.sort()
        n = len(nums)

        for i in range(0, n - 1, 3):
            if nums[i] == nums[i + 1]:
                continue
            else:
                return nums[i]
        
        return nums[n - 1]
```

### Hash Table

```Python
class Solution:
    def singleNumber(self, nums: List[int]) -> int:
        counter = collections.defaultdict(int)
        for num in nums:
            counter[num] = 1 + counter.get(num, 0)
        
        for key, val in counter.items():
            if val == 1:
                return key
        
        return -1
```

```Python
class Solution:
    def singleNumber(self, nums: List[int]) -> int:
        counter = collections.Counter(nums)

        for key, val in counter.items():
            if val == 1:
                return key
        
        return -1
```
