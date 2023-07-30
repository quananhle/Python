## [664. Strange Printer](https://leetcode.com/problems/strange-printer)

```Tag```: ```Dynamic Programming```

#### Difficulty: Hard

There is a strange printer with the following two special properties:

- The printer can only print a sequence of the same character each time.
- At each turn, the printer can print new characters starting from and ending at any place and will cover the original existing characters.

Given a string ```s```, return _the minimum number of turns the printer needed to print it_.

![image](https://github.com/quananhle/Python/assets/35042430/1f5c6206-aac6-405c-b4a5-d8d89fd85673)

---



---

### The Framework

#### Top-Down Dynamic Programming

```Python
class Solution:
    def strangePrinter(self, s: str) -> int:
        n = len(s)
        memo = collections.defaultdict(default=-1)

        def dp(left, right):
            if (left, right) in memo:
                return memo[(left, right)]
            
            memo[(left, right)] = n
            j = -1

            for i in range(left, right):
                if s[i] != s[right] and j == -1:
                    j = i
                if j != -1:
                    memo[(left, right)] = min(memo[(left, right)], dp(j, i) + 1 + dp(i + 1, right))
            
            if j == -1:
                memo[(left, right)] = 0
            
            return memo[(left, right)]
            
        return dp(0, n - 1) + 1
```
