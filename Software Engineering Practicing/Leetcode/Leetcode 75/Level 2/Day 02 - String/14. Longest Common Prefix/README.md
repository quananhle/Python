## [14. Longest Common Prefix](https://leetcode.com/problems/longest-common-prefix/)

```Tag```: [```String & Array```](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Leetcode/Leetcode%2075/Level%202/Day%2002%20-%20String/14.%20Longest%20Common%20Prefix#vertical-scanning) [```Binary Search```](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Leetcode/Leetcode%2075/Level%202/Day%2002%20-%20String/14.%20Longest%20Common%20Prefix#binary-search) [```Divide & Conquer```](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Leetcode/Leetcode%2075/Level%202/Day%2002%20-%20String/14.%20Longest%20Common%20Prefix#divide-and-conquer) [```Trie```](https://github.com/quananhle/Python/edit/main/Software%20Engineering%20Practicing/Concepts/Trie/14.%20Longest%20Common%20Prefix/README.md)

#### Difficulty: Easy

Write a function to find the longest common prefix string amongst an array of strings.

If there is no common prefix, return an empty string ```""```.

![image](https://user-images.githubusercontent.com/35042430/222623089-48f9bad1-1ce3-43b8-9d0a-e48426888319.png)

---

__Example 1:__
```
Input: strs = ["flower","flow","flight"]
Output: "fl"
```

__Example 2:__
```
Input: strs = ["dog","racecar","car"]
Output: ""
Explanation: There is no common prefix among the input strings.
```

__Constraints:__

- ```1 <= strs.length <= 200```
- ```0 <= strs[i].length <= 200```
- ```strs[i]``` consists of only lowercase English letters.

---

### Vertical Scanning

- __Time complexity__: O(S), where S is the sum of all characters in all strings
- __Space complexity__: O(1)

```Python
class Solution:
    def longestCommonPrefix(self, strs: List[str]) -> str:
        # Vertical Scanning
        ans = []
        i = 0
        prefix = strs[0]
        while i in range(len(prefix)):
            for string in strs:
                if i == len(string) or string[i] != prefix[i]:
                    return ''.join(ans)
            ans.append(string[i])
            i += 1
        return ''.join(ans)
```

### Binary Search

![image](https://leetcode.com/media/original_images/14_lcp_binary_search.png)

- __Time complexity__: O(S * log m), where S is the sum of all characters in all strings
- __Space complexity__: O(1)

```Python
class Solution:
    def longestCommonPrefix(self, strs: List[str]) -> str:
        # Binary Search
        def common_prefix(size):
            string = strs[0][0:size]
            for i in range(1, len(strs)):
                if not strs[i].startswith(string):
                    return False
            return True

        if len(strs) == 0:
            return ""
        
        min_length = float('inf')
        for string in strs:
            min_length = min(min_length, len(string))
        
        lo, hi = 1, min_length
        while lo <= hi:
            mi = lo + (hi - lo) // 2
            if common_prefix(mi):
                lo = mi + 1
            else:
                hi = mi - 1
        
        return strs[0][0:(lo + (hi - lo) // 2)]
```

### Divide and Conquer

![image](https://leetcode.com/media/original_images/14_lcp_diviso_et_lmpera.png)

```Python
class Solution:
    def longestCommonPrefix(self, strs: List[str]) -> str:
        # Divide & Conquer
        if not strs or len(strs) == 0:
            return ""

        def conquer(left_string, right_string):
            min_length = min(len(left_string), len(right_string))
            for i in range(min_length):
                if left_string[i] != right_string[i]:
                    return left_string[:i]
            return left_string[:min_length]

        def divide(left, right):
            if left == right:
                return strs[left]
            mid = left + (right - left) // 2
            lcp_left = divide(left, mid)
            lcp_right = divide(mid + 1, right)
            return conquer(lcp_left, lcp_right)

        return divide(0, len(strs) - 1)
```
