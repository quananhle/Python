## [245. Shortest Word Distance III](https://leetcode.com/problems/shortest-word-distance-iii/)

```Tag```: ```Two Pointers```

#### Difficulty: Medium

Given an array of strings ```wordsDict``` and two strings that already exist in the array ```word1``` and ```word2```, return _the shortest distance between the occurrence of these two words in the list_.

Note that ```word1``` and ```word2``` may be the same. It is guaranteed that they represent two individual words in the list.

![image](https://user-images.githubusercontent.com/35042430/229265737-b0aec0f3-2b4c-45e8-a545-79b6c1ee43bc.png)

---
 
__Example 1:__

```
Input: wordsDict = ["practice", "makes", "perfect", "coding", "makes"], word1 = "makes", word2 = "coding"
Output: 1
```

__Example 2:__
```
Input: wordsDict = ["practice", "makes", "perfect", "coding", "makes"], word1 = "makes", word2 = "makes"
Output: 3
```

__Constraints:__

- ```1 <= wordsDict.length <= 10^5```
- ```1 <= wordsDict[i].length <= 10```
- ```wordsDict[i]``` consists of lowercase English letters.
- ```word1``` and ```word2``` are in wordsDict.

---

### Two Pointers

```Python
class Solution:
    def shortestWordDistance(self, wordsDict: List[str], word1: str, word2: str) -> int:
        # Two Pointer
        n = len(wordsDict)
        ans = n
        w1 = w2 = -1

        for i in range(n):
            # Check if word1 is found
            if wordsDict[i] == word1:
                # Get the index position of word1 in wordsDict
                w1 = i
                # Check if index position of word2 is already found before
                if w2 != -1:
                    ans = min(ans, w1 - w2)
            # Check if word2 is found
            if wordsDict[i] == word2:
                # Get the index position of word2 in wordsDict
                w2 = i
                # Check if index position of word1 is already found before and w1 and w2 are not the same element in wordsDict
                if w1 != -1 and w1 != w2:
                    ans = min(ans, w2 - w1)
        return ans
```
