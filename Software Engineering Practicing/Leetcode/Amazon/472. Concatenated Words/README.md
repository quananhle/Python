## 472. Concatenated Words

```Tag```: ```Recursion``` ```Dynamic Programming```

#### Difficulty: Hard

Given an array of strings ```words``` (__without duplicates__), return _all the __concatenated words__ in the given list of ```words```_.

A __concatenated word__ is defined as a string that is comprised entirely of at least two shorter words in the given array.

![image](https://user-images.githubusercontent.com/35042430/215008109-022ba1e7-dc28-48da-8431-07b253dc603e.png)

---

__Example 1:__
```
Input: words = ["cat","cats","catsdogcats","dog","dogcatsdog","hippopotamuses","rat","ratcatdogcat"]
Output: ["catsdogcats","dogcatsdog","ratcatdogcat"]
Explanation: "catsdogcats" can be concatenated by "cats", "dog" and "cats"; 
"dogcatsdog" can be concatenated by "dog", "cats" and "dog"; 
"ratcatdogcat" can be concatenated by "rat", "cat", "dog" and "cat".
```

__Example 2:__
```
Input: words = ["cat","dog","catdog"]
Output: ["catdog"]
```

__Constraints:__

- 1 <= words.length <= 10<sup>4</sup>
- ```1 <= words[i].length <= 30```
- ```words[i]``` consists of only lowercase English letters.
- All the strings of ```words``` are unique.
- 1 <= sum(words[i].length) <= 10<sup>5</sup>

---

### Recursion

```Python
class Solution:
    def findAllConcatenatedWordsInADict(self, words: List[str]) -> List[str]:
        string = set()
        res = list()

        def check_concatenate(word, string):
            for i in range(1, len(word)):
                prefix = word[:i]
                suffix = word[i:]
                if prefix in string and (suffix in string or check_concatenate(suffix, string)):
                    return True
            return False
        
        for word in words:
            string.add(word)
        for word in words:
            if check_concatenate(word, string):
                res.append(word)
        return res
```
