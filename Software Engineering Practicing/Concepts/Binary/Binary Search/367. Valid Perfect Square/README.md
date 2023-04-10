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
