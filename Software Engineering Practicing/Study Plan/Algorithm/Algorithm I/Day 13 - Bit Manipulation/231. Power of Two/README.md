## [231. Power of Two](https://leetcode.com/problems/power-of-two)

```Tag```: ```Bitwise Manipulation``` ```Math```

#### Difficulty: Easy

Given an integer ```n```, return _```true``` if it is a power of two_. Otherwise, return ```false```.

An integer ```n``` is a power of two, if there exists an integer ```x``` such that ```n == 2```<sup>```x```</sup>.

![image](https://user-images.githubusercontent.com/35042430/234656264-268ceecc-9dad-4508-be2d-93ba38476bec.png)

---

__Example 1:__
```
Input: n = 1
Output: true
Explanation: 20 = 1
```

__Example 2:__
```
Input: n = 16
Output: true
Explanation: 24 = 16
```

__Example 3:__
```
Input: n = 3
Output: false
```

__Constraints:__

-2<sup>31</sup> <= n <= 2<sup>31</sup> - 1

---

### Brute Force

```Python
class Solution:
    def isPowerOfTwo(self, n: int) -> bool:
        if n <= 0:
            return False

        power = 0
        base = 2
        curr = 1
        while curr < n:
            curr = base ** power
            power += 1
        
        return curr == n
```

```Python
class Solution:
    def isPowerOfTwo(self, n: int) -> bool:
        if n == 0:
            return False
        while n % 2 == 0:
            n /= 2
        return n == 1
```

__Follow up__: Could you solve it without loops/recursion?

### Bitwise Manipulation 

#### Get the Rightmost 1-bit

![image](https://user-images.githubusercontent.com/35042430/234666139-71e2c7fa-d981-484c-9c06-34a86dbc270b.png)

![image](https://leetcode.com/problems/power-of-two/Figures/231/twos.png)

![image](https://leetcode.com/problems/power-of-two/Figures/231/rightmost.png)

![image](https://leetcode.com/problems/power-of-two/Figures/231/first2.png)

```Python
class Solution:
    def isPowerOfTwo(self, n: int) -> bool:
        if n == 0:
            return False
        return n & (-n) == n
```

#### Turn off the Rightmost 1-bit

![image](https://leetcode.com/problems/power-of-two/Figures/231/turn2.png)

![image](https://leetcode.com/problems/power-of-two/Figures/231/second2.png)

```Python
class Solution:
    def isPowerOfTwo(self, n: int) -> bool:
        if n == 0:
            return False
        return n & (n - 1) == 0
```
