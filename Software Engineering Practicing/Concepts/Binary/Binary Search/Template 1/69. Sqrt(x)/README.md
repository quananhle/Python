## [69. Sqrt(x)](https://leetcode.com/problems/sqrtx/)

```Tag```: ```Binary Search``` ```Math``` ```Bitwise Manipulation```

#### Difficulty: Easy

Given a non-negative integer ```x```, return _the square root of ```x``` rounded down to the nearest integer_. The returned integer should be __non-negative__ as well.

You must not use any built-in exponent function or operator.

For example, do not use ```pow(x, 0.5)``` in C++ or ```x ** 0.5``` in Python.

![image](https://user-images.githubusercontent.com/35042430/229689253-fc8f665e-9af0-4d6b-9d3b-13457018d0fb.png)

---

__Example 1:__
```
Input: x = 4
Output: 2
Explanation: The square root of 4 is 2, so we return 2.
```

__Example 2:__
```
Input: x = 8
Output: 2
Explanation: The square root of 8 is 2.82842..., and since we round it down to the nearest integer, 2 is returned.
```

__Constraints:__

- 0 <= ```x``` <= 2<sup>31</sup> - 1

---

![image](https://leetcode.com/problems/sqrtx/Figures/69/cop.png)

### Binary Search

![image](https://leetcode.com/problems/sqrtx/Figures/69/binary.png)

```Python
class Solution:
    def mySqrt(self, x: int) -> int:
        if x < 2:
            return x
        
        lo, hi = 2, x // 2

        while lo <= hi:
            mi = lo + (hi - lo) // 2
            num = mi * mi

            if num < x:
                lo = mi + 1
            elif num > x:
                hi = mi - 1
            else:
                return mi
        
        return hi
```
