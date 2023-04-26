## [190. Reverse Bits](https://leetcode.com/problems/reverse-bits)

```Tag```: ```Bitwise Manipulation```

#### Difficulty: Easy

Reverse bits of a given 32 bits unsigned integer.

__Note__:

- Note that in some languages, such as Java, there is no unsigned integer type. In this case, both input and output will be given as a signed integer type. They should not affect your implementation, as the integer's internal binary representation is the same, whether it is signed or unsigned.
- In Java, the compiler represents the signed integers using 2's complement notation. Therefore, in Example 2 above, the input represents the signed integer ```-3``` and the output represents the signed integer ```-1073741825```.

![image](https://user-images.githubusercontent.com/35042430/234681442-896ade85-42b2-4cb2-8445-e8a349392087.png)

---

__Example 1:__
```
Input: n = 00000010100101000001111010011100
Output:    964176192 (00111001011110000010100101000000)
Explanation: The input binary string 00000010100101000001111010011100 represents the unsigned integer 43261596, so return 964176192 which its binary representation is 00111001011110000010100101000000.
```

__Example 2:__
```
Input: n = 11111111111111111111111111111101
Output:   3221225471 (10111111111111111111111111111111)
Explanation: The input binary string 11111111111111111111111111111101 represents the unsigned integer 4294967293, so return 3221225471 which its binary representation is 10111111111111111111111111111111.
```

__Constraints:__

- The input must be a binary string of length ```32```
 
---

![image](https://leetcode.com/problems/reverse-bits/Figures/190/190_mapping.png)

![image](https://leetcode.com/problems/reverse-bits/Figures/190/190_reverse_bits.png)

### Brute Force

```Python
class Solution:
    def reverseBits(self, n: int) -> int:
        ret, power = 0, 31
        while n:
            if n % 2 == 1:
                ret += 2 ** power
            n //= 2
            power -= 1
        return ret
```

__Follow up__: If this function is called many times, how would you optimize it?

### Bitwise Manipulation

#### Bit by Bit

- __Time Complexity__: ```O(1)```. Though we have a loop in the algorithm, the number of iteration is fixed regardless the input, since the integer is of fixed-size (32-bits) in our problem.
- __Space Complexity__: ```O(1)```

```Python
class Solution:
    def reverseBits(self, n: int) -> int:
        ret, power = 0, 31
        while n:
            '''
            if n & 1:
                ret += 1 << power
            '''
            ret += (n & 1) << power
            n = n >> 1
            power -= 1
        return ret
```

#### Byte by Byte with Memoization

- __Time Complexity__: ```O(1)```. Though we have a loop in the algorithm, the number of iteration is fixed regardless the input, since the integer is of fixed-size (32-bits) in our problem.
- __Space Complexity__: ```O(1)```

```Python
import functools

class Solution:
    # @param n, an integer
    # @return an integer
    def reverseBits(self, n):
        ret, power = 0, 24
        while n:
            ret += self.reverseByte(n & 0xff) << power
            n = n >> 8
            power -= 8
        return ret

    # memoization with decorator
    @functools.lru_cache(maxsize=256)
    def reverseByte(self, byte):
        return (byte * 0x0202020202 & 0x010884422010) % 1023
```

#### Mask & Shift

![image](https://leetcode.com/problems/reverse-bits/Figures/190/190_mask_shift.png)

__Algorithm__

We can implement the algorithm in the following steps:

1). First, we break the original 32-bit into 2 blocks of 16 bits, and switch them.

2). We then break the 16-bits block into 2 blocks of 8 bits. Similarly, we switch the position of the 8-bits blocks

3). We then continue to break the blocks into smaller blocks, until we reach the level with the block of 1 bit.

4). At each of the above steps, we merge the intermediate results into a single integer which serves as the input for the next step.

- __Time Complexity__: ```O(1)```. Though we have a loop in the algorithm, the number of iteration is fixed regardless the input, since the integer is of fixed-size (32-bits) in our problem.
- __Space Complexity__: ```O(1)```

```Python
class Solution:
    def reverseBits(self, n):
        n = (n >> 16) | (n << 16)
        n = ((n & 0xff00ff00) >> 8) | ((n & 0x00ff00ff) << 8)
        n = ((n & 0xf0f0f0f0) >> 4) | ((n & 0x0f0f0f0f) << 4)
        n = ((n & 0xcccccccc) >> 2) | ((n & 0x33333333) << 2)
        n = ((n & 0xaaaaaaaa) >> 1) | ((n & 0x55555555) << 1)
        return n
```
