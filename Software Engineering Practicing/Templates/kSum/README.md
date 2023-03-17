## kSum

```Tag```: ```Two Pointers``` ```Hash Map``` ```Binary Search```

### [Two Sum](https://leetcode.com/problems/two-sum/)

```Python
class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        memo = collections.defaultdict(int)
        for idx, num in enumerate(nums):
            complement = target - num
            if complement in memo:
                return [idx, memo[complement]]
            else:
                memo[num] = idx
```

### [Two Sum II - Input Array Is Sorted](https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/)

```Python
class Solution:
    def twoSum(self, numbers: List[int], target: int) -> List[int]:
        lo, hi = 0, n - 1

        while lo < hi:
            total = numbers[lo] + numbers[hi]
            if total < target:
                lo += 1
            elif total > target:
                hi -= 1
            else:
                return [lo + 1, hi + 1]
```

### [3Sum](https://leetcode.com/problems/3sum/)


Given an integer array ```nums```, return all the triplets ```[nums[i], nums[j], nums[k]]``` such that ```i != j```, ```i != k```, and ```j != k```, and ```nums[i] + nums[j] + nums[k] == 0```.

Notice that the solution set must not contain duplicate triplets.

__Example 1__:
```
Input: nums = [-1,0,1,2,-1,-4]
Output: [[-1,-1,2],[-1,0,1]]
Explanation: 
nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0.
nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0.
nums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0.
The distinct triplets are [-1,0,1] and [-1,-1,2].
Notice that the order of the output and the order of the triplets does not matter.
```

__Two Pointers__

```Python
class Solution:
    def threeSum(self, nums: List[int]) -> List[List[int]]:
        seen = set()
        n = len(nums)
        res = set()
        for i in range(n):
            for j in range(i+1, n):
                complement = -(nums[i] + nums[j])
                if complement in seen:
                    tmp = sorted([complement, nums[i], nums[j]])
                    res.add((tmp[0], tmp[1], tmp[2]))
            seen.add(nums[i])
        return res
```

__Sorting__

```Python
class Solution:
    def threeSum(self, nums: List[int]) -> List[List[int]]:
        res = set()
        nums.sort()
        n = len(nums)

        def twoSumII(nums, i, res):
            lo, hi = i + 1, len(nums) - 1
            while (lo < hi):
                total = nums[i] + nums[lo] + nums[hi]
                if total < 0:
                    lo += 1
                elif total > 0:
                    hi -= 1
                else:
                    res.add((nums[i], nums[lo], nums[hi]))
                    lo += 1
                    hi -= 1
                    while lo < hi and nums[lo] == nums[lo - 1]:
                        lo += 1
                    while hi > lo and nums[hi] == nums[hi + 1]:
                        hi -= 1

        for i in range(n):
            if i == 0 or nums[i - 1] != nums[i]:
                twoSumII(nums, i, res)

        return res
```

### [3Sum](https://leetcode.com/problems/3sum-closest/)

Given an integer array ```nums``` of length ```n``` and an integer ```target```, find three integers in ```nums``` such that the sum is closest to ```target```.

Return _the sum of the three integers_.

You may assume that each input would have exactly one solution.

__Example 1:__
```
Input: nums = [-1,2,1,-4], target = 1
Output: 2
Explanation: The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).
```

#### Sorting

```Python
class Solution:
    def threeSumClosest(self, nums: List[int], target: int) -> int:
        diff = float('inf')
        nums.sort()
        for i in range(len(nums)):
            lo, hi = i + 1, len(nums) - 1
            while lo < hi:
                total = nums[i] + nums[lo] + nums[hi]
                if abs(target - total) < abs(diff):
                    diff = target - total
                if total < target:
                    lo += 1
                else:
                    hi -= 1
                
            if diff == 0:
                break
        return target - diff
```

### [4Sum](https://leetcode.com/problems/4sum/)

Given an array nums of ```n``` integers, return _an array of all the __unique__ quadruplets_ ```[nums[a], nums[b], nums[c], nums[d]]``` such that:

- ```0 <= a, b, c, d < n```
- ```a```, ```b```, ```c```, and ```d``` are distinct.
- ```nums[a] + nums[b] + nums[c] + nums[d] == target```

You may return the answer in any order.

__Example 1:__
```
Input: nums = [1,0,-1,0,-2,2], target = 0
Output: [[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]
```

```Python
class Solution:
    def fourSum(self, nums: List[int], target: int) -> List[List[int]]:
        seen = set()
        n = len(nums)
        res = set()
        for i in range(n):
            for j in range(i+1, n):
                for k in range(j+1, n):
                    complement = target - nums[i] - nums[j] - nums[k]
                    if complement in seen:
                        tmp = sorted([complement, nums[i], nums[j], nums[k]])
                        res.add((tmp[0], tmp[1], tmp[2], tmp[3]))
            seen.add(nums[i])
        return res
```

### 4Sum II

```Python
class Solution:
    def fourSumCount(self, nums1: List[int], nums2: List[int], nums3: List[int], nums4: List[int]) -> int:
        count = 0
        memo = collections.defaultdict(int)
        for i in nums1:
            for j in nums2: 
                memo[i+j] += 1
        for k in nums3:
            for l in nums4:                 
                count += memo[-k-l]
        return count
```
