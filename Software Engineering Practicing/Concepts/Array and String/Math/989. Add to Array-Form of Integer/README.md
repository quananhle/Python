## 989. Add to Array-Form of Integer

```Tag```: ```Array``` ```Math```

#### Difficulty: Easy

The array-form of an integer ```num``` is an array representing its digits in left to right order.

- For example, for ```num = 1321```, the array form is ```[1,3,2,1]```.

Given __num__, the __array-form__ of an integer, and an integer ```k```, return _the __array-form__ of the integer ```num + k```_.

![image](https://user-images.githubusercontent.com/35042430/218947957-3ca29c5b-7f93-45bc-8652-8e1880a9e204.png)

---

__Example 1:__
```
Input: num = [1,2,0,0], k = 34
Output: [1,2,3,4]
Explanation: 1200 + 34 = 1234
```

__Example 2:__
```
Input: num = [2,7,4], k = 181
Output: [4,5,5]
Explanation: 274 + 181 = 455
```

__Example 3:__
```
Input: num = [2,1,5], k = 806
Output: [1,0,2,1]
Explanation: 215 + 806 = 1021
```

__Constraints:__

- ```1 <= num.length <= 10^4```
- ```0 <= num[i] <= 9```
- ```num``` does not contain any leading zeros except for the zero itself.
- ```1 <= k <= 10^4```

---

### Brute Force

#### Time Limit Exceeded

```Python
class Solution:
    def addToArrayForm(self, num: List[int], k: int) -> List[int]:
        # Time Limit Exceeded
        """
        whole_number = 0
        for i in range(len(num)):
            whole_number += num[i] * 10**(len(num) - 1 - i)
        whole_number += k
        tmp = whole_number
        n = 0
        while tmp > 0:
            tmp //= 10
            n += 1
        res = list()
        for i in range(n-1, -1, -1):
            digit = whole_number // 10**i
            whole_number %= 10**i
            res.append(digit)
        return res
```

#### In-Place Add Operations

```Python
class Solution:
    def addToArrayForm(self, num: List[int], k: int) -> List[int]:
        carry = 0
        res = []
        for i in range(len(num)-1, -1, -1):
            total = num[i] + carry + (k % 10)
            carry = total // 10
            res.append(total % 10)
            k //= 10
        # Check if carry in k
        while k > 0:
            total = carry + (k % 10)
            carry = total // 10
            res.append(total % 10)
            k //= 10
        # Check if carry in num
        if carry > 0:
            res.append(carry)
        return res[::-1]
```

### Divmod

```Python
class Solution:
    def addToArrayForm(self, num: List[int], k: int) -> List[int]:
        num[-1] += k
        for i in range(len(num) - 1, -1, -1):
            '''
            carry, num[i] = divmod(num[i], 10)
            '''
            carry = num[i] // 10
            num[i] %= 10
            if i: 
                num[i-1] += carry        
        while carry:
            num = [carry % 10] + num
            carry //= 10
        return num
```

### Built-in str() and map() and int()

```Python
class Solution:
    def addToArrayForm(self, num: List[int], k: int) -> List[int]:
        res = map(str, num)
        whole_number = "".join(res)
        ans = int(whole_number) + k
        return [int(d) for d in str(ans)]
```

### One-Liner

```
class Solution:
    def addToArrayForm(self, num: List[int], k: int) -> List[int]:
        return [int(d) for d in str(int("".join(map(str, num))) + k)]
```
