## [345. Reverse Vowels of a String](https://leetcode.com/problems/reverse-vowels-of-a-string)

#### Difficulty: Easy

```
Given a string s, reverse only all the vowels in the string and return it.

The vowels are 'a', 'e', 'i', 'o', and 'u', and they can appear in both lower and upper cases, more than once.
```

#### Example 1:

```
Input: s = "hello"
Output: "holle"
```

#### Example 2:

```
Input: s = "leetcode"
Output: "leotcede"
```

#### Constraints:

```
1 <= s.length <= 3 * 105
s consist of printable ASCII characters.
```

### Two Pointers

```Python
class Solution(object):
    def reverseVowels(self, s):
        """
        :type s: str
        :rtype: str
        """
        dictionary = {'a','i','e','o','u','A','I','E','O','U'}
        left = 0
        right = len(s)-1
        lst = list(s)
        while left < right:
            if lst[left] in dictionary and lst[right] in dictionary:
                lst[left], lst[right] = lst[right], lst[left]
                left += 1
                right -= 1
            elif lst[left] in dictionary and lst[right] not in dictionary:
                right -= 1
            elif lst[left] not in dictionary and lst[right] in dictionary:
                left += 1
            else:
                left += 1
                right -= 1
        return ''.join(lst)
        # Time complexity: O(N)
        # Space complexity: O(1)
```                
