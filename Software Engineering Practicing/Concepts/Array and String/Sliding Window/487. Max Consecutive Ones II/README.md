## [487. Max Consecutive Ones II](https://leetcode.com/problems/max-consecutive-ones-ii)

```Tag```: ```Sliding Window```

#### Difficulty: Medium

Given a binary array ```nums```, return _the maximum number of consecutive ```1```'s in the array if you can flip at most one ```0```_.

![image](https://user-images.githubusercontent.com/35042430/212833830-88349a94-08ff-4a4d-a1d8-7f6e1541ded5.png)

---

__Example 1:__
```
Input: nums = [1,0,1,1,0]
Output: 4
Explanation: 
- If we flip the first zero, nums becomes [1,1,1,1,0] and we have 4 consecutive ones.
- If we flip the second zero, nums becomes [1,0,1,1,1] and we have 3 consecutive ones.
The max number of consecutive ones is 4.
```

__Example 2:__
```
Input: nums = [1,0,1,1,0,1]
Output: 4
Explanation: 
- If we flip the first zero, nums becomes [1,1,1,1,0,1] and we have 4 consecutive ones.
- If we flip the second zero, nums becomes [1,0,1,1,1,1] and we have 4 consecutive ones.
The max number of consecutive ones is 4.
```

__Constraints:__

- $1 \le nums.length \le 10^5$
- ```nums[i]``` is either ```0``` or ```1```.


---

### Brute Force

```Python
class Solution:
    def findMaxConsecutiveOnes(self, nums: List[int]) -> int:
        # Brute Force
        #### Time Complexity : O(N^2), nested loops
        #### Space Complexity: O(1), constant memory space for pointers
        ans = 0
        for left in range(len(nums)):
            num_zeroes = 0        
            # Check every possible consecutive sequence
            for right in range(left, len(nums)):
                # Flip at most one 0; hence, if encounter second 0, break from the inner loop
                if num_zeroes == 2:
                    break
                # Count number of 0's
                if nums[right] == 0:
                    num_zeroes += 1
                # Check if sequence has one or fewer 0's, count the longest consecutive subsequence of 0's
                if num_zeroes <= 1:
                    ans = max(ans, right - left + 1)
        return ans
```

__Follow up__: What if the input numbers come in one by one as an infinite stream? In other words, you can't store all numbers coming from the stream as it's too large to hold in memory. Could you solve it efficiently?

### Sliding Window

```Python
class Solution:
    def findMaxConsecutiveOnes(self, nums: List[int]) -> int:
        # Sliding Window with Two Pointers
        #### Time Complexity : O(N), since both the pointers only move forward, each of the left and right pointer traverse a maximum of n steps.
        #### Space Complexity: O(1), constant memory space for pointers
        ans = 0
        left, right = 0, 0
        num_zeroes = 0

        while right < len(nums):
            # Keep track of the zero
            if nums[right] == 0:
                num_zeroes += 1
            # Once the second zero reached
            while num_zeroes == 2:
                if nums[left] == 0:
                    # Update consequence of zeroes
                    num_zeroes -= 1
                # Shrink the left boundary
                left += 1
            # Update longest consequence
            ans = max(ans, right - left + 1)
            right += 1

        return ans
```

```Python
class Solution:
    def findMaxConsecutiveOnes(self, nums: List[int]) -> int:
        left, right, ans = -1, 0, 0

        for num in nums:
            if num == 0:
                left, right = right, 0
            else:
                right += 1
            ans = max(ans, left + 1 + right)
        
        return ans
```



