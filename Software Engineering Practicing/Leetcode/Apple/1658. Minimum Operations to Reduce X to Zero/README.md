## [1658. Minimum Operations to Reduce X to Zero](https://leetcode.com/problems/minimum-operations-to-reduce-x-to-zero)

```Tag```: ```Two Pointers```

#### Difficulty: Medium

You are given an integer array ```nums``` and an integer ```x```. In one operation, you can either remove the ```leftmost``` or the ```rightmost``` element from the array ```nums``` and subtract its value from ```x```. Note that this modifies the array for future operations.

Return _the minimum number of operations to reduce ```x``` to exactly ```0``` if it is possible_, otherwise, return ```-1```.

![image](https://github.com/quananhle/Python/assets/35042430/207d84f7-511a-4ef0-9a4a-7f227805333a)

---

__Example 1:__
```
Input: nums = [1,1,4,2,3], x = 5
Output: 2
Explanation: The optimal solution is to remove the last two elements to reduce x to zero.
```

__Example 2:__
```
Input: nums = [5,6,7,8,9], x = 4
Output: -1
```

__Example 3:__
```
Input: nums = [3,2,20,1,1,3], x = 10
Output: 5
Explanation: The optimal solution is to remove the last three elements and the first two elements (5 operations in total) to reduce x to zero.
```

__Constraints:__

- $1 \le nums.length \le 10^{5}$
- $1 \le nums[i] \le 10^{4}$
- $1 \le x \le 10^{9}$

---

### Two Pointers

An insight is that:

> To find the shortest required operations that sum up to ```x``` is to find the longest subarray that sums up to ```total - x```.

![image](https://leetcode.com/problems/minimum-operations-to-reduce-x-to-zero/Documents/5602/5602_1_1.drawio.svg)

![image](https://leetcode.com/problems/minimum-operations-to-reduce-x-to-zero/Documents/5602/5602_1_2.drawio.svg)

```Python
class Solution:
    def minOperations(self, nums: List[int], x: int) -> int:
        total = sum(nums)
        n = len(nums)
        longest_subarray = -math.inf
        left = 0
        curr = 0

        for right in range(n):
            curr += nums[right]
            while curr > total - x and left <= right:
                curr -= nums[left]
                left += 1
            if curr == total - x:
                longest_subarray = max(longest_subarray, right - left + 1)
            
        return n - longest_subarray if longest_subarray != -math.inf else -1
```
