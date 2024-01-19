## [125. Valid Palindrome](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Concepts/Array%20and%20String/Palindrome/125.%20Valid%20Palindrome)

```Python
class Solution:
    def isPalindrome(self, s: str) -> bool:
        word = re.sub('[^a-zA-Z0-9]', '', s).lower()
        return word == word[::-1]
```
