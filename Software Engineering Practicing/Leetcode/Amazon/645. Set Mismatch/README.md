## [645. Set Mismatch](https://leetcode.com/problems/set-mismatch)

```Tag```: ```Hash Set``` ```Hash Map```

#### Difficulty: Easy

You have a set of integers ```s```, which originally contains all the numbers from ```1``` to ```n```. Unfortunately, due to some error, one of the numbers in ```s``` got duplicated to another number in the set, which results in repetition of one number and loss of another number.

You are given an integer array ```nums``` representing the data status of this set after the error.

Find the number that occurs twice and the number that is missing and return _them in the form of an array_.

![image](https://github.com/quananhle/Python/assets/35042430/0371b4a8-36b0-4ff2-8693-366d099f9da3)

---

__Example 1:__
```
Input: nums = [1,2,2,4]
Output: [2,3]
```

__Example 2:__
```
Input: nums = [1,1]
Output: [1,2]
```

__Constraints:__

- $2 \le nums.length \le 10^4$
- $1 \le nums[i] \le 10^4$

---

### Brute Force

```Python
class Solution:
    def findErrorNums(self, nums: List[int]) -> List[int]:
        duplicate = missing = -1
        n = len(nums)
        for i in range(1, n + 1):
            count = 0
            for num in nums:
                if i == num:
                    count += 1
            if count == 2:
                duplicate = i
            if count == 0:
                missing = i
        
        return [duplicate, missing]
```

#### Optimized Brute Force

```Python
class Solution:
    def findErrorNums(self, nums: List[int]) -> List[int]:
        duplicate = missing = -1
        n = len(nums)
        for i in range(1, n + 1):
            count = 0
            for num in nums:
                if i == num:
                    count += 1
                    if count == 2:
                        break
            if count == 2:
                duplicate = i
            if count == 0:
                missing = i
            if duplicate > 0 and missing > 0:
                break
        
        return [duplicate, missing]
```
