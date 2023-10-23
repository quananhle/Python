## [342. Power of Four](https://leetcode.com/problems/power-of-four/)

```Tag```: ```Math``` ```Bitwise Manipulation```

#### Difficulty: Easy

Given an integer ```n```, return _```True``` if it is a power of four_. Otherwise, return ```False```.

An integer ```n``` is a power of four, if there exists an integer ```x``` such that ```n == 4x```.

<img width="647" alt="image" src="https://github.com/quananhle/Python/assets/35042430/c54a21e1-0168-424d-9c21-823bb014ebf7">

---

__Example 1:__
```
Input: n = 16
Output: true
```

__Example 2:__
```
Input: n = 5
Output: false
```

__Example 3:__
```
Input: n = 1
Output: true
```
 
__Example 4:__
```
Input: n = 0
Output: false
```

__Constraints:__

- $-2^{31} \le n \le 2^{31} - 1$

---

### Brute Force

__Complexity Analysis__:

- __Time Complexity__: $\mathcal{O}(\log{N})$
- __Space Complexity__: $\mathcal{O}(1)$

```Python
class Solution:
    def isPowerOfFour(self, n: int) -> bool:
        if n == 0:
            return False
        while n % 4 == 0:
            n /= 4
        return n == 1
```

```Python
class Solution:
    def isPowerOfFour(self, n: int) -> bool:
        if n <= 0:
            return False
        
        x = curr = 0

        while curr < n:
            curr = 4**x
            x += 1
        
        return curr == n
```

__Follow up__: Could you solve it without loops/recursion?

### Precomputations

__Complexity Analysis__:

- __Time Complexity__: $\mathcal{O}(1)$
- __Space Complexity__: $\mathcal{O}(1)$

```Python
class Powers:
    def __init__(self):
        max_power = 15
        self.nums = nums = [1] * (max_power + 1)
        for i in range(1, max_power + 1):
            nums[i] = 4 * nums[i - 1]

class Solution:
    power = Powers()
    def isPowerOfFour(self, n: int) -> bool:
        return n in self.power.nums
```

### Math

![image](https://github.com/quananhle/Python/assets/35042430/5a0d3753-9621-4112-8ae7-41742d6e95c5)

```Python
class Solution:
    def isPowerOfFour(self, n: int) -> bool:
        return n > 0 and math.log2(n) % 2 == 0
```
