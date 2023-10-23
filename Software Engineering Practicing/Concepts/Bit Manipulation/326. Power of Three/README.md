## [326. Power of Three](https://leetcode.com/problems/power-of-three)

```Tag```: ```Math``` ```Bitwise Manipulation```

#### Difficulty: Easy

Given an integer ```n```, return _```True``` if it is a power of three_. Otherwise, return ```False```.

An integer ```n``` is a power of three, if there exists an integer ```x``` such that $n == 3^x$.

![image](https://github.com/quananhle/Python/assets/35042430/adf87282-40db-4efa-8720-21bf63902bc5)

---

__Example 1:__
```
Input: n = 27
Output: true
Explanation: 27 = 3^3
```

__Example 2:__
```
Input: n = 0
Output: false
Explanation: There is no x where 3^x = 0.
```

__Example 3:__
```
Input: n = -1
Output: false
Explanation: There is no x where 3^x = (-1).
```

__Constraints:__

- $-2^{31} \le n \le 2^{31} - 1$

---

### Brute Force

__Complexity Analysis__:

- __Time Complexity__: $\mathcal{O}(\log3{N})$
- __Space Complexity__: $\mathcal{O}(1)$

```Python

```

```Python

```

__Follow up__: Could you solve it without loops/recursion?

### Precomputations

__Complexity Analysis__:

- __Time Complexity__: $\mathcal{O}(1)$
- __Space Complexity__: $\mathcal{O}(1)$

```Python
class Power:
    def __init__(self):
        max_power = 19
        self.power = power = [1] * (max_power + 1)
        for i in range(1, max_power + 1):
            power[i] = 3 * power[i - 1]

class Solution:
    num = Power()
    def isPowerOfThree(self, n: int) -> bool:
        return n > 0 and n in self.num.power
```

### Math

![image](https://github.com/quananhle/Python/assets/35042430/09f830f0-d2b0-42dd-aca7-6560301e6735)

```Python
class Solution:
    def isPowerOfThree(self, n: int) -> bool:
        return math.log(n) / math.log(3) % 1 == 0
```  
