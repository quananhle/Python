## 67. Add Binary

```Tag```: ```Bitwise Manipulation```

#### Difficulty: Easy

Given two binary strings ```a``` and ```b```, return _their sum as a binary string_.

![image](https://user-images.githubusercontent.com/35042430/218656167-3a63a56e-5fd6-4305-a644-24098eb5972a.png)

---

__Example 1:__
```
Input: a = "11", b = "1"
Output: "100"
```

__Example 2:__
```
Input: a = "1010", b = "1011"
Output: "10101"
```

__Constraints:__

- 1 <= ```a.length, b.length``` <= 10<sup>4</sup>
- ```a``` and ```b``` consist only of ```'0'``` or ```'1'``` characters.
- Each string does not contain leading zeros except for the zero itself.

---

### Bitwise Manipulation

```Python
class Solution:
    def addBinary(self, a: str, b: str) -> str:
        x, y = int(a, 2), int(b, 2)
        print (x, y)
        while y:
            answer = x ^ y
            carry = (x & y) << 1
            x, y = answer, carry
        return bin(x)[2:]
```

### String and Array

```Python
class Solution:
    def addBinary(self, a: str, b: str) -> str:
        n = max(len(a), len(b))
        a, b = a.zfill(n), b.zfill(n)
        
        carry = 0
        res = list()

        for i in range(n - 1, -1, -1):
            if a[i] == '1':
                carry += 1
            if b[i] == '1':
                carry += 1
            if carry % 2 == 1:
                res.append('1')
            else:
                res.append('0')
            carry = carry // 2

        if carry == 1:
            res.append('1')

        return ''.join(res)[::-1]
```
