## [125. Valid Palindrome](https://leetcode.com/problems/valid-palindrome)

```Tag```: ```Two Pointers``` ```Regular Expression```

#### Difficulty: Easy

A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.

Given a string ```s```, return _```True``` if it is a palindrome, or ```False``` otherwise_.

![image](https://github.com/quananhle/Python/assets/35042430/07a7132f-18ba-4be4-b831-0c980ebb287f)

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

### Reverse

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(n)$
- __Space Complexity__: $\mathcal{O}(n)$

```Python
class Solution:
    def isPalindrome(self, s: str) -> bool:
        filter_chars = filter(lambda c: c.isalnum(), s)
        lowercase = map(lambda c: c.lower(), filter_chars)

        filtered_chars_list = list(lowercase)
        reversed_chars_list = filtered_chars_list[::-1]

        return filtered_chars_list == reversed_chars_list
```

```Python
class Solution:
    def isPalindrome(self, s: str) -> bool:
        word = [c for c in s.lower() if c.isalnum()]
        return word == word[::-1]
```

### Two Pointers

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(n)$
- __Space Complexity__: $\mathcal{O}(1)$

```Python
class Solution:
    def isPalindrome(self, s: str) -> bool:
        n = len(s)
        i, j = 0, n - 1

        while i < j:
            while not s[i].isalnum() and i < n - 1:
                i += 1
            while not s[j].isalnum() and j > 1:
                j -= 1

            if s[i].lower() != s[j].lower() and s[i] != '.' and s[j] != '.':
                return False
            
            i += 1; j -= 1
        
        return True
```

```Python
class Solution:
    def isPalindrome(self, s: str) -> bool:
        n = len(s)
        left, right = 0, n - 1

        while left < right:
            if not s[left].isalnum():
                left += 1
                continue
            
            if not s[right].isalnum():
                right -= 1
                continue
            
            if s[left].lower() != s[right].lower():
                return False
            
            left += 1
            right -= 1
        
        return True
```

---

### Regular Expression

```Python
class Solution:
    def isPalindrome(self, s: str) -> bool:
        s = re.sub('[^a-zA-Z0-9]', '', s).lower()
        return s == s[::-1]
```

#### One Liner

```Python
class Solution:
    def isPalindrome(self, s: str) -> bool:
        return re.sub('[^a-zA-Z0-9]', '', s).lower() == re.sub('[^a-zA-Z0-9]', '', s).lower()[::-1]
```
