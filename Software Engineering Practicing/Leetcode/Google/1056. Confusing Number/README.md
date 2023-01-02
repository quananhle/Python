## 1056. Confusing Number

```Tag```: ```Hash Map``` ```Math```

#### Difficulty: Easy

![image](https://user-images.githubusercontent.com/35042430/210161363-1bf5f16b-3faa-491a-ae65-c2353a753cb5.png)


---


---

![image](https://leetcode.com/problems/confusing-number/solutions/2918441/Figures/1056/1.png)

### Invert and Reverse with Hash Table

```Python
class Solution:
    def confusingNumber(self, n: int) -> bool:
        memo = {'0': 0, '1': 1, '6': 9, '8': 8, '9': 6}
        num_str = str(n)
        rotated = ""
        for i in range(len(num_str)-1, -1, -1):
            rotated += num_str[i]
        rotated_num = 0
        for i in range(len(rotated)):
            if not rotated[i] in memo:
                return False
            rotated_num += int(memo[rotated[i]]) * 10**(len(rotated)-1-i)
        return rotated_num != n
```

```Python
class Solution:
    def confusingNumber(self, n: int) -> bool:
        memo = {'0': '0', '1': '1', '6': '9', '8': '8', '9': '6'}
        rotated = list()

        for char in str(n):
            if not char in memo:
                return False
            rotated.append(memo[char])

        rotated = "".join(rotated)
        return int(rotated[::-1]) != n
```

### Remainder

```Python
class Solution:
    def confusingNumber(self, n: int) -> bool:
        memo = {0:0, 1:1, 6:9, 8:8, 9:6}
        rotated = 0
        num = n

        while num:
            res = num % 10
            if not res in memo:
                return False
            rotated = rotated * 10 + memo[res]
            num //= 10
        
        return rotated != n
```
