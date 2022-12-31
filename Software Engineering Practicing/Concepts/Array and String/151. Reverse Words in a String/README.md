## 151. Reverse Words in a String


#### Difficulty: Medium

Given an input string ```s```, reverse the order of the words.

A word is defined as a sequence of non-space characters. The words in ```s``` will be separated by at least one space.

Return _a string of the words in reverse order concatenated by a single space_.

Note that ```s``` may contain leading or trailing spaces or multiple spaces between two words. The returned string should only have a single space separating the words. Do not include any extra spaces.

![image](https://user-images.githubusercontent.com/35042430/210085423-e6f70ea0-15c1-490e-8682-334f79d2a126.png)

---

__Example 1:__
```
Input: s = "the sky is blue"
Output: "blue is sky the"
```

__Example 2:__
```
Input: s = "  hello world  "
Output: "world hello"
Explanation: Your reversed string should not contain leading or trailing spaces.
```

__Example 3:__
```
Input: s = "a good   example"
Output: "example good a"
Explanation: You need to reduce multiple spaces between two words to a single space in the reversed string.
```

__Constraints:__
```
1 <= s.length <= 104
s contains English letters (upper-case and lower-case), digits, and spaces ' '.
There is at least one word in s.
```

---

```Python
class Solution:
    def reverseWords(self, s: str) -> str:
        res = s.split(' ')
        res = [word for word in res[::-1] if word != '']       
        return ' '.join(res)
```

```Python
class Solution:
    def reverseWords(self, s: str) -> str:
        def split_and_trim_spaces(s):
            output = list()
            # Remove leading spaces
            while s[0] == ' ':
                s = s[1:] 
            # Remove trailing spaces
            while s[-1] == ' ':
                s = s[:len(s)-1]
            # Remove excessive spaces
            for word in s:
                if word != ' ':
                    output.append(word)
                elif output[-1] != ' ':
                    output.append(word)
            return output

        def reverse_str(arr, start, end):
            # Reverse element in an array in-place
            while start < end:
                arr[start], arr[end] = arr[end], arr[start]
                start += 1
                end -= 1
            return arr
            # return arr[::-1]
        
        def reverse_each_word(arr):
            slow, fast = 0, 0
            while fast < len(arr):
                if arr[fast] == ' ':
                    arr[slow:fast] = arr[slow:fast][::-1]
                    slow = fast + 1
                fast += 1
                if fast == len(arr):
                    arr[slow:] = arr[slow:][::-1]
            return arr
        
        ans = split_and_trim_spaces(s)
        ans = reverse_str(ans, 0, len(ans)-1)
        ans = reverse_each_word(ans)
        return ''.join(ans)
```
