## [2864. Maximum Odd Binary Number](https://leetcode.com/problems/maximum-odd-binary-number)

```Tag```: ```Array & String``` ```Greedy``` ```Two Pointers``` ```Bit Manipulations```

#### Difficulty: Easy

You are given a binary string ```s``` that contains at least one ```'1'```.

You have to rearrange the bits in such a way that the resulting binary number is the maximum odd binary number that can be created from this combination.

Return _a string representing the maximum odd binary number that can be created from the given combination_.

Note that the resulting string can have leading zeros.

---

__Example 1:__

```
Input: s = "010"
Output: "001"
Explanation: Because there is just one '1', it must be in the last position. So the answer is "001".
```

__Example 2:__

```
Input: s = "0101"
Output: "1001"
Explanation: One of the '1's must be in the last position. The maximum number that can be made with the remaining digits is "100". So the answer is "1001".
```

__Constraints:__

- $1 \le s.length \le 100$
- ```s``` consists only of ```'0'``` and ```'1'```.
- ```s``` contains at least one ```'1'```.

---

### Greedy Bit Manipulation (Counting Ones)

#### Two Passes

```Python
class Solution:
    def maximumOddBinaryNumber(self, s: str) -> str:
        one_count = zero_count = 0
        n = len(s)

        for c in s:
            if c == '1':
                one_count += 1
            else:
                zero_count += 1

        ans = []
        while one_count > 1:
            ans.append('1')
            one_count -= 1
        while zero_count:
            ans.append('0')
            zero_count -= 1
        
        ans.append('1')

        return ''.join(ans)
```

#### One Pass

```Python
class Solution:
    def maximumOddBinaryNumber(self, s: str) -> str:
        one_count = s.count('1')
        n = len(s)

        return ''.join(['1'] * (one_count - 1) + ['0'] * (n - one_count) + ['1'])
```

### Greedy Bit Manipulation (Sorting and Swapping)

```Python
class Solution:
    def maximumOddBinaryNumber(self, s: str) -> str:
        arr = sorted(s)
        n = len(s)

        for i in range(n // 2):
            arr[i], arr[n - i - 2] = arr[n - i - 2], arr[i]
        
        return ''.join(arr)
```

### Greedy Bit Manipulation (Two Pointers)

```Python
class Solution:
    def maximumOddBinaryNumber(self, s: str) -> str:
        n = len(s)
        arr = [c for c in s]

        left, right = 0, n - 1
        while left <= right:
            if arr[left] == '1':
                left += 1
            if arr[right] == '0':
                right -= 1
            if left <= right and arr[left] == '0' and arr[right] == '1':
                arr[left], arr[right] = arr[right], arr[left]
            
        arr[left - 1], arr[n - 1] = '0', '1'
        
        return "".join(arr)
```
