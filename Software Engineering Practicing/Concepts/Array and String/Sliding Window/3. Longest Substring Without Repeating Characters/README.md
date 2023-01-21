## 3. Longest Substring Without Repeating Characters

```Tag```: [```Sliding Window```](https://github.com/quananhle/Python/tree/a6743ae4e7a2c9d6eae77f9dca6aa43af4f10de5/Software%20Engineering%20Practicing/Concepts/Array%20and%20String/Sliding%20Window) [```Hash Table```](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Concepts/Hash%20Table)

#### Difficulty: Medium

Given a string ```s```, find the length of the __longest substring__ without repeating characters.

![image](https://user-images.githubusercontent.com/35042430/213847703-dd5ed64c-f347-42dd-858b-bead2211c3b6.png)

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
```
0 <= s.length <= 5 * 104
s consists of English letters, digits, symbols and spaces.
```

---

### Hash Map

```Python
class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        # Hash Map
        #### Time Complexity : O(N), traverse through input string
        #### Space Complexity: O(N), extra memory space to build dictionary to keep track of seen characters
        seen = collections.defaultdict(int)
        longest = count = start = 0
        for i, c in enumerate(s):
            # Check if c is already seen
            if c in seen and seen[c] >= start:
                longest = max(longest, count)
                # Update the current length starting from character c to current index i
                count = i - seen[c]
                # Update start position to start at the next character of the current character c
                start = seen[c] + 1
            # Otherwise, c is not seen before
            else:
                count += 1
            # Update the current index i in memo of character c
            seen[c] = i
        return max(longest, count)
```
