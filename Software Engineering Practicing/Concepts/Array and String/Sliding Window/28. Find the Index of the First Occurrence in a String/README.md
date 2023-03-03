## [28. Find the Index of the First Occurrence in a String](https://leetcode.com/problems/find-the-index-of-the-first-occurrence-in-a-string/)

```Tag```: [```Sliding Window```](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Concepts/Array%20and%20String/Sliding%20Window/28.%20Find%20the%20Index%20of%20the%20First%20Occurrence%20in%20a%20String) ```Hash Map``` ```Math``` [```Rabin-Karp Algorithm```](https://github.com/quananhle/Python/blob/main/Software%20Engineering%20Practicing/Concepts/Algorithms/String%20Matching/28.%20Find%20the%20Index%20of%20the%20First%20Occurrence%20in%20a%20String/README.md#rabin-karp-algorithm-single-hash) [```Knuth–Morris–Pratt Algorithm```](https://github.com/quananhle/Python/blob/main/Software%20Engineering%20Practicing/Concepts/Algorithms/String%20Matching/28.%20Find%20the%20Index%20of%20the%20First%20Occurrence%20in%20a%20String/README.md#knuthmorrispratt-algorithm)

#### Difficulty: Medium

Given two strings ```needle``` and ```haystack```, return _the index of the first occurrence of ```needle``` in ```haystack```, or ```-1``` if ```needle``` is not part of ```haystack```_.

![image](https://user-images.githubusercontent.com/35042430/222788137-44259d39-b2b5-4358-9d37-098a06c229fb.png)

---

__Example 1:__
```
Input: haystack = "sadbutsad", needle = "sad"
Output: 0
Explanation: "sad" occurs at index 0 and 6.
The first occurrence is at index 0, so we return 0.
```

__Example 2:__
```
Input: haystack = "leetcode", needle = "leeto"
Output: -1
Explanation: "leeto" did not occur in "leetcode", so we return -1.
```

__Constraints:__

- 1 <= ```haystack.length, needle.length``` <= 10<sup>4</sup>
- ```haystack``` and ```needle``` consist of only lowercase English characters.

---

There are multiple applications of ```String Matching```, and that's why a lot of research has been done in this field. Multiple algorithms have been devised to solve this problem. Some of the application includes:

- Spell Checker
- Plagiarism Detection
- Text Editors
- Spam Filters
- Digital Forensics
- Matching DNA Sequences
- Intrusion Detection
- Search Engines
- Bioinformatics and Cheminformatics
- Information Retrieval System
- Language Syntax Checker

### Sliding Window

- __Time complexity__: ```O(n * m)```
- __Space complexity__: ```O(1)```

```Python
class Solution:
    def strStr(self, haystack: str, needle: str) -> int:
        n = len(haystack)
        m = len(needle)

        for start in range(n - m + 1):
            for end in range(m):
                # Check if character does not match
                if haystack[start + end] != needle[end]:
                    break
                # Otherwise, matching character, check if it is the last character of needle
                elif end == m - 1:
                    return start
        
        return -1
```
