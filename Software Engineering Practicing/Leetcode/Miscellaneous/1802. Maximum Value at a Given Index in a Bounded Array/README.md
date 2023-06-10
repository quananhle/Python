## [1802. Maximum Value at a Given Index in a Bounded Array](https://leetcode.com/problems/maximum-value-at-a-given-index-in-a-bounded-array/)

```Tag```: ```Greedy``` ```Binary Search```

#### Difficulty: Medium

You are given three positive integers: ```n```, ```index```, and ```maxSum```. You want to construct an array ```nums``` (0-indexed) that satisfies the following conditions:

- ```nums.length == n```
- ```nums[i]``` is a positive integer where ```0 <= i < n```.
- ```abs(nums[i] - nums[i+1]) <= 1``` where ```0 <= i < n-1```.
- The sum of all the elements of ```nums``` does not exceed ```maxSum```.
- ```nums[index]``` is maximized.

Return _```nums[index]``` of the constructed array_.

Note that ```abs(x)``` equals ```x``` if ```x >= 0```, and ```-x``` otherwise.

---

__Example 1:__
```
Input: n = 4, index = 2,  maxSum = 6
Output: 2
Explanation: nums = [1,2,2,1] is one array that satisfies all the conditions.
There are no arrays that satisfy all the conditions and have nums[2] == 3, so 2 is the maximum nums[2].
```

__Example 2:__
```
Input: n = 6, index = 1,  maxSum = 10
Output: 3
```

__Constraints:__

- ```1 <= n <= maxSum <= 10^9```
- ```0 <= index < n```

---

![image](https://leetcode.com/problems/maximum-value-at-a-given-index-in-a-bounded-array/Figures/1802/intro.png)

### Greedy & Binary Search

![image](https://github.com/quananhle/Python/assets/35042430/61ee5de6-6ef2-4eb2-95e8-86993d631870)

```Python
class Solution:
    def maxValue(self, n: int, index: int, maxSum: int) -> int:
        lo, hi = 1, maxSum

        def get_sum(value):
            count = 0

            if value > index:
                count += (value + value - index) * (index + 1) // 2
            else:
                count += (value + 1) * value // 2 + index - value + 1
            
            if value >= n - index:
                count += (value + value - n + 1 + index) * (n - index) // 2
            else:
                count += (value + 1) * value // 2 + n - index - value
            
            return count - value

        while lo < hi:
            mi = (lo + hi + 1) // 2
            if get_sum(mi) <= maxSum:
                lo = mi
            else:
                hi = mi - 1

        return lo
```
