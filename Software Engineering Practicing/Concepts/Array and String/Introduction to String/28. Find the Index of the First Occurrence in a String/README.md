## 28. Find the Index of the First Occurrence in a String

```Tag```: ```Two Pointers``` ```String``` ```String Matching```

#### Difficulty: Medium

Given two strings needle and haystack, return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.

![image](https://user-images.githubusercontent.com/35042430/209769430-324d03f2-171f-4936-86e4-402e53c425a7.png)

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
```
1 <= haystack.length, needle.length <= 104
haystack and needle consist of only lowercase English characters.
```

---

![image](https://media.geeksforgeeks.org/wp-content/uploads/20221125004358/image.png)

### Knuth-Morris-Pratt Algorithm for Pattern Searching

```Python
class Solution:
    def strStr(self, haystack: str, needle: str) -> int:
        # Knuth-Morris-Pratt
        #### Time Complexity: O(N + M)
        #### Space Complexity:
        def kmp(pattern, text):
            n = len(text)
            m = len(pattern)
            string = needle + '#' + haystack

            print (string)

            longest_prefix_suffix = [0]
            j = 0

            for i in range(1, len(string)):
                while j > 0 and string[i] != string[j]:
                    j = longest_prefix_suffix[j - 1]
                if string[j] == string[i]:
                    j += 1
                else:
                    j = 0
                longest_prefix_suffix.append(j)
                print (longest_prefix_suffix)
            return longest_prefix_suffix

        string = kmp(needle, haystack)
        for i in range(len(needle) + 1, len(string)):
            if string[i] == len(needle):
                return i - 2 * len(needle)
        
        return -1
```

```Python
class Solution:
    def strStr(self, haystack: str, needle: str) -> int:
        # Knuth-Morris-Pratt
        #### Time Complexity: O(N + M)
        #### Space Complexity:
        if needle == "":
            return 0
        lps = [0] * len(needle)
        # Initialize 2 pointers: prev_lps to point at the beginning of the prefix, and i to increment to find the longest prefix suffix
        prev_lps, i = 0, 1

        # Set up longest prefix suffix
        while i < len(needle):
            if needle[i] == needle[prev_lps]:
                lps[i] = prev_lps + 1
                prev_lps += 1
                i += 1
            elif prev_lps == 0:
                    lps[i] = 0
                    i += 1
            else:
                prev_lps = lps[prev_lps - 1]

        print (lps)
        # i pointer for the haystack, j pointer for the needle
        i, j = 0, 0
        # Compare the needle and the haystack
        while i < len(haystack):
            # If found the matching characterin haystack and needle
            if haystack[i] == needle[j]:
                # Increment the pointers
                i += 1
                j += 1
            # Otherwise, if no matching character found
            else:
                # Check if pointing at the first character of the needle
                if j == 0:
                    # Increment the haystack pointer
                    i += 1
                # If not pointing at the first character of the needle
                else:
                    # Get the longest prefix suffix count
                    j = lps[j - 1]
            if j == len(needle):
                return i - len(needle)
        return -1
```

