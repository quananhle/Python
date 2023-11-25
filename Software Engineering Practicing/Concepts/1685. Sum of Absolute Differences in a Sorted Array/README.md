## [1685. Sum of Absolute Differences in a Sorted Array](https://leetcode.com/problems/sum-of-absolute-differences-in-a-sorted-array)

```Tag```: ```Prefix Sum```

#### Difficulty: Medium

You are given an integer array ```nums``` sorted in non-decreasing order.

Build and return an integer array result with the same length as nums such that ```result[i]``` is equal to the summation of absolute differences between ```nums[i]``` and all the other elements in the array.

In other words, ```result[i]``` is equal to ```sum(|nums[i]-nums[j]|)``` where $0 \le j \lt nums.length$ and $j \neq i$ (__0-indexed__).

---

__Example 1:__
```
Input: nums = [2,3,5]
Output: [4,3,5]
Explanation: Assuming the arrays are 0-indexed, then
result[0] = |2-2| + |2-3| + |2-5| = 0 + 1 + 3 = 4,
result[1] = |3-2| + |3-3| + |3-5| = 1 + 0 + 2 = 3,
result[2] = |5-2| + |5-3| + |5-5| = 3 + 2 + 0 = 5.
```

__Example 2:__
```
Input: nums = [1,4,6,8,10]
Output: [24,15,13,15,21]
```

__Constraints:__

- $2 \le nums.length \le 10^5$
- $1 \le nums[i] \le nums[i + 1] \le 10^4$

---

### Brute Force (Time Limit Exceeded)

```Python
class Solution:
    def getSumAbsoluteDifferences(self, nums: List[int]) -> List[int]:
        res = list()
        n = len(nums)

        for i in range(n):
            difference = 0
            for j in range(n):
                difference += abs(nums[i] - nums[j])
            res.append(difference)
        
        return res
```

### Prefix Sum

Because the input is given sorted, let's try to split the problem into two parts. For a given ```num``` at index ```i```, the answer for this index is the sum of:

1. The sum of absolute differences between ```num``` and all numbers less than ```num```.
2. The sum of absolute differences between ```num``` and all numbers greater than ```num```.

As ```nums``` is sorted, we can focus on all indices less than ```i``` for the first part and all indices greater than ```i``` for the second part.

![image](https://leetcode.com/problems/sum-of-absolute-differences-in-a-sorted-array/Figures/1685/1.png)

```Python
class Solution:
    def getSumAbsoluteDifferences(self, nums: List[int]) -> List[int]:
        res = list()
        n = len(nums)
        prefix = [nums[0]]
        for i in range(1, n):
            prefix.append(prefix[-1] + nums[i])

        res = list()
        for i in range(n):
            left_sum = prefix[i] - nums[i]
            right_sum = prefix[-1] - prefix[i]

            left_cnt, right_cnt = i, n - 1 - i

            left_total = left_cnt * nums[i] - left_sum
            right_total = right_sum - right_cnt * nums[i]

            res.append(left_total + right_total)
        
        return res
```
