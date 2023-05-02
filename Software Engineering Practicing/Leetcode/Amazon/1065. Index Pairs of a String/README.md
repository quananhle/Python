## [1065. Index Pairs of a String](https://leetcode.com/problems/index-pairs-of-a-string/)

```Tag```: ```Sliding Window``` ```Hash Set``` ```Trie```

#### Difficulty: Easy

Given a string ```text``` and an array of strings ```words```, return _an array of all index pairs ```[i, j]``` so that the substring ```text[i...j]``` is in ```words```_.

Return the pairs ```[i, j]``` in __sorted order__ (i.e., sort them by their first coordinate, and in case of ties sort them by their second coordinate).

![image](https://user-images.githubusercontent.com/35042430/235569431-d24c9a39-9e06-408e-a3e7-7574ff3e9231.png)

---

__Example 1:__
```
Input: text = "thestoryofleetcodeandme", words = ["story","fleet","leetcode"]
Output: [[3,7],[9,13],[10,17]]
```

__Example 2:__
```
Input: text = "ababa", words = ["aba","ab"]
Output: [[0,1],[0,2],[2,3],[2,4]]
Explanation: Notice that matches can overlap, see "aba" is found in [0,2] and [2,4].
```

__Constraints:__

- ```1 <= text.length <= 100```
- ```1 <= words.length <= 20```
- ```1 <= words[i].length <= 50```
- ```text``` and ```words[i]``` consist of lowercase English letters.
- All the strings of ```words``` are unique.

---

### ✅ Sliding Window

```Python
class Solution:
    def indexPairs(self, text: str, words: List[str]) -> List[List[int]]:
        n = len(text)
        words = set(words)
        lengths = set(len(word) for word in words)
        res = []

        for window in lengths:
            for start in range(n - window + 1):
                if text[start:start + window] in words:
                    res.append([start, start + window - 1])

        return sorted(res)
```

### Hash Set

```Python
class Solution:
    def indexPairs(self, text: str, words: List[str]) -> List[List[int]]:
        words = set(words)
        res = list()
        n = len(text)

        for start in range(n):
            for end in range(start, n):
                if text[start:end + 1] in words:
                    res.append([start, end])
        
        return res
```

### Trie

```Python

```
 
