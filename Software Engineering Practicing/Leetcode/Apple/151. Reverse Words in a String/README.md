## [151. Reverse Words in a String](https://leetcode.com/problems/reverse-words-in-a-string)

```Tag```: ```Two Pointers```

#### Difficulty: Medium

Given an input string ```s```, reverse the order of the __words__.

A __word__ is defined as a sequence of non-space characters. The __words__ in ```s``` will be separated by at least one space.

Return _a string of the words in reverse order concatenated by a single space_.

Note that ```s``` may contain leading or trailing spaces or multiple spaces between two words. The returned string should only have a single space separating the words. Do not include any extra spaces.

![image](https://github.com/quananhle/Python/assets/35042430/181568e7-e299-4f31-af5b-cfc17408caf9)

---

#### Example 1:
```
Input: s = "the sky is blue"
Output: "blue is sky the"
```

#### Example 2:
```
Input: s = "  hello world  "
Output: "world hello"
Explanation: Your reversed string should not contain leading or trailing spaces.
```

#### Example 3:
```
Input: s = "a good   example"
Output: "example good a"
Explanation: You need to reduce multiple spaces between two words to a single space in the reversed string.
```

#### Constraints:

- ```1 <= s.length <= 10^4```
- ```s``` contains English letters (upper-case and lower-case), digits, and spaces ```' '```.
- There is at least one word in ```s```.

__Follow-up:__ If the string data type is mutable in your language, can you solve it in-place with ```O(1)``` extra space?

---

![image](https://leetcode.com/problems/reverse-words-in-a-string/Figures/151/reverse_whole2.png)

```Python
class Solution(object):
    def trimSpace(self, s):
        stack = list()
        for i in range(len(s)):
            stack.append(s[i])
        # remove leading space
        while stack[0] == ' ':
            stack = stack[1:]
        # remove trailing space
        while stack[-1] == ' ':
            stack = stack[:-1]
        output = list()
        # remove excessive spaces
        for i in range(len(stack)):
            if stack[i] != ' ':
                output.append(stack[i])
            elif output[-1] != ' ':
                output.append(stack[i])
        return output
    
    def reverse(self, s):
        return s[::-1]
    
    def reverse_each_word(self, l):
        slow = fast = 0
        while fast < len(l):
            if l[fast] == ' ':
                l[slow:fast] = l[slow:fast][::-1]
                slow = fast + 1
            fast += 1
            if fast == len(l):
                l[slow::] = l[slow::][::-1]          
        return l

    def reverseWords(self, s):
        """
        :type s: str
        :rtype: str
        """
        output = self.trimSpace(s)
        output = self.reverse(output)
        output = self.reverse_each_word(output)
        return "".join(output)
```

```Python
class Solution:
    def reverseWords(self, s: str) -> str:

        def trim_space(string):
            arr = list()
            while string[0] == ' ':
                string = string[1:]
            while string[-1] == ' ':
                string = string[:-1]
            for c in string:
                if c != ' ' or (arr and arr[-1] != ' '):
                    arr.append(c)

            return arr

        def reverse_sentence(arr):
            i, j = 0, len(arr) - 1

            while i < j:
                arr[i], arr[j] = arr[j], arr[i]
                i += 1
                j -= 1

            return arr

        def reverse_word(arr):
            slow = fast = 0

            while fast < len(arr):
                if arr[fast] == ' ':
                    arr[slow:fast] = arr[slow:fast][::-1]
                    slow = fast + 1
                fast += 1
                if fast == len(arr):
                    arr[slow:fast] = arr[slow:fast][::-1]

            return arr

        return "".join(reverse_word(reverse_sentence(trim_space(s))))
```
