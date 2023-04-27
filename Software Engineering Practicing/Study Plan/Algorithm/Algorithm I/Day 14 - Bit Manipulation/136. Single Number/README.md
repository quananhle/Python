## [136. Single Number](https://leetcode.com/problems/single-number)

```Tag```: ```Math``` ```Hash Table``` ```Hash Set``` ```Bit Manipulation```

#### Difficulty: Easy

Given a __non-empty__ array of integers ```nums```, every element appears twice except for one. Find that single one.

You must implement a solution with a linear runtime complexity and use only constant extra space.

![image](https://user-images.githubusercontent.com/35042430/234985986-34184ccc-3779-4dbf-8250-69e3692414c3.png)

---

__Example 1:__
```
Input: nums = [2,2,1]
Output: 1
```

__Example 2:__
```
Input: nums = [4,1,2,1,2]
Output: 4
```

__Example 3:__
```
Input: nums = [1]
Output: 1
```

__Constraints:__

- ```1 <= nums.length <= 3 * 10^4```
- ```-3 * 10^4 <= nums[i] <= 3 * 10^4```
- Each element in the array appears twice except for one element which appears only once.

---

### Brute Force

- __Time Complexity__: ```O(N^2)```
- __Space Complexity__: ```O(N)```

```Python
class Solution:
    def singleNumber(self, nums: List[int]) -> int:
        single_list = list()
        for num in nums:
            if not num in single_list:
                single_list.append(num)
            else:
                single_list.remove(num)
        return single_list.pop()
```

### Hash Table

- __Time Complexity__: ```O(N)```
- __Space Complexity__: ```O(N)```

```Python
class Solution:
    def singleNumber(self, nums: List[int]) -> int:
        # Hash Table
        #### Time complexity : O(n)
        #### Space complexity: O(n)        
        freq = collections.defaultdict(int)
        for num in nums:
            if num in freq:
                freq[num] += 1
            else:
                freq[num] = 1
        for num, frequency in freq.items():
            if frequency == 1:
                return num
```

### Math

```Python
class Solution:
    def singleNumber(self, nums: List[int]) -> int:
        # Math
        #### Time complexity : O(n)
        #### Space complexity: O(n)
        ```
        2 * (a + b + c) - (a + a + b + b + c) = c
        ```
        return 2 * sum(set(nums)) - sum(nums)
```

### Bit Manipulation
```
a ⊕ 0 = a
a ⊕ a = 0
a ⊕ b ⊕ a = (a ⊕ a) ⊕ b = 0 ⊕ b = b
```

```Python
class Solution:
    def singleNumber(self, nums: List[int]) -> int:
        # Bit Manipulation
        #### Time complexity : O(n)
        #### Space complexity: O(1)
        xor = 0
        for num in nums:
            # a ⊕ 0 = a
            # a ⊕ a = 0
            # a ⊕ b ⊕ a = (a ⊕ a) ⊕ b = 0 ⊕ b = b
            xor ^= num
        return xor
```
