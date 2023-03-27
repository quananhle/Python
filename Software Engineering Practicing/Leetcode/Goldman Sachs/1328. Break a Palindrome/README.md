## [1328. Break a Palindrome](https://leetcode.com/problems/break-a-palindrome/)

```Tag```: ```Greedy```

#### Difficulty: Medium

Given a palindromic string of lowercase English letters ```palindrome```, replace __exactly one__ character with any lowercase English letter so that the resulting string is __not__ a palindrome and that it is the __lexicographically smallest__ one possible.

Return _the resulting string. If there is no way to replace a character to make it not a palindrome, return an __empty string___.

A string ```a``` is lexicographically smaller than a string ```b``` (of the same length) if in the first position where ```a``` and ```b``` differ, ```a``` has a character strictly smaller than the corresponding character in ```b```. For example, ```"abcc"``` is lexicographically smaller than ```"abcd"``` because the first position they differ is at the fourth character, and ```'c'``` is smaller than ```'d'```.

![image](https://user-images.githubusercontent.com/35042430/228003149-f71b460e-dbb2-402c-ae37-4e59eac40b60.png)

---

__Example 1:__
```
Input: palindrome = "abccba"
Output: "aaccba"
Explanation: There are many ways to make "abccba" not a palindrome, such as "zbccba", "aaccba", and "abacba".
Of all the ways, "aaccba" is the lexicographically smallest.
```

__Example 2:__
```
Input: palindrome = "a"
Output: ""
Explanation: There is no way to replace a single character to make "a" not a palindrome, so return an empty string.
```

__Constraints:__

- ```1 <= palindrome.length <= 1000```
- ```palindrome``` consists of only lowercase English letters.

---

### Greedy

The given string is a non-empty palindrome and has an even length
![image](https://leetcode.com/problems/break-a-palindrome/Figures/1328/1328A.png)

The given string is a non-empty palindrome and has an odd length
![image](https://leetcode.com/problems/break-a-palindrome/Figures/1328/1328B.png)

__Algorithm__

1. If the length of the string is ```1```, return an empty string since we cannot create a non-palindromic string in this case.
2. Iterate over the string from left to the middle of the string: if the character is not ```'a'```, change it to ```'a'``` and return the string.
3. If we traversed over the whole left part of the string and still haven't got a non-palindromic string, it means the string has only ```a```'s. Hence, change the last character to ```'b'``` and return the obtained string.

```Python
class Solution:
    def breakPalindrome(self, palindrome: str) -> str:
        if len(palindrome) == 1:                # 'a' -> ""
            return ""

        array = [ch for ch in palindrome]
        
        for i in range(len(array) // 2):
            if array[i] != 'a':
                array[i] = 'a'
                return "".join(array)
        
        array[-1] = 'b'
        return "".join(array)                   # "aa" -> "ab"
```

```Python
class Solution:
    def breakPalindrome(self, palindrome: str) -> str:
        if len(palindrome) == 1:                # 'a' -> ""
            return ""
        
        for i in range(len(palindrome) // 2):
            if palindrome[i] != 'a':
                return palindrome[:i] + 'a' + palindrome[i+1:]
        
        return palindrome[:-1] + 'b'            # "aa" -> "ab"
```
