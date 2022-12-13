## 844. Backspace String Compare

#### Difficulty: Easy

Given two strings ```s``` and ```t```, return ```true``` _if they are equal when both are typed into empty text editors_. ```'#'``` means a backspace character.

Note that after backspacing an empty text, the text will continue empty.

![image](https://user-images.githubusercontent.com/35042430/207222201-b28bbf3a-b2dd-45c7-b253-df56b7cab97f.png)

---

__Example 1:__
```
Input: s = "ab#c", t = "ad#c"
Output: true
Explanation: Both s and t become "ac".
```
__Example 2:__
```
Input: s = "ab##", t = "c#d#"
Output: true
Explanation: Both s and t become "".
```
__Example 3:__
```
Input: s = "a#c", t = "b"
Output: false
Explanation: s becomes "c" while t becomes "b".
```
__Constraints:__
```
1 <= s.length, t.length <= 200
s and t only contain lowercase letters and '#' characters.
```
---

### Stack (FIFO)

```Python
class Solution(object):
    def backspaceCompare(self, s, t):
        """
        :type s: str
        :type t: str
        :rtype: bool
        """
        # Stack (FIFO)
        #### Time Complexity: O(N + M), traverse through input s and t
        #### Space Complexity: O(N + M), stacks keep up to the size of s and t 
        def build(string):
            res = list()
            for char in string:
                if char != "#":
                    res.append(char)
                elif res:
                    res.pop()
            return "".join(res)
        return build(s) == build(t)
        """
        def build(string):
            res = list()
            for c in string:
                if c != "#":
                    res.append(c)
                else:
                    if not res:
                        continue
                    else:
                        res.pop()
            return res
        return build(s) == build(t)
        """
```

__Follow up:__ Can you solve it in ```O(n)``` time and ```O(1)``` space?

```Python
class Solution(object):
    def backspaceCompare(self, s, t):
        """
        :type s: str
        :type t: str
        :rtype: bool
        """
        # Follow up: O(n) time and O(1) space
        # Two Pointers
        def get_char(string, length):
            char, skip_count = '', 0
            while length >= 0 and not char:
                # If encounter '#', increment skip_count
                if string[length] == '#':
                    skip_count += 1
                # If current character is not backspace character '#' nor positioned after a backspace character
                elif skip_count == 0:
                    char = string[length]
                # If previous character is backspace '#', decrement skip_count
                else:
                    skip_count  -= 1
                length -= 1
            return char, length
        s1 = len(s) - 1
        t1 = len(t) - 1
        while s1 >= 0 or t1 >= 0:
            c1 = c2 = ''
            if s1 >= 0:
                c1, s1 = get_char(s, s1)
            if t1 >= 0:
                c2, t1 = get_char(t, t1)
            if c1 != c2:
                return False
        return True
        '''
        s = "ab#c"
        t = "ad#c"
        while 3 >= 0 or 3 >= 0:
            s1 = 3 > 0: get_char("ab#c", 3)
                            length = 3 > 0 and char == '':
                                skip_count  == 0:
                                    char = 'c'
                                length = 2
                            return 'c', 2
            t1 = 3 > 0: get_char("ad#c", 3)
                            length = 3 > 0 and char == '':
                                skip_count  == 0:
                                    char = 'c'
                                length = 2
                            return 'c', 2
            c1 == c2
        while 2 >= 0 or 2 >= 0:
            s1 = 2 > 0: get_char("ab#c", 2)
                            length = 2 > 0 and char == '':
                                ad#c[2] == '#':
                                    skip_count  += 1
                                length = 1
                            length = 1 > 0 and char == '':
                                ab#c[1] = 'b' != '#'
                                skip_count = 1 != 0
                                else:
                                    skip_count  -= 1
                            length = 0 == 0 and char == '':
                                ab#c[0] = 'a' != '#'
                                skip_count == 0:
                                    char = 'a'
                                length = -1
                            return 'a', -1
            t1 = 2 > 0: get_char("ad#c", 2)
                            length = 2 > 0 and char == '':
                                ad#c[2] == '#':
                                    skip_count  += 1
                                length = 1
                            length = 1 > 0 and char == '':
                                ad#c[1] = 'd' != '#'
                                skip_count = 1 != 0
                                else:
                                    skip_count  -= 1
                            length = 0 == 0 and char == '':
                                ad#c[0] = 'a' != '#'
                                skip_count == 0:
                                    char = 'a'
                                length = -1
                            return 'a', -1
            c1 == c2            
        while s1 = -1 < 0 or t1 = -1 < 0:
            return True
        '''
```
