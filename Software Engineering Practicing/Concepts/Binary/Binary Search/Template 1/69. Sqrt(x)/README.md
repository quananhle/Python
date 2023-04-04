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

__Algorithm__

1. If ```x < 2```, return ```x```.
2. Set the ```left``` boundary to ```2```, and the ```right``` boundary to ```x // 2```.
3. While ```left <= right```:

- Take ```num = (left + right) / 2``` as a guess. Compute ```num * num``` and compare it with ```x```:
    - If ```num * num > x```, move the ```right``` boundary ```right = pivot - 1```
    - Else, if ```num * num < x```, move the ```left``` boundary ```left = pivot + 1```
    - Otherwise ```num * num == x```, the integer square root is here, let's return it

4. Return ```right```

- __Time complexity__: ```O(log N)```.
- __Space complexity__: ```O(1)```.

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

### Math

![image](https://user-images.githubusercontent.com/35042430/229691490-89f1f66a-0d68-4e98-afbf-fa3915cdd94d.png)

- __Time complexity__: ```O(1)```.
- __Space complexity__: ```O(1)```.

```Python
class Solution:
    def mySqrt(self, x: int) -> int:
        if x < 2:
            return x

        lo = int(math.e ** (0.5 * math.log(x)))
        hi = lo + 1

        return hi if hi * hi == x else lo
```

### Bitwise & Shift

```Python

```

### Newton's Method

```Python

```
