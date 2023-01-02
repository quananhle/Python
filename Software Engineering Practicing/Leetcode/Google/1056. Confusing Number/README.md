## 1056. Confusing Number

```Tag```: ```Hash Map``` ```Math```

#### Difficulty: Easy

A __confusing number__ is a number that when rotated ```180``` degrees becomes a different number with each digit valid.

We can rotate digits of a number by ```180``` degrees to form new digits.

- When ```0```, ```1```, ```6```, ```8```, and ```9``` are rotated ```180``` degrees, they become ```0```, ```1```, ```9```, ```8```, and ```6``` respectively.
- When ```2```, ```3```, ```4```, ```5```, and ```7``` are rotated ```180``` degrees, they become invalid.
- 
Note that after rotating a number, we can ignore leading zeros.

For example, after rotating ```8000```, we have 0008 which is considered as just ```8```.
Given an integer ```n```, return ```true``` if it is a confusing number, or ```false``` otherwise.

![image](https://user-images.githubusercontent.com/35042430/210161363-1bf5f16b-3faa-491a-ae65-c2353a753cb5.png)

---

Example 1:


Input: n = 6
Output: true
Explanation: We get 9 after rotating 6, 9 is a valid number, and 9 != 6.
Example 2:


Input: n = 89
Output: true
Explanation: We get 68 after rotating 89, 68 is a valid number and 68 != 89.
Example 3:


Input: n = 11
Output: false
Explanation: We get 11 after rotating 11, 11 is a valid number but the value remains the same, thus 11 is not a confusing number
 

Constraints:

0 <= n <= 109

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
