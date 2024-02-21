## [201. Bitwise AND of Numbers Range](https://leetcode.com/problems/bitwise-and-of-numbers-range)

```Tag```: ```Bitwise Manipulation``` ```Brian Kernighan's Algorithm```

#### Difficulty: Medium

Given two integers ```left``` and ```right``` that represent the range ```[left, right]```, return _the bitwise AND of all numbers in this range, inclusive_.

![image](https://github.com/quananhle/Python/assets/35042430/ee2d9494-c306-44b5-a0ca-964e816a7d0d)

---

__Example 1:__
```
Input: left = 5, right = 7
Output: 4
```

__Example 2:__
```
Input: left = 0, right = 0
Output: 0
```

__Example 3:__
```
Input: left = 1, right = 2147483647
Output: 0
```

__Constraints:__

- $0 \le left \le right \le 2^{31} - 1$

---

### Brute Force (Time Limit Exceeded)

```Python
class Solution:
    def rangeBitwiseAnd(self, left: int, right: int) -> int:
        '''
        5:          00000101
        6:          00000110
        7:          00000111
        5 & 6 & 7:  00000100
        '''
        ans = left
        for num in range(left + 1, right + 1):
            ans = ans & num
        return ans
```

![image](https://leetcode.com/problems/bitwise-and-of-numbers-range/Figures/201/201_prefix.png)

### Approach 1: Bit Shift

![image](https://leetcode.com/problems/bitwise-and-of-numbers-range/Figures/201/201_bit_shifting.png)

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(1)$
- __Space Complexity__: $\mathcal{O}(1)$

```Python
class Solution:
    def rangeBitwiseAnd(self, left: int, right: int) -> int:
        shift = 0
        while left < right:
            left >>= 1
            right >>= 1
            shift += 1
        return left << shift
```

### Approach 2: Brian Kernighan's Algorithm

![image](https://leetcode.com/problems/bitwise-and-of-numbers-range/Figures/201/201_bk_example.png)

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(1)$
- __Space Complexity__: $\mathcal{O}(1)$

```Python

```
