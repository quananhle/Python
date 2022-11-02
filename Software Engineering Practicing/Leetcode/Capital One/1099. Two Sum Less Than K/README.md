







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
```{Python}
class Solution(object):
    def twoSumLessThanK(self, nums, k):
        """
        :type nums: List[int]
        :type k: int
        :rtype: int
        """
        answer = -1
        for i in range(len(nums)):
            for j in range(i+1, len(nums)):
                max_sum = nums[i] + nums[j]
                if max_sum < k:
                    answer = max(answer, max_sum)
        return answer
        # Time complexity: O(N^2), nested loop
        # Space complexity: O(1)
```

### Two Pass

```{Python}
class Solution(object):
    def twoSumLessThanK(self, nums, k):
        """
        :type nums: List[int]
        :type k: int
        :rtype: int
        """
        nums.sort()
        max_sum = answer = -1
        left, right = 0, len(nums)-1
        while left < right:
            if k - nums[left] <= nums[right]:
                right -= 1
            else:
                if max_sum < nums[left] + nums[right]:
                    max_sum = nums[left] + nums[right]
                left += 1
        if max_sum != answer:
            return max_sum
        else:
            return answer
        # Time complexity: O(NlogN), sort the array
        # Space complexity: O(logN) or O(N), sorted list depends on the size of input list
```

```{Python}
class Solution(object):
    def twoSumLessThanK(self, nums, k):
        """
        :type nums: List[int]
        :type k: int
        :rtype: int
        """
        nums.sort()
        answer = -1
        left, right = 0, len(nums) -1
        while left < right:
            max_sum = nums[left] + nums[right]
            if (max_sum < k):
                answer = max(answer, max_sum)
                left += 1
            else:
                right -= 1
        return answer
        # Time complexity: O(NlogN), sort the array
        # Space complexity: O(logN) or O(N), sorted list depends on the size of input list
```
