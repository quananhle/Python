## 1088. Confusing Number II

```Tag```: ```Backtracking```

#### Difficulty: Hard

A __confusing number__ is a number that when rotated ```180``` degrees becomes a different number with __each digit__ valid.

We can rotate digits of a number by ```180``` degrees to form new digits.

- When ```0```, ```1```, ```6```, ```8```, and ```9``` are rotated ```180``` degrees, they become ```0```, ```1```, ```9```, ```8```, and ```6``` respectively.
- When ```2```, ```3```, ```4```, ```5```, and ```7``` are rotated ```180``` degrees, they become __invalid__.

Note that after rotating a number, we can ignore leading zeros.

- For example, after rotating ```8000```, we have ```0008``` which is considered as just ```8```.

Given an integer ```n```, return _the number of __confusing numbers__ in the inclusive range ```[1, n]```_.

![image](https://user-images.githubusercontent.com/35042430/214094976-1c9d6412-247a-4e8a-8abb-8c087ed4868e.png)

---

__Example 1__:
```
Input: n = 20
Output: 6
Explanation: The confusing numbers are [6,9,10,16,18,19].
6 converts to 9.
9 converts to 6.
10 converts to 01 which is just 1.
16 converts to 91.
18 converts to 81.
19 converts to 61.
```

__Example 2__:
```
Input: n = 100
Output: 19
Explanation: The confusing numbers are [6,9,10,16,18,19,60,61,66,68,80,81,86,89,90,91,98,99,100].
```

__Constraints__:

1 <= n <= 10<sup>9</sup>

---

### Depth-First Search

```Python
class Solution:
    def confusingNumberII(self, n: int) -> int:
        rotate_digits = {'0':0, '1':1, '6':9, '8':8, '9':6}
        count = 0

        def dfs(num, rotation, units):        
            nonlocal count
            if num != rotation:
                count += 1
            for digit in rotate_digits:
                if rotate_digits[digit] == 0 and num == 0:
                    continue
                if num * 10 + int(digit) > n:
                    break
                dfs(num * 10 + int(digit), rotate_digits[digit] * units + rotation, units * 10)
        
        dfs(0, 0, 1)
        return count
```

```Python
class Solution:
    def confusingNumberII(self, n: int) -> int:
        rotate_digits = {'0':0, '1':1, '6':9, '8':8, '9':6}
        res = list()

        def dfs(num, rotate, units):
            if int(num) != rotate:
                res.append(int(num))
            for digit in rotate_digits:
                confusing_number = int(num) * 10 + int(digit)
                if confusing_number > n: 
                    return
                dfs(confusing_number, rotate_digits[digit] * units + rotate, units * 10)
        
        for digit in rotate_digits:
            if rotate_digits[digit] != 0:
                dfs(digit, rotate_digits[digit], 10)

        return len(res)
```

### Backtracking

```Python
class Solution:
    def confusingNumberII(self, n: int) -> int:
        rotate_digits = {'0':0, '1':1, '6':9, '8':8, '9':6}
        count = 0

        def backtrack(num, rotation, units):
            nonlocal count
            if num:
                if num != rotation:
                    count += 1
            for digit in rotate_digits:
                if num * 10 + int(digit) > n:
                    break
                else:
                    backtrack(num * 10 + int(digit), rotate_digits[digit] * units + rotation, units * 10)
        
        backtrack(1, 1, 10)
        backtrack(6, 9, 10)
        backtrack(8, 8, 10)
        backtrack(9, 6, 10)

        return count
```
