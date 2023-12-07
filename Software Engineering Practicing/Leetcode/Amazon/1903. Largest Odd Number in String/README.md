## [1903. Largest Odd Number in String](https://leetcode.com/problems/largest-odd-number-in-string)

```Tag```: ```Array & String```

#### Difficulty: Easy

You are given a string ```num```, representing a large integer. Return _the largest-valued odd integer (as a string) that is a non-empty substring of ```num```, or an empty string ```""``` if no odd integer exists_.

A substring is a contiguous sequence of characters within a string.

![image](https://github.com/quananhle/Python/assets/35042430/f9b0ad94-1c16-4d3f-ba54-77247a40f7b4)

---

__Example 1:__
```
Input: num = "52"
Output: "5"
Explanation: The only non-empty substrings are "5", "2", and "52". "5" is the only odd number.
```

__Example 2:__
```
Input: num = "4206"
Output: ""
Explanation: There are no odd numbers in "4206".
```

__Example 3:__
```
Input: num = "35427"
Output: "35427"
Explanation: "35427" is already an odd number.
```

__Constraints:__

- $1 \le num.length \le 10^5$
- ```num``` only consists of digits and does not contain any leading zeros.

---

### Array & String

#### Right to Left Scan

```Python
class Solution:
    def largestOddNumber(self, num: str) -> str:
        n = len(num)
        for i in range(n - 1, -1, -1):
            if int(num[i]) % 2:
                return num[:i+1]
        
        return ""
```

#### Left to Right Scan

```Python
class Solution:
    def largestOddNumber(self, num: str) -> str:
        n = len(num)
        rightmost_odd = -1

        for i in range(n):
            if num[i] in '13579':
                rightmost_odd = max(rightmost_odd, i)
        
        return num[:rightmost_odd + 1]
```
