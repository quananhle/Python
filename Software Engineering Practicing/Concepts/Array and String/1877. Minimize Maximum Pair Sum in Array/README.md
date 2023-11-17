## [1877. Minimize Maximum Pair Sum in Array](https://leetcode.com/problems/minimize-maximum-pair-sum-in-array)

```Tag```: ```Sorting``` ```Two Pointers```

#### Difficulty: Medium

The pair sum of a pair ```(a,b)``` is equal to ```a + b```. The __maximum pair sum__ is the __largest pair sum__ in a list of pairs.

- For example, if we have pairs ```(1,5)```, ```(2,3)```, and ```(4,4)```, the __maximum pair sum__ would be $max(1+5, 2+3, 4+4) = max(6, 5, 8) = 8$.

Given an array ```nums``` of even length ```n```, pair up the elements of ```nums``` into ```n / 2``` pairs such that:
- Each element of ```nums``` is in __exactly one__ pair, and
- The __maximum pair sum__ is minimized.

Return _the minimized __maximum pair sum__ after optimally pairing up the elements_.

---

__Example 1:__
```
Input: nums = [3,5,2,3]
Output: 7
Explanation: The elements can be paired up into pairs (3,3) and (5,2).
The maximum pair sum is max(3+3, 5+2) = max(6, 7) = 7.
```

__Example 2:__
```
Input: nums = [3,5,4,2,4,6]
Output: 8
Explanation: The elements can be paired up into pairs (3,5), (4,4), and (6,2).
The maximum pair sum is max(3+5, 4+4, 6+2) = max(8, 8, 8) = 8.
```

__Constraints:__

- $n == nums.length$
- $2 \le n \le 10^5$
- ```n``` is even.
- $1 \le nums[i] \le 105$

---

### Sorting

![image](https://leetcode.com/problems/minimize-maximum-pair-sum-in-array/Figures/1877/1877A.png)

To ensure the maximum pair sum is minimized, a potential strategy to pair up the smallest integer with the greatest integer and then second-smallest with the second-greatest and so on.

```Python
class Solution:
    def minPairSum(self, nums: List[int]) -> int:
        nums.sort()
        n = len(nums)
        ans = 0
        
        left, right = 0, n - 1
        while left < right:
            ans = max(ans, nums[left] + nums[right])
            left += 1; right -= 1
        
        return ans
```

```Python
class Solution:
    def minPairSum(self, nums: List[int]) -> int:
        nums.sort()
        n = len(nums)
        ans = 0

        for i in range(n // 2):
            ans = max(ans, nums[i] + nums[n - 1 - i])

        return ans
```
