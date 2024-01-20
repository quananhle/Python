## [15. 3Sum](https://leetcode.com/problems/3sum/)

```Tag```: ```Two Pointers```

#### Difficulty: Medium

Given an integer array ```nums```, return _all the triplets ```[nums[i], nums[j], nums[k]]``` such that ```i != j```, ```i != k```, and ```j != k```, and ```nums[i] + nums[j] + nums[k] == 0```_.

Notice that the solution set must not contain duplicate triplets.

![image](https://github.com/quananhle/Python/assets/35042430/7924a823-cb46-4dbf-8adb-70434399872a)

---

__Example 1:__
```
Input: nums = [-1,0,1,2,-1,-4]
Output: [[-1,-1,2],[-1,0,1]]
Explanation: 
nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0.
nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0.
nums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0.
The distinct triplets are [-1,0,1] and [-1,-1,2].
Notice that the order of the output and the order of the triplets does not matter.
```

__Example 2:__
```
Input: nums = [0,1,1]
Output: []
Explanation: The only possible triplet does not sum up to 0.
```

__Example 3:__
```
Input: nums = [0,0,0]
Output: [[0,0,0]]
Explanation: The only possible triplet sums up to 0.
```

__Constraints:__

- ```3 <= nums.length <= 3000```
- -10<sup>5</sup> <= ```nums[i]``` <= 10<sup>5</sup>

---

### Sorting

1. For the ```threeSum``` function:

- Sort the input array ```nums```.
- Iterate through the array:
  - If the current value is greater than zero, break from the loop. Remaining values cannot sum to zero.
  - If the current value is the same as the one before, skip it.
  - Otherwise, call ```twoSumII``` for the current position ```i```.

2. For ```twoSumII``` function:

- Set the low pointer ```lo``` to ```i + 1```, and high pointer ```hi``` to the last index.
- While low pointer is smaller than high:
  - If ```sum``` of ```nums[i] + nums[lo] + nums[hi]``` is less than zero, increment ```lo```.
  - If ```sum``` is greater than zero, decrement ```hi```.
  - Otherwise, we found a triplet:
    - Add it to the result ```res```.
    - Decrement ```hi``` and increment ```lo```.
    - Increment ```lo``` while the next value is the same as before to avoid duplicates in the result.
    - Decrement ```hi``` while the prev value is the same as before to avoid duplicates in the result.

3. Return the result ```res```.

```Python
class Solution:
    def threeSum(self, nums: List[int]) -> List[List[int]]:
        res = set()
        nums.sort()
        n = len(nums)

        def twoSumII(nums, i, res):
            lo, hi = i + 1, len(nums) - 1
            while (lo < hi):
                total = nums[i] + nums[lo] + nums[hi]
                if total < 0:
                    lo += 1
                elif total > 0:
                    hi -= 1
                else:
                    res.add((nums[i], nums[lo], nums[hi]))
                    lo += 1
                    hi -= 1
                    while lo < hi and nums[lo] == nums[lo - 1]:
                        lo += 1
                    while hi > lo and nums[hi] == nums[hi + 1]:
                        hi -= 1

        for i in range(n):
            if i == 0 or nums[i - 1] != nums[i]:
                twoSumII(nums, i, res)

        return res
```

### Two Pointers

```Python
class Solution:
    def threeSum(self, nums: List[int]) -> List[List[int]]:
        seen = set()
        n = len(nums)
        res = set()
        for i in range(n):
            for j in range(i+1, n):
                complement = -(nums[i] + nums[j])
                if complement in seen:
                    tmp = sorted([complement, nums[i], nums[j]])
                    res.add((tmp[0], tmp[1], tmp[2]))
            seen.add(nums[i])
        return res
```

```Python
class Solution:
    def threeSum(self, nums: List[int]) -> List[List[int]]:
        seen = set()
        n = len(nums)
        res = set()
        for i, num1 in enumerate(nums):
            for num2 in nums[i+1:]:
                complement = -(num1 + num2)
                if complement in seen:
                    tmp = sorted([complement, num1, num2])
                    res.add((tmp[0], tmp[1], tmp[2]))
            seen.add(num1)
        return res
```

### Two Hash Sets

The algorithm is similar to the hashset approach above. We just need to add few optimizations so that it works efficiently for repeated values:

1. Use another hashset ```dups``` to skip duplicates in the outer loop.
  - Without this optimization, the submission will time out for the test case with 3,000 zeroes. This case is handled naturally when the array is sorted.

2. Instead of re-populating a hashset every time in the inner loop, we can use a hashmap and populate it once. Values in the hashmap will indicate whether we have encountered that element in the current iteration. When we process ```nums[j]``` in the inner loop, we set its hashmap value to ```i```. This indicates that we can now use ```nums[j]``` as a complement for ```nums[i]```.
This is more like a trick to compensate for container overheads. The effect varies by language, e.g. for C++ it cuts the runtime in half. Without this trick the submission may time out.

```Python
class Solution:
    def threeSum(self, nums: List[int]) -> List[List[int]]:
        seen, dups = dict(), set()
        res = set()
        for i, num1 in enumerate(nums):
            if not num1 in dups:
                dups.add(num1)
                # Treat this like 2 Sum subproblem and num1 like target
                for num2 in nums[i+1:]:
                    complement = -(num1 + num2)
                    if complement in seen and seen[complement] == i:
                        res.add(tuple(sorted((num1, num2, complement))))
                    seen[num2] = i
        return res
```
