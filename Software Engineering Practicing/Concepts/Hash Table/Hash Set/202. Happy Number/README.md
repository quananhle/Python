## 202. Happy Number

```Tag```: ```Hash Set```

#### Difficulty: Easy

Write an algorithm to determine if a number ```n``` is happy.

A __happy number__ is a number defined by the following process:

- Starting with any positive integer, replace the number by the sum of the squares of its digits.
- Repeat the process until the number equals 1 (where it will stay), or it __loops endlessly in a cycle__ which does not include 1.
- Those numbers for which this process ends in 1 are happy.

Return _```true``` if n is a happy number, and ```false``` if not_.

![image](https://user-images.githubusercontent.com/35042430/213296655-e5f5a784-252e-4e67-a5b5-f4bbbd284353.png)

---

__Example 1:__
Input: n = 19
Output: true
Explanation:
1<sup>2</sup> + 9<sup>2</sup> = 82
8<sup>2</sup> + 2<sup>2</sup> = 68
6<sup>2</sup> + 8<sup>2</sup> = 100
1<sup>2</sup> + 0<sup>2</sup> + 0<sup>2</sup> = 1


__Example 2:__
```
Input: n = 2
Output: false
```

__Constraints:__
```
1 <= n <= 231 - 1
```

---

### Hash Set

```Python
class Solution:
    def isHappy(self, n: int) -> bool:
        seen = set()
        while n != 1:
            if n in seen:
                return False
            seen.add(n)
            n = sum([int(num)**2 for num in str(n)])
        return True
```
