## 1071. Greatest Common Divisor of Strings

```Tag```: ```String```

#### Difficulty: Easy

For two strings ```s``` and ```t```, we say ```"t divides s"``` iff ```s = t + ... + t``` (i.e., ```t``` is concatenated with itself one or more times).

Given two strings ```str1``` and ```str2```, return _the largest string ```x``` such that ```x``` divides both ```str1``` and ```str2```_.

![image](https://user-images.githubusercontent.com/35042430/215970545-4684fa06-a2f0-40ba-8c00-94fcf5037e59.png)

---

__Example 1:__
```
Input: str1 = "ABCABC", str2 = "ABC"
Output: "ABC"
```

__Example 2:__
```
Input: str1 = "ABABAB", str2 = "ABAB"
Output: "AB"
```

__Example 3:__
```
Input: str1 = "LEET", str2 = "CODE"
Output: ""
```

__Constraints:__

- ```1 <= str1.length, str2.length <= 1000```
- ```str1``` and ```str2``` consist of English uppercase letters.

---

### Backward Iterator

```Python
class Solution:
    def gcdOfStrings(self, str1: str, str2: str) -> str:
        # Assure str1 is always longer than str2
        if len(str1) < len(str2):
            str1, str2 = str2, str1
        if str1 == str2:
            return str1
        # Iterate backward through the short string
        for i in range(len(str2), 0, -1):
            # Shrink the size of the common divisor as we keep looking
            common_divisor = str2[:i]
            # Check if both strings have a common divisor
            if common_divisor * (len(str2) // i) == str2 and common_divisor * (len(str1) // i) == str1:
                return common_divisor
        return ""
```

### Built-in Function

```Python
class Solution:
    def gcdOfStrings(self, str1: str, str2: str) -> str:
        if str1 + str2 != str2 + str1:
            return ""
        idx = math.gcd(len(str1), len(str2))
        return str1[:idx]
```
