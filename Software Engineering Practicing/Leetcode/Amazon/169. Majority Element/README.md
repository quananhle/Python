## [169. Majority Element](https://leetcode.com/problems/majority-element)

```Tag```: ```Array & String``` ```Sort``` ```Hash Map``` ```Hash Set``` ```Bitwise Manipulations``` ```Boyce-Moore Algorithms``` ```Divide & Conquer```

#### Difficulty: Easy

Given an array ```nums``` of size ```n```, return _the majority element_.

The majority element is the element that appears more than $⌊n / 2⌋$ times. You may assume that the majority element always exists in the array.

![image](https://github.com/quananhle/Python/assets/35042430/7ef0e83b-382a-42bf-9fa2-abea216a5684)

---

__Example 1:__
```
Input: nums = [3,2,3]
Output: 3
```

__Example 2:__
```
Input: nums = [2,2,1,1,1,2,2]
Output: 2
```

__Constraints:__

- $n == nums.length$
- $1 \le n \le 5 * 10^4$
- $-10^9 \le nums[i] \le 10^9$


__Follow-up__: Could you solve the problem in linear time and in ```O(1)``` space?

---

### Brute Force

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N^2)$
- __Space Complexity__: $\mathcal{O}(1)$

```Python
class Solution:
    def majorityElement(self, nums: List[int]) -> int:
        # Time Limit Exceeded
        n = len(nums)
        for i in range(n):
            curr = 0
            for j in range(n):
                if nums[i] == nums[j]:
                    curr += 1
                if curr > n // 2:
                    return nums[i]
```

```Python
class Solution:
    def majorityElement(self, nums: List[int]) -> int:
        # Time Limit Exceeded
        majority = len(nums) // 2
        for num in nums:
            count = sum(1 for elem in nums if elem == num)
            if count > majority:
                return num
```

#### Optimized Brute Force + Hash Set

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N^2)$
- __Space Complexity__: $\mathcal{O}(N)$

```Python
class Solution:
    def majorityElement(self, nums: List[int]) -> int:
        n = len(nums)
        seen = set()
        for i in range(n):
            if nums[i] in seen:
                continue
            seen.add(nums[i])
            curr = 0
            for j in range(n):
                if nums[i] == nums[j]:
                    curr += 1
                if curr > n // 2:
                    return nums[i]
```

```Python
class Solution:
    def majorityElement(self, nums: List[int]) -> int:
        seen = set()
        majority = len(nums) // 2
        for num in nums:
            if num in seen:
                continue
            seen.add(num)
            count = sum(1 for elem in nums if elem == num)
            if count > majority:
                return num
```

### Hash Map

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N)$
- __Space Complexity__: $\mathcal{O}(N)$

```Python
class Solution:
    def majorityElement(self, nums: List[int]) -> int:
        counts = collections.Counter(nums)
        return max(counts.keys(), key=counts.get)
```

### Sorting

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N\log{N})$
- __Space Complexity__: $\mathcal{O}(N)$ or $\mathcal{O}(1)$

```Python
class Solution:
    def majorityElement(self, nums: List[int]) -> int:
        nums.sort()
        return nums[len(nums) // 2]
```

### Bitwise Manipulation

```Python
class Solution:
    def majorityElement(self, nums: List[int]) -> int:
        n = len(nums)
        candidate = 0
        bit_mask = 1

        for _ in range(31):
            bit_count = sum(bool(num & bit_mask) for num in nums)
            if bit_count > n // 2:
                candidate += bit_mask
            # Shift bit to the left one space. i.e. '00100' << 1 = '01000'
            bit_mask <<= 1

        # In python 1 << 31 will automatically be considered as positive value -> count negative numbers to determine if the majority element is negative
        is_negative = sum(num < 0 for num in nums) > (n // 2)
        if is_negative:
            candidate -= bit_mask
            
        return candidate
```
