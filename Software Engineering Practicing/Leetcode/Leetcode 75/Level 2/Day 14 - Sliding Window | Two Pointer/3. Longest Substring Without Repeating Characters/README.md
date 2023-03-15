## [3. Longest Substring Without Repeating Characters](https://leetcode.com/problems/longest-substring-without-repeating-characters/)

```Tag```: ```Two Pointers``` ```Sliding Window``` ```Hash Map``` ```Hash Set```

#### Difficulty: Medium

Given a string ```s```, find the length of the longest substring without repeating characters.

![image](https://user-images.githubusercontent.com/35042430/225391142-77b1b81a-a802-4438-aa5e-7ab4694051ca.png)

---

__Example 1:__
```
Input: s = "abcabcbb"
Output: 3
Explanation: The answer is "abc", with the length of 3.
```

__Example 2:__
```
Input: s = "bbbbb"
Output: 1
Explanation: The answer is "b", with the length of 1.
```

__Example 3:__
```
Input: s = "pwwkew"
Output: 3
Explanation: The answer is "wke", with the length of 3.
Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
```

__Constraints:__

- ```0 <= s.length <= 5 * 10^4```
- ```s``` consists of English letters, digits, symbols and spaces.

---

### Sliding Window + Two Pointers

#### Hash Set

```Python
class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        seen = set()
        start = end = 0
        ans = 0

        while end < len(s):
            left, right = s[start], s[end]

            if not right in seen:
                seen.add(right)
                end += 1
            else:
                seen = set()
                ans = max(ans, end - start)
                start += 1
                end = start

        # Ensure to get the longest substring include the last character in s
        ans = max(ans, end - start)
        return ans
```

Commonly used tables are:

- ```int[26]``` for Letters ```'a'``` - ```'z'``` or ```'A'``` - ```'Z'```
- ```int[128]``` for ASCII
- ```int[256]``` for Extended ASCII
