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

__Follow-up__: If the string data type is mutable in your language, can you solve it in-place with __O(1)__ extra space?
