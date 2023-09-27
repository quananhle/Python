## [880. Decoded String at Index](https://leetcode.com/problems/decoded-string-at-index)

```Tag```: ```Stack``` ```Math``` ```Array & String```

#### Difficulty: Medium

You are given an encoded string s. To decode the string to a tape, the encoded string is read one character at a time and the following steps are taken:

If the character read is a letter, that letter is written onto the tape.
If the character read is a digit d, the entire current tape is repeatedly written d - 1 more times in total.
Given an integer k, return the kth letter (1-indexed) in the decoded string.

![image](https://github.com/quananhle/Python/assets/35042430/2ec4bfbf-6904-4a77-aca9-95baf2bdfafc)

---

__Example 1:__
```
Input: s = "leet2code3", k = 10
Output: "o"
Explanation: The decoded string is "leetleetcodeleetleetcodeleetleetcode".
The 10th letter in the string is "o".
```

__Example 2:__
```
Input: s = "ha22", k = 5
Output: "h"
Explanation: The decoded string is "hahahaha".
The 5th letter is "h".
```

__Example 3:__
```
Input: s = "a2345678999999999999999", k = 1
Output: "a"
Explanation: The decoded string is "a" repeated 8301530446056247680 times.
The 1st letter is "a".
```

__Constraints:__

- $2 \le s.length \le 100$
- ```s``` consists of lowercase English letters and digits ```2``` through ```9```.

---

### Stack (Memory Limit Exceeded)

```Python
class Solution:
    def decodeAtIndex(self, s: str, k: int) -> str:
        # Memory Limit Exceeded
        stack = list()
        decoded_string = ""
        for i, c in enumerate(s):
            if c.isalpha():
                stack.append(c)
            else:
                curr = list()
                while stack:
                    curr.append(stack.pop())
                curr_str = "".join(curr[::-1])
                if not decoded_string:
                    decoded_string = curr_str * int(c)
                else:
                    decoded_string = (decoded_string + curr_str) * int(c)

        return decoded_string[k - 1]
```

### Math


### Intuition

If we have a decoded string like ```appleappleappleappleappleapple``` (```length = 30```) and an index like ```K = 24```, the answer is the same as if ```K = 4```.

In general, when a decoded string is equal to some word with ```size``` length repeated some number of times (such as ```apple``` with ```size = 5``` repeated 6 times), the answer is the same for the index ```K``` as it is for the index ```K % size```.

We can use this insight by working backwards, keeping track of the ```size``` of the decoded string. Whenever the decoded string would equal some word repeated ```d``` times, we can reduce ```K``` to ```K % (word.length)```.

```Python
class Solution:
    def decodeAtIndex(self, s: str, k: int) -> str:
        size = 0
        for c in s:
            if c.isalpha():
                size += 1
            else:
                size *= int(c)

        # Traverse the string from backward as it is always ended with a digit
        for c in reversed(s):
            '''
            Normalize size by modding size by k
                - if k > size: k = k - (k // size * k)
                - if k == size: k = 0
                - if k < size: k = k
            '''
            k %= size
            # Check if k == 0 and c is a character, return the character as answer is found
            if k == 0 and c.isalpha():
                return c
            # Check if c is a digit for any k
            elif c.isdigit():
                # Reduce size by digit
                size /= int(c)
            # Otherwise, decrement size
            else:
                size -= 1

```
