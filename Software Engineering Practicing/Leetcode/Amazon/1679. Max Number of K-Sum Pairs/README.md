## [1679. Max Number of K-Sum Pairs](https://leetcode.com/problems/max-number-of-k-sum-pairs)

```Tag```: ```Hash Map``` ```Two Pointers``` ```Sorting```

#### Difficulty: Medium

---

---

### Brute Force

```Python

```

### Hash Map

```Python

```

```Python

```

### Two Pointers + Sorting

```Python
class Solution:
    def maxOperations(self, nums: List[int], k: int) -> int:
        nums.sort()
        count = 0
        n = len(nums)
        i, j = 0, n - 1

        while i < j:
            if nums[i] + nums[j] < k:
                i += 1
            elif nums[i] + nums[j] > k:
                j -= 1
            else:
                count += 1
                i += 1
                j -= 1
            
        return count
```
