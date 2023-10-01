## [557. Reverse Words in a String III](https://leetcode.com/problems/reverse-words-in-a-string-iii)

```Tag```: ```Array``` ```String``` ```Two Pointers```

#### Difficulty: Easy

Given a string ```s```, reverse the order of characters in each word within a sentence while still preserving whitespace and initial word order.

![image](https://user-images.githubusercontent.com/35042430/210122621-68108bf8-429d-45a1-a5ae-e7e490b5e637.png)

![image](https://github.com/quananhle/Python/assets/35042430/1c2ca7b5-5a7a-40d1-8acc-4afa931c45df)

---

__Example 1:__
```
Input: s = "Let's take LeetCode contest"
Output: "s'teL ekat edoCteeL tsetnoc"
```

__Example 2:__
```
Input: s = "God Ding"
Output: "doG gniD"
```

__Constraints:__

- $1 \le s.length \le 5 * 10^4$
- ```s``` contains printable ASCII characters.
- ```s``` does not contain any leading or trailing spaces.
- There is at least one word in ```s```.
- All the words in ```s``` are separated by a single space.

---

### Pythonic

```Python
class Solution:
    def reverseWords(self, s: str) -> str:
        words = s.split(" ")
        res = list()
        for word in words:
            res.append(word[::-1])

        return " ".join(res)
```

#### One Liner

```Python
class Solution:
    def reverseWords(self, s: str) -> str:
        return " ".join([word[::-1] for word in s.split()])
```

### In-Place Reverse

In Python, string is mutable; hence, in-place reverse in Python requires extra space to convert string to a list and rebuild list to a string later on.

```Python
class Solution:
    def reverseWords(self, s: str) -> str:
        def flip_word(left: int, right: int):
            while left < right:
                res[left], res[right] = res[right], res[left]
                left += 1
                right -= 1
        
        n = len(s)
        res = list(s)
        start = 0
        
        for end, c in enumerate(s):
            if c == " ":
                flip_word(start, end - 1)
                start = end + 1
        
        # Flip the last word in the input
        flip_word(start, n - 1)
        
        return "".join(res)
```

```Python
class Solution:
    def reverseWords(self, s: str) -> str:
        def flip(lo, hi):
            while lo < hi:
                res[lo], res[hi] = res[hi], res[lo]
                lo += 1; hi -= 1

        start = 0
        res = list(s)
        n = len(s)
        for end, char in enumerate(s):
            if char == " ":
                flip(start, end - 1)
                start = end + 1
            if end == n - 1:
                flip(start, n - 1)

        return "".join(res)
```

### Fast and Slow Pointers

```Python
class Solution:
    def reverseWords(self, s: str) -> str:
        res = [letter for letter in s]
        slow, fast = 0, 1
        while fast < len(res):
            if res[fast] == ' ':
                res[slow:fast] = res[slow:fast][::-1]
                slow = fast + 1
            fast += 1
            if fast == len(res):
                res[slow:] = s[slow:][::-1]
        return ''.join(res)
```

```Python
class Solution:
    def reverseWords(self, s: str) -> str:
        res = [c for c in s]
        n = len(res)
        start, end = 0, 1

        while end < n:
            if res[end] == ' ':
                res[start:end] = res[start:end][::-1]
                start = end + 1
            end += 1
            if end == n:
                res[start:] = s[start:][::-1]

        return ''.join(res)
```

```Python
class Solution:
    def reverseWords(self, s: str) -> str:
        start = 0
        res = list()
        n = len(s)
        for end, char in enumerate(s):
            if char == " ":
                res.append(s[start:end][::-1])
                start = end + 1
            if end == n - 1:
                res.append(s[start:end + 1][::-1])
            
        return " ".join(res)
```
