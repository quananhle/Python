## [191. Number of 1 Bits](https://leetcode.com/problems/number-of-1-bits)

```Tag```: ```Bitwise Manipulation```

#### Difficulty: Easy

Write a function that takes the binary representation of an unsigned integer and returns the number of '1' bits it has (also known as the Hamming weight).

__Note:__

- Note that in some languages, such as Java, there is no unsigned integer type. In this case, the input will be given as a signed integer type. It should not affect your implementation, as the integer's internal binary representation is the same, whether it is signed or unsigned.
- In Java, the compiler represents the signed integers using 2's complement notation. Therefore, in Example 3, the input represents the signed integer. ```-3```.

![image](https://github.com/quananhle/Python/assets/35042430/20fba5ef-cdd9-4900-b751-348d8f8f0a4c)

---

__Example 1:__
```
Input: n = 00000000000000000000000000001011
Output: 3
Explanation: The input binary string 00000000000000000000000000001011 has a total of three '1' bits.
```

__Example 2:__
```
Input: n = 00000000000000000000000010000000
Output: 1
Explanation: The input binary string 00000000000000000000000010000000 has a total of one '1' bit.
```

__Example 3:__
```
Input: n = 11111111111111111111111111111101
Output: 31
Explanation: The input binary string 11111111111111111111111111111101 has a total of thirty one '1' bits.
```

__Constraints:__

- The input must be a binary string of length ```32```.
 
---

### Brute Force

```Python
class Solution:
    def hammingWeight(self, n: int) -> int:
        ans = 0
        while n > 0:
            if n % 2 == 1:
                ans += 1
            n = n // 2
        return ans
```

### Bitwise Manipulation

```Python
class Solution:
    def hammingWeight(self, n: int) -> int:
        ans = 0
        while n > 0:
            '''
            if n & 1:
                ans += 1
            '''
            ans += n & 1
            n >>= 1
        return ans
```

```Python
class Solution:
    def hammingWeight(self, n: int) -> int:
        ans = 0
        while n:
            if n % 2:
                ans += 1
            n >>= 1
        return ans
```

__Follow up__: If this function is called many times, how would you optimize it?

![image](https://leetcode.com/media/original_images/191_Number_Of_Bits.png)

- __Time Complexity__: ```O(1)```
- __Space Complexity__: ```O(1)```

```Python
class Solution:
    def hammingWeight(self, n: int) -> int:
        ans = 0
        while n != 0:
            ans += 1
            n = n & (n - 1)
        
        return ans
```

```Python
class Solution:
    def hammingWeight(self, n: int) -> int:
        bits = 0
        mask = 1
        for i in range(32):
            if n & mask:
                bits += 1
            mask <<= 1
        return bits
```
