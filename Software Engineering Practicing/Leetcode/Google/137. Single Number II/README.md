## [137. Single Number II](https://leetcode.com/problems/single-number-ii/)

```Tag```: ```Sorting``` ```Hash Map``` ```Bitmasking``` ```Mathematics```

#### Difficulty: Medium

Given an integer array ```nums``` where every element appears __three times__ except for one, which appears exactly once. Find the single element and return it.

You must implement a solution with a linear runtime complexity and use only constant extra space.

![image](https://github.com/quananhle/Python/assets/35042430/9f3167a4-bda8-45ab-ad62-6e4e3051b1cd)

---

__Example 1:__
```
Input: nums = [2,2,3,2]
Output: 3
```

__Example 2:__
```
Input: nums = [0,1,0,1,0,1,99]
Output: 99
```

__Constraints:__

- $1 <=$ ```nums.length``` $<= 3 * 10^{4}$
- $-2^{31} <=$ ```nums[i]``` $<= 2^{31} - 1$
- Each element in ```nums``` appears exactly three times except for one element which appears once.

---

### Sorting

- __Time Complexity__: $O(Nlog⁡N)$
- __Space Complexity__: $O(N)$

```Python
class Solution:
    def singleNumber(self, nums: List[int]) -> int:
        nums.sort()
        n = len(nums)

        for i in range(0, n - 1, 3):
            if nums[i] == nums[i + 1]:
                continue
            else:
                return nums[i]
        
        return nums[n - 1]
```

### Hash Table

![image](https://leetcode.com/problems/single-number-ii/Documents/137/137_hash_map.SVG)

- __Time Complexity__: $O(N)$
- __Space Complexity__: $O(N)$

```Python
class Solution:
    def singleNumber(self, nums: List[int]) -> int:
        counter = collections.defaultdict(int)
        for num in nums:
            counter[num] = 1 + counter.get(num, 0)
        
        for key, val in counter.items():
            if val == 1:
                return key
        
        return -1
```

```Python
class Solution:
    def singleNumber(self, nums: List[int]) -> int:
        counter = collections.Counter(nums)

        for key, val in counter.items():
            if val == 1:
                return key
        
        return -1
```

### Mathematics

![image](https://github.com/quananhle/Python/assets/35042430/f41f51f5-3041-4c3b-a91b-922601f98e80)

- __Time Complexity__: $O(N)$
- __Space Complexity__: $O(N)$

```Python
class Solution:
    def singleNumber(self, nums: List[int]) -> int:
        return (3 * sum(set(nums)) - sum(nums)) // 2 
```

### Bit Manipulations

__NOT (~)__: Bitwise NOT is a unary operator that flips the bits of the number i.e., if the current bit is 000, it will change it to 111 and vice versa.

```Python
N = 5 = 101 (in binary)
~N = ~(101) = 010 = 2 (in decimal)
```

__AND (&)__: In bitwise AND if both bits in the compared position of the bit patterns are 111, the bit in the resulting bit pattern is 111, otherwise 000.

```Python
A = 5 = 101 (in binary) 
B = 1 = 001 (in binary) 
A & B = 101 & 001 = 001 = 1 (in decimal)
```

__OR ( | )__: Bitwise OR is also similar to bitwise AND. If both bits in the compared position of the bit patterns are 000, the bit in the resulting bit pattern is 000, otherwise 111.

```Python
A = 5 = 101 (in binary) 
B = 1 = 001 (in binary) 
A | B = 101 | 001 = 101 = 5 (in decimal)
```

__XOR (^)__: In bitwise XOR if both bits are 000 or 111, the result will be 000, otherwise 111.

```Python
A = 5 = 101 (in binary) 
B = 1 = 001 (in binary) 
A ^ B = 101 ^ 001 = 100 = 4 (in decimal)
```

__Left Shift (<<)__: Left shift operator is a binary operator which shifts some number of bits to the left and appends 000 at the end. One left shift is equivalent to multiplying the bit pattern with 222.

```Python
A = 1 = 001 (in binary) 
A << 1 = 001 << 1 = 010 = 2 (in decimal)
A << 2 = 001 << 2 = 100 = 4 (in decimal)

B = 5 = 00101 (in binary)
B << 1 = 00101 << 1 = 01010 = 10 (in decimal)
B << 2 = 00101 << 2 = 10100 = 20 (in decimal)
```

__Right Shift (>>)__: Right shift operator is a binary operator which shifts some number of bits to the right and appends 000 at the left side. One right shift is equivalent to dividing the bit pattern with 222.

```Python
A = 4 = 100 (in binary) 
A >> 1 = 100 >> 1 = 010 = 2 (in decimal)
A >> 2 = 100 >> 2 = 001 = 1 (in decimal)
A >> 3 = 100 >> 3 = 000 = 0 (in decimal)

B = 5 = 00101 (in binary)
B >> 1 = 00101 >> 1 = 00010 = 2 (in decimal)
```

![image](https://github.com/quananhle/Python/assets/35042430/f83db64f-5d8a-4c1d-a4ce-81b617bae6da)

- __Time Complexity__: $O(N)$
- __Space Complexity__: $O(1)$
  
```Python
class Solution:
    def singleNumber(self, nums: List[int]) -> int:
        ans = 0

        for shift in range(32):
            bit_sum = 0

            for num in nums:
                bit_sum += (num >> shift) & 1
            
            ans_bit = bit_sum % 3
            ans = ans | (ans_bit << shift)
        
        if ans >= (1 << 31):
            ans = ans - (1 << 32)
        
        return ans
```
