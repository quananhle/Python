## [136. Single Number](https://leetcode.com/problems/single-number)

```Tag```: ```Math``` ```Hash Table``` ```Hash Set``` ```Bit Manipulation```

#### Difficulty: Easy

Given an integer array ```nums``` and an integer ```k```, return _```true``` if there are two distinct indices ```i``` and ```j``` in the array such that ```nums[i] == nums[j]``` and ```abs(i - j) <= k```_.

![image](https://user-images.githubusercontent.com/35042430/211179629-d2905e99-089a-4e26-93c2-408fb447b325.png)

---

__Example 1:__
```
Input: nums = [1,2,3,1], k = 3
Output: true
```

__Example 2:__
```
Input: nums = [1,0,1,1], k = 1
Output: true
```

__Example 3:__
```
Input: nums = [1,2,3,1,2,3], k = 2
Output: false
```

__Constraints:__
```
1 <= nums.length <= 105
-109 <= nums[i] <= 109
0 <= k <= 105
```

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

```
2 * (a + b + c) - (a + a + b + b + c) = c
```

```Python
class Solution:
    def singleNumber(self, nums: List[int]) -> int:
        # Math
        #### Time complexity : O(n)
        #### Space complexity: O(n)
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
