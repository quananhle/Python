## [342. Power of Four](https://leetcode.com/problems/power-of-four/)

```Tag```: ```Math```

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

```Python
class Solution:
    def isPowerOfFour(self, n: int) -> bool:
        if n == 0:
            return False
        while n % 4 == 0:
            n /= 4
        return n == 1
```

__Follow up__: Could you solve it without loops/recursion?
