## 50. Pow(x, n)

```Tag```: ```Recursion```

#### Difficulty: Medium

Implement ```pow(x, n)```, which calculates ```x``` raised to the power ```n``` (i.e., x<sup>n</sup>).

![image](https://user-images.githubusercontent.com/35042430/216752099-4f762004-0675-4164-ac4c-06ea69a8e56b.png)

---

__Example 1:__
```
Input: x = 2.00000, n = 10
Output: 1024.00000
```

__Example 2:__
```
Input: x = 2.10000, n = 3
Output: 9.26100
```

__Example 3:__
```
Input: x = 2.00000, n = -2
Output: 0.25000
Explanation: 2-2 = 1/22 = 1/4 = 0.25
```

__Constraints:__

- ```-100.0 < x < 100.0```
- -2<sup>31</sup> <= ```n``` <= 2<sup>31</sup> - 1
- ```n``` is an integer.
- -10<sup>4</sup> <= x<sup>n</sup> <= 10<sup>4</sup>

---

### Brute Force

#### Time Limit Exceeded

```Python
class Solution:
    def myPow(self, x: float, n: int) -> float:
        # Brute Force
        ### Time Limit Exceeded
        """
        if not x:
            return 0
        if not n or x == 1:
            return 1
        if n < 0:
            x = 1/x
            n = -n
        ans = x
        for _ in range(2, n+1):
            ans *= x
        return ans
```

```Python
class Solution:
    def myPow(self, x: float, n: int) -> float:
        if not x:
            return 0
        if not n or x == 1:
            return 1
        if n < 0:
            x = 1/x
            n = -n
        cache = [0] * (n + 1)
        cache[0], cache[1] = 1, x
        for i in range(2, len(cache)):
            cache[i] = x * cache[i-1]
        return cache[n]
```

```Python
class Solution:
    def myPow(self, x: float, n: int) -> float:
        if not x:
            return 0
        if not n or x == 1:
            return 1
        if n < 0:
            x = 1/x
            n = -n
        cache = collections.defaultdict(int)
        cache[0], cache[1] = 1, x
        for i in range(2, n + 1):
            cache[i] = x * cache[i-1]
        return cache[n]
```

### Fast Power Algorithm

#### Recursive Approach

![image](https://user-images.githubusercontent.com/35042430/216752727-5ab9120e-6cb4-4458-9dc4-94f7278f927d.png)

#### Algorithm

![image](https://user-images.githubusercontent.com/35042430/216752885-c966f64e-13b2-41af-8098-eb2c65a9f945.png)

```Python
class Solution:
    def myPow(self, x: float, n: int) -> float:
        # Edge cases
        if n < 0:
            x = 1/x
            n = -n
        
        def fast_power(x, n):
            # Base cases
            if not x:
                return 0
            if not n or x == 1:
                return 1

            half = fast_power(x, n // 2)

            if n % 2 == 0:
                return half * half
            else:
                return half * half * x
        
        return fast_power(x, n)
```
