## [2009. Minimum Number of Operations to Make Array Continuous](https://leetcode.com/problems/minimum-number-of-operations-to-make-array-continuous)

```Tag```: ```Binary Search```

#### Difficulty: Hard

You are given an integer array ```nums```. In one operation, you can replace any element in ```nums``` with any integer.

```nums``` is considered continuous if both of the following conditions are fulfilled:

- All elements in ```nums``` are unique.
- The difference between the maximum element and the minimum element in ```nums``` equals ```nums.length - 1```.

For example, ```nums = [4, 2, 5, 3]``` is continuous, but ```nums = [1, 2, 3, 5, 6]``` is not continuous.

Return _the minimum number of operations to make ```nums``` continuous_.

![image](https://github.com/quananhle/Python/assets/35042430/5d0232bf-0ac3-4fed-a014-0c237db0e16d)

---

__Example 1:__
```
Input: nums = [4,2,5,3]
Output: 0
Explanation: nums is already continuous.
```

__Example 2:__
```
Input: nums = [1,2,3,5,6]
Output: 1
Explanation: One possible solution is to change the last element to 4.
The resulting array is [1,2,3,5,4], which is continuous.
```

__Example 3:__
```
Input: nums = [1,10,100,1000]
Output: 3
Explanation: One possible solution is to:
- Change the second element to 2.
- Change the third element to 3.
- Change the fourth element to 4.
The resulting array is [1,2,3,4], which is continuous.
```

__Constraints:__

- $1 \le nums.length \le 10^5$
- $1 \le nums[i] \le 10^9$

---

### Binary Search

#### Template 2

Let's summarize the algorithm with an example.

![image](https://leetcode.com/problems/minimum-number-of-operations-to-make-array-continuous/Figures/2009/1.png)
First, we remove duplicates from the array, then sort it. Note the original length before removing duplicates as ```n = 8```.

![image](https://leetcode.com/problems/minimum-number-of-operations-to-make-array-continuous/Figures/2009/2.png)
Now, we iterate over the array. For each index ```i```, we treat ```left = new_nums[i]```.

![image](https://leetcode.com/problems/minimum-number-of-operations-to-make-array-continuous/Figures/2009/3.png)
If we were to create a continuous array with ```left = 2``` as the minimum, we would need a maximum of ```right = left + n - 1 = 9```.

![image](https://leetcode.com/problems/minimum-number-of-operations-to-make-array-continuous/Figures/2009/4.png)
How many operations do we need? We start by finding how many elements in the array are already in the desired range ```[left, right]```. Binary search to find the insertion index of ```right```. Note that the binary search here is finding the index after the greatest element less than or equal to ```right```.

```Python
class Solution:
    def minOperations(self, nums: List[int]) -> int:
        n = len(nums)
        # Total number of operations will not exceed to total number of elements in nums
        ans = n
        unique_nums = sorted(set(nums))

        def binary_search(new_nums, target):
            lo, hi = 0, len(unique_nums)
            
            while lo < hi:
                mi = lo + (hi - lo) // 2
                if new_nums[mi] <= target:
                    lo = mi + 1
                else:
                    hi = mi
            
            return lo

        for i in range(len(unique_nums)):
            # Find the left and right boundaries
            left = unique_nums[i]
            right = left + n - 1
            j = binary_search(unique_nums, right)
            operations = j - i
            ans = min(ans, n - operations)
        
        return ans
```
