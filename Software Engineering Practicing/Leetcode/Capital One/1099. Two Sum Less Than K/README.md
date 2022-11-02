







### Brute Force

```{Python}
class Solution(object):
    def twoSumLessThanK(self, nums, k):
        """
        :type nums: List[int]
        :type k: int
        :rtype: int
        """
        max_sum = pivot = -sys.maxint-1
        for i in range(len(nums)):
            for j in range(i+1, len(nums)):
                if k - nums[j] > nums[i] and max_sum < nums[i] + nums[j]:
                    max_sum = nums[i] + nums[j]
        if max_sum != pivot:
            return max_sum
        else:
            return -1
        # Time complexity: O(N^2), nested loop
        # Space complexity: O(1)
```
