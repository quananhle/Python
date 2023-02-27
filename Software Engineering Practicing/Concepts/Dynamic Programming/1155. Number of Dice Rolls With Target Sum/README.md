## [1155. Number of Dice Rolls With Target Sum](https://leetcode.com/problems/number-of-dice-rolls-with-target-sum/)

```Tag```: ```Dynamic Programming``` ```Recursion```

#### Difficulty: Medium

You have ```n``` dice, and each die has ```k``` faces numbered from ```1``` to ```k```.

Given three integers ```n```, ```k```, and ```target```, return _the number of possible ways (out of the k<sup>n</sup> total ways) to roll the dice, so the sum of the face-up numbers equals ```target```_. Since the answer may be too large, return it modulo 10<sup>9</sup> + 7.

![image](https://user-images.githubusercontent.com/35042430/221691173-e5bb3f6f-fa2d-41b7-808c-40a6971b306b.png)

---

__Example 1:__
```
Input: n = 1, k = 6, target = 3
Output: 1
Explanation: You throw one die with 6 faces.
There is only one way to get a sum of 3.
```

__Example 2:__
```
Input: n = 2, k = 6, target = 7
Output: 6
Explanation: You throw two dice, each with 6 faces.
There are 6 ways to get a sum of 7: 1+6, 2+5, 3+4, 4+3, 5+2, 6+1.
```

__Example 3:__
```
Input: n = 30, k = 30, target = 500
Output: 222616187
Explanation: The answer must be returned modulo 109 + 7.
```

__Constraints:__

- ```1 <= n, k <= 30```
- ```1 <= target <= 1000```

---

### Brute Force

```Python
class Solution:
    @lru_cache(None)
    def numRollsToTarget(self, n: int, k: int, target: int) -> int:
        # Brute Force
        MOD = 10**9 + 7
        
        # Base cases:
        if n == 0:
            if target == 0:
                return 1
            else:
                return 0

        ways = 0
        
        for i in range(1, k + 1):
            ways += self.numRollsToTarget(n - 1, k, target - i)

        return ways % MOD
```

---

### The Framework

#### Top-Down Dynamic Programming (Recursion)

```Python

```
