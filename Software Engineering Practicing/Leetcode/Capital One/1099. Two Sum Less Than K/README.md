## [Two Sum Less Than K](https://leetcode.com/problems/two-sum-less-than-k/)

```Tag```: ```Sorting``` ```Two Pointers```

#### Difficulty: Easy

Given an array ```nums``` of integers and integer ```k```, return _the maximum sum such that there exists ```i < j``` with ```nums[i] + nums[j] = sum``` and ```sum < k```_. If no ```i, j``` exist satisfying this equation, return ```-1```.

![image](https://github.com/quananhle/Python/assets/35042430/1cc00df2-08a5-401e-8680-246f0985416a)

---

__Example 1:__
```
Input: nums = [34,23,1,24,75,33,54,8], k = 60
Output: 58
Explanation: We can use 34 and 24 to sum 58 which is less than 60.
```

__Example 2:__
```
Input: nums = [10,20,30], k = 15
Output: -1
Explanation: In this case it is not possible to get a pair sum less that 15.
```

__Constraints:__

- $1 \le nums.length \le 100$
- $1 \le nums[i] \le 1000$
- $1 \le k \le 2000$

---

### Brute Force

#### Algorithm

1. For each index ```i``` in ```nums```:

    - For each index ```j > i``` in ```nums```:
        - If ```nums[i] + nums[j]``` is less than ```k```:
            - Track maximum ```nums[i] + nums[j]``` in the result answer.
2. Return the result ```answer```.

```Python
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
```Python
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

```Python
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

```Python
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
