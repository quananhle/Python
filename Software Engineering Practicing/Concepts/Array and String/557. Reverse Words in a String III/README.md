## 557. Reverse Words in a String III

```Tag```: ```Array``` ```String``` ```Two Pointers```

#### Difficulty: Easy

Given a string ```s```, reverse the order of characters in each word within a sentence while still preserving whitespace and initial word order.

![image](https://user-images.githubusercontent.com/35042430/210122621-68108bf8-429d-45a1-a5ae-e7e490b5e637.png)

---

__Example 1:__
```
Input: s = "Let's take LeetCode contest"
Output: "s'teL ekat edoCteeL tsetnoc"
```

__Example 2:__
```
Input: s = "God Ding"
Output: "doG gniD"
```

__Constraints:__
```
1 <= s.length <= 5 * 104
s contains printable ASCII characters.
s does not contain any leading or trailing spaces.
There is at least one word in s.
All the words in s are separated by a single space.
```

---

### One Liner

```Python
class Solution:
    def reverseWords(self, s: str) -> str:
        return " ".join([word[::-1] for word in s.split()])
```

### Fast and Slow Pointers

```Python
class Solution:
    def reverseWords(self, s: str) -> str:
        res = [letter for letter in s]
        slow, fast = 0, 1
        while fast < len(res):
            if res[fast] == ' ':
                res[slow:fast] = res[slow:fast][::-1]
                slow = fast + 1
            fast += 1
            if fast == len(res):
                res[slow:] = s[slow:][::-1]
        return ''.join(res)
```
