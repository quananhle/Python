## [125. Valid Palindrome](https://leetcode.com/problems/valid-palindrome)

```Tag```: ```Two Pointers```

#### Difficulty: Easy

A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.

Given a string ```s```, return _```true``` if it is a palindrome, or ```false``` otherwise_.

![image](https://github.com/quananhle/Python/assets/35042430/8130b909-728e-4b4d-a9d8-469b078fc06f)

---

__Example 1__:
```
Input: s = "A man, a plan, a canal: Panama"
Output: true
Explanation: "amanaplanacanalpanama" is a palindrome.
```

__Example 2__:
```
Input: s = "race a car"
Output: false
Explanation: "raceacar" is not a palindrome.
```

__Example 3__:
```
Input: s = " "
Output: true
Explanation: s is an empty string "" after removing non-alphanumeric characters.
Since an empty string reads the same forward and backward, it is a palindrome.
```

__Constraints__:

- $1 \le s.length \le 2 * 10^5$
- ```s``` consists only of printable ASCII characters.

---

### Two Pointers

```Python
class Solution:
    def isPalindrome(self, s: str) -> bool:
        n = len(s)
        i, j = 0, n - 1

        while i < j:
            while not s[i].lower().isalnum() and i < n - 1:
                i += 1
            while not s[j].lower().isalnum() and j > 1:
                j -= 1

            if s[i].lower() != s[j].lower() and s[i] != '.' and s[j] != '.':
                return False
            
            i += 1; j -= 1
        
        return True
```
