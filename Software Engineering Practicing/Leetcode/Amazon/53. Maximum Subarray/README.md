## 53. Maximum Subarray

#### Difficulty: Medium

Given an integer array ```nums```, find the subarray which has the ```largest sum``` and return its ```sum```.

#### Example 1:
```
Input: nums = [-2,1,-3,4,-1,2,1,-5,4]
Output: 6
Explanation: [4,-1,2,1] has the largest sum = 6.
```

#### Example 2:
```
Input: nums = [1]
Output: 1
```

#### Example 3:
```
Input: nums = [5,4,-1,7,8]
Output: 23
```

#### Constraints:
```
1 <= nums.length <= 105
-104 <= nums[i] <= 104
```

```{Python}
class Solution(object):
    def maxSubArray(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        # Brute Force
        #### Time complexity: O(N^2), nested loops
        #### Space complexity: O(1)
        """
        max_subarray = -sys.maxint-1
        for i in range(len(nums)):
            current_subarray = 0
            for j in range(i, len(nums)):
                current_subarray += nums[j]
                max_subarray = max(max_subarray, current_subarray)
        return max_subarray
        """
        # Dynamic Programming
        #### Time complexity: O(N), loop through the input list once
        #### Space complexity: O(1)
        '''
        Whenever you see a question that asks for the maximum or minimum of something, consider Dynamic Programming as a possibility.
        '''
        """
        current_subarray = max_subarray = nums[0]
        for num in nums[1:]:
            current_subarray = max(num, current_subarray + num)
            max_subarray = max(current_subarray, max_subarray)
        return max_subarray
        """
        #### Time complexity: O(N), loop through the input list once
        #### Space complexity: O(N), require extra space for another list which keep track of the possible sums
        """
        # n = [0 for _ in range(len(nums))]       
        n = [0] * len(nums)
        n[0] = nums[0]
        for i in range(1, len(nums)):
            n[i] = max(n[i-1]+nums[i], nums[i])
        return max(n)
        """
```

__Follow up:__ If you have figured out the O(n) solution, try coding another solution using the divide and conquer approach, which is more subtle.

```{Python}
class Solution(object):
    def maxSubArray(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        # Divide and Conquer
        #### Time complexity: O(NlogN), loop through the length of the num
        #### Space complexity: O(logN)
        """
        def divide_and_conquer(nums, left, right):
            # Base case
            # Empty list
            if left > right:
                return -sys.maxsize-1
            mid = (left+right) // 2
            current_subarray = left_subarray_candidate = right_subarray_candidate = 0
            # Iterate from mid to start
            for i in range(mid-1, left-1, -1):
                current_subarray += nums[i]
                left_subarray_candidate = max(current_subarray, left_subarray_candidate)
            # Iterate from mid to end
            current_subarray = 0
            for i in range(mid+1, right+1):
                current_subarray += nums[i]
                right_subarray_candidate = max(current_subarray, right_subarray_candidate)
            # Consider the combination of two candidate and the middle element
            combined_sum = nums[mid] + left_subarray_candidate + right_subarray_candidate
            # Recursively find the best subarray candidates for both halves
            left_half_sum = divide_and_conquer(nums, left, mid-1)
            right_half_sum = divide_and_conquer(nums, mid+1, right)
            return max(combined_sum, left_half_sum, right_half_sum)
        return divide_and_conquer(nums, 0, len(nums)-1)
        """
            
```
