## [28. Find the Index of the First Occurrence in a String](https://leetcode.com/problems/find-the-index-of-the-first-occurrence-in-a-string/)

```Tag```: [```Sliding Window```](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Concepts/Array%20and%20String/Sliding%20Window/28.%20Find%20the%20Index%20of%20the%20First%20Occurrence%20in%20a%20String) ```Hash Map``` [```Rabin-Karp Algorithm```](https://github.com/quananhle/Python/edit/main/Software%20Engineering%20Practicing/Concepts/Algorithms/String%20Matching/28.%20Find%20the%20Index%20of%20the%20First%20Occurrence%20in%20a%20String/README.md) [```Knuth–Morris–Pratt Algorithm```](https://github.com/quananhle/Python/edit/main/Software%20Engineering%20Practicing/Concepts/Algorithms/String%20Matching/28.%20Find%20the%20Index%20of%20the%20First%20Occurrence%20in%20a%20String/README.md)

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

---

### Rabin-Karp Algorithm (Single Hash)

__Spurious Hits__: If the hash value of ```needle``` matches with the hash-value of the m-Substring of ```haystack``` but the m-Substring is not equal to ```needle```, then we have a spurious hit.

__Computer Hash Value__

![image](https://user-images.githubusercontent.com/35042430/222805990-6bdbbd8a-524d-40e5-a7fb-047fac8bc4bb.png)

![image](https://user-images.githubusercontent.com/35042430/222807120-6f752120-92b4-48ae-9cd5-abbb1f242040.png)

__Check character by character if hash values matched__

![image](https://user-images.githubusercontent.com/35042430/222807675-93baafbc-2261-4ce2-8496-64214a810865.png)

![image](https://user-images.githubusercontent.com/35042430/222807778-bd925ebe-5628-4c27-a74c-e6e78f3b60b3.png)

![image](https://user-images.githubusercontent.com/35042430/222807813-198968a0-a855-4385-beb3-0a0831ff6dab.png)

![image](https://user-images.githubusercontent.com/35042430/222806433-0608d386-867d-4667-903e-969ed3c32a0d.png)

![image](https://user-images.githubusercontent.com/35042430/222806523-faa09e05-3839-4148-8364-f63c2251736a.png)

![image](https://user-images.githubusercontent.com/35042430/222806737-8652573a-2166-4073-b3c9-db6940da57f2.png)

![image](https://user-images.githubusercontent.com/35042430/222806666-e4a87efe-ce3a-432c-a838-ced8a0621438.png)

- __Time complexity__: ```O(n * m)```
- __Space complexity__: ```O(1)```

```Python
class Solution:
    def strStr(self, haystack: str, needle: str) -> int:
        n = len(haystack)
        m = len(needle)

        if n < m:
            return -1

        RADIX = 26
        MOD = 10**6 + 7
        MAX_WEIGHT = 1

        for _ in range(m):
            MAX_WEIGHT = (MAX_WEIGHT * RADIX) % MOD
        
        def compute_hash_value(string):
            ans = 0
            factor = 1

            for i in range(m - 1, -1, -1):
                ans += (ord(string[i]) - 97) * factor % MOD
                factor = factor * RADIX % MOD
            
            return ans % MOD
        
        hash_needle = compute_hash_value(needle)

        for start in range(n - m + 1):
            if start == 0:
                # Compute the hash value of the haystack that has the same length as needle
                hash_haystack = compute_hash_value(haystack)
            else:
                # Compute the hash value on a rolling window
                hash_haystack = (hash_haystack * RADIX % MOD - \
                                (ord(haystack[start - 1]) - 97) * MAX_WEIGHT) % MOD + \
                                (ord(haystack[start + m - 1]) - 97 + MOD) % MOD
        
            # Check if hash values of needle and haystack are matching
            if hash_needle == hash_haystack:
                # Scan every character in the window
                for end in range(m):
                    if needle[end] != haystack[start + end]:
                        break
                if end == m - 1:
                    return start

        return -1
```
