## 394. Decode String

```Tag```: ```String``` ```Stack``` ```Recursion```

#### Difficulty: Medium

Given an encoded string, return its decoded string.

The encoding rule is: ```k[encoded_string]```, where the ```encoded_string``` inside the square brackets is being repeated exactly ```k``` times. Note that ```k``` is guaranteed to be a positive integer.

You may assume that the input string is always valid; there are no extra white spaces, square brackets are well-formed, etc. Furthermore, you may assume that the original data does not contain any digits and that digits are only for those repeat numbers, ```k```, For example, there will not be input like ```3a``` or ```2[4]```.

The test cases are generated so that the length of the output will never exceed 10<sup>5</sup>.

![image](https://user-images.githubusercontent.com/35042430/209366653-b0f30fb7-6161-4992-88ac-e7b059c2acbe.png)

---

__Example 1:__
```
Input: s = "3[a]2[bc]"
Output: "aaabcbc"
```

__Example 2:__
```
Input: s = "3[a2[c]]"
Output: "accaccacc"
```

__Example 3:__
```
Input: s = "2[abc]3[cd]ef"
Output: "abcabccdcdcdef"
```

__Constraints:__
```
1 <= s.length <= 30
s consists of lowercase English letters, digits, and square brackets '[]'.
s is guaranteed to be a valid input.
All the integers in s are in the range [1, 300].
```

---

### Stack
#### Time Complexity: O(maxK<sup>countK</sup> * n), where maxK is the maximum value of ```k```, countK is the count of nested ```k``` values and ```n``` is the maximum length of encoded string. 
#### Space Complexity: O(sum(maxK<sup>countK</sup> * n)), where maxK is the maximum value of ```k```, countK is the count of nested ```k``` values and ```n``` is the maximum length of encoded string.

```Python
class Solution:
    def decodeString(self, s: str) -> str:
        digit_stack = list()
        for i in range(len(s)):
            # Check if encounter "]"
            if s[i] == "]":
                # Check if stack is not empty
                if digit_stack:
                    str_lst, num_lst = list(), list()
                    tmp_lst, tmp_num = "", ""

                    # Loop until encounter a digit character
                    while not digit_stack[-1].isdigit():
                        # Ignore "["
                        if digit_stack[-1] == "[":
                            digit_stack.pop()
                        # Get every non digit character
                        else:
                            str_lst.append(digit_stack.pop())

                    # Check if encounter a digit character, loop to get the every digit character
                    while digit_stack and digit_stack[-1].isdigit():
                        num_lst.append(digit_stack.pop())

                    # Get the right order of character and number
                    while num_lst:   
                        tmp_num += num_lst.pop()
                    while str_lst:
                        tmp_lst += str_lst.pop()

                    # Rebuild the stack
                    for _ in range(int(tmp_num)):
                        for k in range(len(tmp_lst)):
                            digit_stack.append(tmp_lst[k])

            # Build stack up to "]" in string
            else:
                digit_stack.append(s[i])
                
        return "".join(digit_stack)
```

### 2 Stacks
#### Time Complexity: O(maxK * n), where maxK is the maximum value of ```k``` and ```n``` is the length of a given string ```s```
#### Space Complexity: O(N + M), N is the number of ```digits(0-9)``` in string ```s``` and M is the number of ```letters(a-z)``` and ```n```

![image](https://leetcode.com/problems/decode-string/solutions/858759/Figures/394/twoStack_diagram.png)

```Python
class Solution:
    def decodeString(self, s: str) -> str:
        num_stack, str_stack = list(), list()
        k, decoded_str = 0, ""
        for ch in s:
            # Input string is always valid => string pattern is guaranteed to be num k + open bracket + encoded string + closed bracket/repeated encoded string
            # First, check if encountered k digit
            if ch.isdigit():
                k = k * 10 + int(ch)
            # Next, check if encountered open bracket
            elif ch == "[":
                num_stack.append(k)
                str_stack.append(decoded_str)
                k, decoded_str = 0, ""
            # Check if encountered closed bracket
            elif ch == "]":
                num = num_stack.pop()
                decoded_str = str_stack.pop() + num * decoded_str
            # Encountered encoded string
            else:
                decoded_str += ch
        return decoded_str
```

### Recursion

```Python

```
