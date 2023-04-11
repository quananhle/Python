## [2390. Removing Stars From a String](https://leetcode.com/problems/removing-stars-from-a-string)

```Tag```: ```Stack```

#### Difficulty: Medium

You are given a string ```s```, which contains stars ```*```.

In one operation, you can:

- Choose a star in ```s```.
- Remove the closest __non-star__ character to its __left__, as well as remove the star itself.

Return _the string after __all__ stars have been removed_.

__Note:__

- The input will be generated such that the operation is always possible.
- It can be shown that the resulting string will always be unique.

![image](https://user-images.githubusercontent.com/35042430/231214607-1f579667-1492-4ce5-95f0-e849a107942f.png)

---

__Example 1:__
```
Input: s = "leet**cod*e"
Output: "lecoe"
Explanation: Performing the removals from left to right:
- The closest character to the 1st star is 't' in "leet**cod*e". s becomes "lee*cod*e".
- The closest character to the 2nd star is 'e' in "lee*cod*e". s becomes "lecod*e".
- The closest character to the 3rd star is 'd' in "lecod*e". s becomes "lecoe".
There are no more stars, so we return "lecoe".
```

__Example 2:__
```
Input: s = "erase*****"
Output: ""
Explanation: The entire string is removed, so we return an empty string.
```

__Constraints:__

- ```1 <= s.length <= 10```<sup>```5```</sup>
- ```s``` consists of lowercase English letters and stars ```*```.
- The operation above can be performed on ```s```.

---

### Stack

```Python
class Solution:
    def removeStars(self, s: str) -> str:
        stack = list()
        for c in s:
            if c == '*':
                if stack:
                    stack.pop()
                continue
            stack.append(c)
        
        return ''.join(stack)
```
