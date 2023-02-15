## 1480. Running Sum of 1d Array

#### Difficulty: Easy

Given an array ```nums```. We define a running sum of an array as ```runningSum[i]``` = ```sum(nums[0]…nums[i])```.

Return the running ```sum``` of ```nums```.

![image](https://user-images.githubusercontent.com/35042430/204926899-d73cc51e-128c-40e0-b426-8d0d3c143f8a.png)

__Example 1:__
```
Input: nums = [1,2,3,4]
Output: [1,3,6,10]
Explanation: Running sum is obtained as follows: [1, 1+2, 1+2+3, 1+2+3+4].
```

__Example 2:__
```
Input: nums = [1,1,1,1,1]
Output: [1,2,3,4,5]
Explanation: Running sum is obtained as follows: [1, 1+1, 1+1+1, 1+1+1+1, 1+1+1+1+1].
```

__Example 3:__
```
Input: nums = [3,1,2,10,1]
Output: [3,4,6,16,17]
```

__Constraints:__
```
1 <= nums.length <= 1000
-10^6 <= nums[i] <= 10^6
```

---

### One-liner with List Comprehension
- Time Complexity: O(N)
- Space Complexity: O(N)
```Python
class Solution(object):
    def runningSum(self, nums):
        """
        :type nums: List[int]
        :rtype: List[int]
        """
        return [sum(nums[:i]) for i in range(len(nums)+1)][1:]
```
### In-Place Modification
- Time Complexity: O(N)
- Space Complexity: O(1)
```Python
class Solution(object):
    def runningSum(self, nums):
        """
        :type nums: List[int]
        :rtype: List[int]
        """
        for i in range(1, len(nums)):
            nums[i] += nums[i - 1]
        return nums
```
### Brute-Force
- Time Complexity: O(N)
- Space Complexity: O(N)
```Python
class Solution(object):
    def runningSum(self, nums):
        """
        :type nums: List[int]
        :rtype: List[int]
        """
        ans = []
        i = 1
        while i <= len(nums):
            ans.append(sum(nums[:i]))
            i += 1
        return ans
```
### Dynamic Programming + Sliding Windows
- Time Complexity: O(N)
- Space Complexity: O(N)
```Python
class Solution(object):
    def runningSum(self, nums):
        """
        :type nums: List[int]
        :rtype: List[int]
        """
        stack = [nums[0]] * (len(nums)+1)
        for i in range(len(nums), 0, -1):
            stack[i] += sum(nums[1:i])
        stack.pop(0)
        return stack
```
### Top-down Dynamic Programming
- Time Complexity: O(N)
- Space Complexity: O(N)
```Python
class Solution(object):
    def runningSum(self, nums):
        """
        :type nums: List[int]
        :rtype: List[int]
        """
        stack = []
        def dp(lst):
            if lst:
                stack.append(sum(lst))
                lst.pop()
                dp(lst)
        dp(nums)
        return stack[::-1]
```
