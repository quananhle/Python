## [367. Valid Perfect Square](https://leetcode.com/problems/valid-perfect-square)

```Tag```: ```Binary Search``` ```Math```

#### Difficulty: Easy

Given a positive integer ```num```, return _```true``` if num is a perfect square or ```false``` otherwise_.

A __perfect square__ is an integer that is the square of an integer. In other words, it is the product of some integer with itself.

You must not use any built-in library function, such as ```sqrt```.

![image](https://user-images.githubusercontent.com/35042430/230949644-fef18d79-6923-4621-8655-e05db332304d.png)

---

__Example 1:__
```
Input: num = 16
Output: true
Explanation: We return true because 4 * 4 = 16 and 4 is an integer.
```

__Example 2:__
```
Input: num = 14
Output: false
Explanation: We return false because 3.742 * 3.742 = 14 and 3.742 is not an integer.
```

__Constraints:__

- ```1 <= num <= 2```<sup>```31```</sup>```- 1```

---

### Brute Force

```Python
class Solution:
    def isPerfectSquare(self, num: int) -> bool:
        for i in range(num + 1):
            if i**2 == num:
                return True
            if i**2 > num:
                break
        return False
```

### Binary Search

![image](https://leetcode.com/problems/valid-perfect-square/Figures/367/binary.png)

- __Time complexity__: ```O(log⁡N)```
- __Space complexity__: ```O(1)```

```Python
class Solution:
    def isPerfectSquare(self, num: int) -> bool:
        if num < 2:
            return True
        # Define the boundaries
        lo, hi = 2, num // 2

        while lo <= hi:
            mi = lo + (hi - lo) // 2
            target = mi * mi

            if target == num:
                return True
            elif target < num:
                lo = mi + 1
            else:
                hi = mi - 1

        return False
```

### Newton's Method

![image](https://leetcode.com/problems/valid-perfect-square/Figures/367/parabola4.png)

![image](https://leetcode.com/problems/valid-perfect-square/Figures/367/newton2.png)

```Python
class Solution:
    def isPerfectSquare(self, num: int) -> bool:
        if num < 2:
            return True
        x = num // 2

        while x * x > num:
            x = (x + num // x) // 2
        
        return x * x == num
```
