## 290. Word Pattern

```Tag```: ```Hash Table```

#### Difficulty: Easy

Given a ```pattern``` and a string ```s```, find if ```s``` follows the same pattern.

Here follow means a full match, such that there is a bijection between a letter in ```pattern``` and a __non-empty word__ in ```s```.

![image](https://user-images.githubusercontent.com/35042430/210159951-cc40092f-47b0-4c27-8cba-cd57f47c412c.png)

---

__Example 1:__

```
Input: pattern = "abba", s = "dog cat cat dog"
Output: true
```

__Example 2:__

```
Input: pattern = "abba", s = "dog cat cat fish"
Output: false
```

__Example 3:__

```
Input: pattern = "aaaa", s = "dog cat cat dog"
Output: false
```


__Example 4:__

```
Input: pattern = "abba", s = "dog dog dog dog"
Output: false
```

__Constraints:__

```
1 <= pattern.length <= 300
pattern contains only lower-case English letters.
1 <= s.length <= 3000
s contains only lowercase English letters and spaces ' '.
s does not contain any leading or trailing spaces.
All the words in s are separated by a single space.
```

---

### Two Hash Tables

```Python
class Solution:
    def wordPattern(self, pattern: str, s: str) -> bool:
        '''
        str_lst = s.split(' ')
        '''
        left = 0
        str_lst = list()
        for right in range(len(s)):
            if s[right] == ' ':
                str_lst.append(s[left:right])
                left = right + 1
            elif right == len(s)-1:
                str_lst.append(s[left:right+1])
                
        if len(pattern) != len(str_lst):
            return False
            
        p_memo, s_memo = dict(), dict()
        for key, val in zip(pattern, str_lst):
            if not key in p_memo:
                # To handle the case pattern = "abba", s = "dog dog dog dog"
                if val in s_memo:
                    return False
                else:
                    p_memo[key] = val
                    # To handle the case pattern = "abba", s = "dog dog dog dog"
                    s_memo[val] = key
            else:
                if p_memo[key] != val:
                    return False
        return True
```

### Single Index Hash Map

```Python
class Solution:
    def wordPattern(self, pattern: str, s: str) -> bool:
        memo = dict()
        words = s.split(' ')

        if len(pattern) != len(words):
            return False

        for i in range(len(pattern)):
            char = pattern[i]
            word = words[i]

            # To differentiate the letter from pattern and word from s
            char_key = 'c_{}'.format(char)
            word_key = 'w_{}'.format(word)
            
            if not char_key in memo:
                memo[char_key] = i
            
            if not word_key in memo:
                memo[word_key] = i

            if memo[char_key] != memo[word_key]:
                return False
        
        return True
```

### Frequency Counter

```Python

```
