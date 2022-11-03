## Missing Number

#### Difficulty: Easy

```
Given an array nums containing n distinct numbers in the range [0, n], return the only number in the range that is missing from the array.
```

__Example 1:__
```
Input: nums = [3,0,1]
Output: 2
Explanation: n = 3 since there are 3 numbers, so all numbers are in the range [0,3]. 2 is the missing number in the range since it does not appear in nums.
```

__Example 2:__
```
Input: nums = [0,1]
Output: 2
Explanation: n = 2 since there are 2 numbers, so all numbers are in the range [0,2]. 2 is the missing number in the range since it does not appear in nums.
```

__Example 3:__
```
Input: nums = [9,6,4,2,3,5,7,0,1]
Output: 8
Explanation: n = 9 since there are 9 numbers, so all numbers are in the range [0,9]. 8 is the missing number in the range since it does not appear in nums.
 ```
__Constraints:__
```
n == nums.length
1 <= n <= 104
0 <= nums[i] <= n
All the numbers of nums are unique.
```

### Sorted List
```{Python}
class Solution(object):
    def missingNumber(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        """
        3 possible cases:
        - Missing 0
        - Missing n
        - Missing the number in range (0,n)
        """        
        nums.sort()
        n = len(nums)
        """
        [0 , ... , n]
         |    |    |
         0   ith (n-1)th
        """
        # Edge cases:
        # List index out of range, [0], n=1 -> 1, [1], n=1 -> 0
        # If 0 not at the first index
        if nums[0] != 0:
            return 0
        # If n not at the last index
        if nums[n-1] != n:
            return n
        # If missing number in between
        for i in range(1, len(nums)):
            if nums[i] != i:
                return i
        # Time complexity: 0(NlogN), sorting the list. Best case O(N) if input list is already sorted.
        # Space complexity: O(1) or 0(N), size of sorted list depends on size of input              
```

### Hash
```{Python}
class Solution(object):
    def missingNumber(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        hash_set = set(nums)
        for i in range(len(nums)+1):
            if i not in hash_set:
                return i
        # Time complexity: 0(N), loop through the list
        # Space complexity: 0(N), input contains all distinc element so hash set size = input size
```
```{Python}
class Solution(object):
    def missingNumber(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        hash_table = dict()
        n = len(nums)
        for i in range(n):
            if nums[i] not in hash_table:
                hash_table[nums[i]] = i
        for i in range(n+1):
            if i not in hash_table:
                return i
        # Time complexity: 0(N), go through the list
        # Space complexity: 0(N), input contains all distinc element so hash_table size = input size
```

```
Follow up: Could you implement a solution using only O(1) extra space complexity and O(n) runtime complexity?
```

### Sum Difference

```{Python}
class Solution(object):
    def missingNumber(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        expected_sum = 0
        actual_sum = sum(nums)
        for i in range(len(nums)+1):
            expected_sum += i
        return expected_sum - actual_sum
        # Time complexity: 0(N), go through the list
        # Space complexity: 0(1), constant memory usage
```
