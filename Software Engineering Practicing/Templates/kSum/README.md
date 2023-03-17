## kSum

```Tag```: ```Two Pointers``` ```Hash Map``` ```Binary Search```

### [1. Two Sum](https://leetcode.com/problems/two-sum/)

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

### [167. Two Sum II - Input Array Is Sorted](https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/)

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

### 3Sum

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

### 4Sum

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
