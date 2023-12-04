## [1611. Minimum One Bit Operations to Make Integers Zero](https://leetcode.com/problems/minimum-one-bit-operations-to-make-integers-zero)

```Tag```: ```Bitwise Manipulation``` ```Math``` ```Recursion``` ```Gray Code Algorithm```

#### Difficulty: Hard

Given an integer ```n```, you must transform it into ```0``` using the following operations any number of times:

- Change the rightmost ($0^{th}$) bit in the binary representation of ```n```.
- Change the $i^{th}$ bit in the binary representation of ```n``` if the $(i-1)^{th}$ bit is set to ```1``` and the $(i-2)^{th}$ through $0^{th}$ bits are set to ```0```.

Return _the minimum number of operations to transform ```n``` into ```0```_.

![image](https://github.com/quananhle/Python/assets/35042430/05298826-f3d4-4dfa-bca8-3b2b60156a2f)

---

__Example 1:__
```
Input: n = 3
Output: 2
Explanation: The binary representation of 3 is "11".
"11" -> "01" with the 2nd operation since the 0th bit is 1.
"01" -> "00" with the 1st operation.
```

__Example 2:__
```
Input: n = 6
Output: 4
Explanation: The binary representation of 6 is "110".
"110" -> "010" with the 2nd operation since the 1st bit is 1 and 0th through 0th bits are 0.
"010" -> "011" with the 1st operation.
"011" -> "001" with the 2nd operation since the 0th bit is 1.
"001" -> "000" with the 1st operation.
```

__Constraints:__

- $0 \le n \le 10^9$

---

### Math + Recursion

![image](https://leetcode.com/problems/minimum-one-bit-operations-to-make-integers-zero/Figures/1611/1.png)

![image](https://github.com/quananhle/Python/assets/35042430/f8bfa0f2-4166-43fa-bc1a-5608112cd0a8)

![image](https://leetcode.com/problems/minimum-one-bit-operations-to-make-integers-zero/Figures/1611/3.png)

![image](https://github.com/quananhle/Python/assets/35042430/a631d7eb-4f17-463e-8512-f42e88ee5b0e)

```Python
class Solution:
    def minimumOneBitOperations(self, n: int) -> int:
        if n == 0:
            return 0
        
        k = 0
        curr = 1
        while (curr * 2) <= n:
            curr *= 2
            k += 1

        return 2 ** (k + 1) - 1 - self.minimumOneBitOperations(n ^ curr)
```

### Iteration

```Python
class Solution:
    def minimumOneBitOperations(self, n: int) -> int:
        ans = 0
        k = 0
        mask = 1
        
        while mask <= n:
            if n & mask:
                ans = 2 ** (k + 1) - 1 - ans
                
            mask <<= 1
            k += 1
        
        return ans
```

### Gray Code Algorithm

```Python
class Solution:
    def minimumOneBitOperations(self, n: int) -> int:
        ans = n
        ans ^= ans >> 16
        ans ^= ans >> 8
        ans ^= ans >> 4
        ans ^= ans >> 2
        ans ^= ans >> 1
        return ans
```
