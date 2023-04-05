## [2439. Minimize Maximum of Array](https://leetcode.com/problems/minimize-maximum-of-array/)

```Tag```: ```Prefix Sum``` ```Greedy``` ```Dynamic Programming``` ```Binary Search```

#### Difficulty: Medium

You are given a __0-indexed__ array ```nums``` comprising of ```n``` non-negative integers.

In one operation, you must:

- Choose an integer ```i``` such that ```1 <= i < n``` and ```nums[i] > 0```.
- Decrease ```nums[i]``` by ```1```.
- Increase ```nums[i - 1]``` by ```1```.

Return _the minimum possible value of the maximum integer of ```nums``` after performing any number of operations_.

---

__Example 1:__
```
Input: nums = [3,7,1,6]
Output: 5
Explanation:
One set of optimal operations is as follows:
1. Choose i = 1, and nums becomes [4,6,1,6].
2. Choose i = 3, and nums becomes [4,6,2,5].
3. Choose i = 1, and nums becomes [5,5,2,5].
The maximum integer of nums is 5. It can be shown that the maximum number cannot be less than 5.
Therefore, we return 5.
```

__Example 2:__
```
Input: nums = [10,1]
Output: 10
Explanation:
It is optimal to leave nums as is, and since 10 is the maximum value, we return 10.
```

__Constraints:__ 

- ```n == nums.length```
- 2 <= ```n``` <= 10<sup>5</sup>
- 0 <= ```nums[i]``` <= 10<sup>9</sup>

---

![image](https://leetcode.com/problems/minimize-maximum-of-array/Figures/2439/1.png)

### Prefix Sum + Greedy

![image](https://leetcode.com/problems/minimize-maximum-of-array/Figures/2439/rain.png)

__Algorithm__

1. Initialize ```answer = 0``` and ```prefix = 0```.
2. Iterate over ```nums```, for each index ```i```:
    - Update the prefix sum as ```prefix += nums[i]```.
    - Check the maximum value we can obtain by averaging ```prefix``` into ```i + 1``` evenly using ceiling division.
    - Take the larger one from ```answer``` and the result from the previous integer division.
3. Return ```answer```.

```Python
class Solution:
    def minimizeArrayValue(self, nums: List[int]) -> int:
        answer = prefix = 0
        n = len(nums)

        for i in range(n):
            prefix += nums[i]
            answer = max(answer, math.ceil(prefix / (i + 1)))
        
        return answer
```

### Binary Search

```Python
class Solution:
    def minimizeArrayValue(self, nums: List[int]) -> int:
        def check(k):
            have = 0
            for num in nums:
                if num <= k:
                    have += k - num
                else:
                    if have < num - k:
                        return False
                    else:
                        have -= num - k
            return True

        lo, hi = 0, max(nums)
        while lo < hi:
            mi = lo + (hi - lo) // 2

            if check(mi):
                hi = mi
            else:
                lo = mi + 1
        
        return lo
```
