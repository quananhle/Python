## [268. Missing Number](https://leetcode.com/problems/missing-number)

```Tag```: ```Sorting``` ```Hash Map``` ```Hash Set``` ```Bitwise Manipulation``` ```Math```

#### Difficulty: Easy

Given an array ```nums``` containing ```n``` distinct numbers in the range ```[0, n]```, return _the only number in the range that is missing from the array_.

![image](https://github.com/quananhle/Python/assets/35042430/75a51eba-d6dc-46e3-b179-e0238e8158eb)

---

__Example 1:__
```
Input: nums = [3,0,1]
Output: 2
Explanation: n = 3 since there are 3 numbers, so all numbers are in the range [0,3]. 2 is the missing number in the range since it does not appear in nums.
```

__Example 2:__
```
Input: nums = [0,1]
Output: 2
Explanation: n = 2 since there are 2 numbers, so all numbers are in the range [0,2]. 2 is the missing number in the range since it does not appear in nums.
```

__Example 3:__
```
Input: nums = [9,6,4,2,3,5,7,0,1]
Output: 8
Explanation: n = 9 since there are 9 numbers, so all numbers are in the range [0,9]. 8 is the missing number in the range since it does not appear in nums.
```

__Constraints:__

- $n == nums.length$
- $1 \le n \le 10^4$
- $0 \le nums[i] \le n$
- All the numbers of ```nums``` are unique.

---

### Sorting

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N \cdot \log{}N)$
- __Space Complexity__: $\mathcal{O}(N)$, if input modification is forbidden, else $\mathcal{O}(1)$

```Python
class Solution:
    def missingNumber(self, nums: List[int]) -> int:
        nums.sort()
        n = len(nums)

        # Edge cases: missing last element in the last index of the array
        if nums[-1] != n:
            return n
        # Missing 0 in the first index of the array
        if nums[0] != 0:
            return 0

        # Missing in the range(0, n)
        for i in range(1, n + 1):
            if nums[i] - i != 0:
                return i
        
        return -1
```

```Python
class Solution:
    def missingNumber(self, nums: List[int]) -> int:
        nums.sort()
        n = len(nums)

        # Edge cases: missing last element in the last index of the array
        if nums[-1] != n:
            return n
        # Missing 0 in the first index of the array
        if nums[0] != 0:
            return 0

        # Missing in the range(0, n)
        for i in range(1, n + 1):
            missing_num = nums[i - 1] + 1
            if missing_num != nums[i]:
                return missing_num
        
        return -1
```

```Python
class Solution:
    def missingNumber(self, nums: List[int]) -> int:
        nums.sort()
        n = len(nums)
        for i, num in enumerate(nums):
            if i != num:
                return i
        return i + 1
```

### Hash Map

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N)$
- __Space Complexity__: $\mathcal{O}(N)$

#### Two Passes

```Python
class Solution:
    def missingNumber(self, nums: List[int]) -> int:
        all_nums = collections.defaultdict(int)
        n = len(nums)
        for num in range(n + 1):
            all_nums[num] = all_nums.get(num, 0) + 1
        for num in nums:
            all_nums[num] = all_nums.get(num, 0) - 1

        for num, val in all_nums.items():
            if val == 1:
                return num
        
        return -1
```

### Hash Set

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N)$
- __Space Complexity__: $\mathcal{O}(N)$

```Python
class Solution:
    def missingNumber(self, nums: List[int]) -> int:
        all_nums = set(nums)
        n = len(nums)
        for num in range(n + 1):
            if not num in all_nums:
                return num
        
        return -1
```

__Follow up__: Could you implement a solution using only ```O(1)``` extra space complexity and ```O(n)``` runtime complexity?

### Bit Manipulation

#### XOR

![image](https://github.com/quananhle/Python/assets/35042430/abde9a9c-ddfc-409c-bc09-48d4cc1dcaea)

```Python
class Solution:
    def missingNumber(self, nums: List[int]) -> int:
        missing = len(nums)

        for i, num in enumerate(nums):
            missing ^= i ^ num
        
        return missing
```

### Math

#### One Liner

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N)$
- __Space Complexity__: $\mathcal{O}(N)$

```Python
class Solution:
    def missingNumber(self, nums: List[int]) -> int:
        return sum([i for i in range(len(nums) + 1)]) - sum(nums)
```

#### Gauss' Formula

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N)$
- __Space Complexity__: $\mathcal{O}(1)$

```Python
class Solution:
    def missingNumber(self, nums: List[int]) -> int:
        n = len(nums)
        expected_sum = n * (n + 1) // 2
        actual_sum = sum(nums)
        return expected_sum - actual_sum
```
