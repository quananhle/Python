## 394. Decode String

#### Difficulty: Medium

Given an encoded string, return its decoded string.

The encoding rule is: ```k[encoded_string]```, where the ```encoded_string``` inside the square brackets is being repeated exactly ```k``` times. Note that ```k``` is guaranteed to be a positive integer.

You may assume that the input string is always valid; there are no extra white spaces, square brackets are well-formed, etc. Furthermore, you may assume that the original data does not contain any digits and that digits are only for those repeat numbers, ```k```. For example, there will not be input like ```3a``` or ```2[4]```.

The test cases are generated so that the length of the output will never exceed 10<sup>5</sup>.

![image](https://user-images.githubusercontent.com/35042430/207691113-84ab9337-ec0a-434b-9d2d-5498e7dc59a9.png)

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

```Python
class Solution(object):
    def decodeString(self, s):
        """
        :type s: str
        :rtype: str
        """
        # Regular Expression
        """
        while '[' in s:
            s = re.sub(r'(\d+)\[([a-z]*)\]', lambda x: int(x.group(1)) * (x.group(2)), s)
        return s
        """

        # Stack
        #### Time Complexity: O(N*maxK^countK), where maxK is the maximum length of encoded string, countK is the number of nest k values, all were performed inside the loop of input size N
        #### Space Complexity: O(N*maxK^countK), where maxK is the maximum value of k, countK is the count of nested k values, and n is the maximum length of encoded string.
        """
        stack = list()
        for i in range(len(s)):
            if s[i] != ']':
                stack.append(s[i])
            else:
                decoded_string = ""
                # Check if last element in stack is not ']'
                while stack[-1] != '[':
                    decoded_string += stack.pop()
                # If encounter '['
                stack.pop()
                # Next element in stack should be a number.
                k, base = 0, 1
                while stack and stack[-1].isdigit():
                    # Get the value of the number digit or digits
                    k = k + int(stack.pop()) * base
                    print (k)
                    base *= 10
                while k > 0:
                    for i in range(len(decoded_string)-1, -1, -1):
                        stack.append(decoded_string[i])
                    k -= 1
        return "".join(stack)
        """
    
        # Stack
        """
        stack = list()
        k, curr_string = 0, ""
        for char in s:
            # If char is a number
            if char.isdigit():
                # Increment value of k by 10 times for every digit after the first digit
                k = k*10 + int(char)
            elif char == '[':
                # Remember current string and current k
                stack.append(curr_string)
                stack.append(k)
                # Reset the current string and current k
                k, curr_string = 0, ""
            elif char == ']':
                num = stack.pop()
                curr_string = stack.pop() + num*curr_string
            # If char is the encoded string inside the square bracket
            else:
                curr_string += char
        return curr_string
        """

        # Two Stacks
        """
        str_stack, cnt_stack = list(), list()
        k, curr_string = 0, ""
        for char in s:
            if char.isdigit():
                k = k*10 + int(char)
            elif char == '[':
                cnt_stack.append(k)
                str_stack.append(curr_string)
                k, curr_string = 0, ""
            elif char == ']':
                num = cnt_stack.pop()
                curr_string = str_stack.pop() + num*curr_string
            else:
                curr_string += char
        return curr_string
        """

```
