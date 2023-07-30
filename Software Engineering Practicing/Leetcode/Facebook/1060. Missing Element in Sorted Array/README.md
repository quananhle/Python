## [1060. Missing Element in Sorted Array](https://leetcode.com/problems/missing-element-in-sorted-array/)

```Tag```: ```Binary Search``` ```Math```

#### Difficulty: Medium

Given an integer array nums which is sorted in ascending order and all of its elements are unique and given also an integer k, return the kth missing number starting from the leftmost number of the array.

![image](https://github.com/quananhle/Python/assets/35042430/43e2a7dc-3321-4c3b-b028-e1ae32b4b13f)

---

__Example 1:__
```
Input: nums = [4,7,9,10], k = 1
Output: 5
Explanation: The first missing number is 5.
```

__Example 2:__
```
Input: nums = [4,7,9,10], k = 3
Output: 8
Explanation: The missing numbers are [5,6,8,...], hence the third missing number is 8.
```

__Example 3:__
```
Input: nums = [1,2,4], k = 3
Output: 6
Explanation: The missing numbers are [3,5,6,7,...], hence the third missing number is 6.
```

__Constraints:__

- $1 \le nums.length \le 5 * 10^{4}$
- $1 \le nums[i] \le 10^{7}$
- ```nums``` is sorted in ascending order, and all the elements are unique.
- $1 <= k <= 10^{8}$
 
__Follow up__: Can you find a logarithmic time complexity (i.e., ```O(log(n))```) solution?

---

![image](https://leetcode.com/problems/missing-element-in-sorted-array/Figures/1060/intro.png)

### Brute Force

![[image](https://leetcode.com/problems/missing-element-in-sorted-array/Figures/1060/1.png)

```Python
class Solution:
    def missingElement(self, nums: List[int], k: int) -> int:
        n = len(nums)

        for i in range(1, n):
            missing = nums[i] - nums[i - 1] - 1
            if missing >= k:
                return nums[i - 1] + k
            k -= missing
        
        return nums[n - 1] + k
```

### Binary Search

![image](https://leetcode.com/problems/missing-element-in-sorted-array/Figures/1060/b2.png)

```Python
class Solution:
    def missingElement(self, nums: List[int], k: int) -> int:
        n = len(nums)
        lo, hi = 0, n - 1

        while lo < hi:
            mi = hi - (hi - lo) // 2

            if nums[mi] - nums[0] - mi < k:
                lo = mi
            else:
                hi = mi - 1
            
        return nums[0] + k + lo
```

```Python
class Solution:
    def missingElement(self, nums: List[int], k: int) -> int:
        n = len(nums)
        lo, hi = 0, n
        start = nums[0]

        while lo < hi:
            mi = lo + (hi - lo) // 2

            if nums[mi] - start - mi < k:
                lo = mi + 1
            else:
                hi = mi
            
        return start + k + lo - 1
```

