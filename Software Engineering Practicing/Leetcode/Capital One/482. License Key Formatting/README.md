## License Key Formatting

#### Difficulty: Easy

```
You are given a license key represented as a string s that consists of only alphanumeric characters and dashes. The string is separated into n + 1 groups by n dashes. You are also given an integer k.

We want to reformat the string s such that each group contains exactly k characters, except for the first group, which could be shorter than k but still must contain at least one character. Furthermore, there must be a dash inserted between two groups, and you should convert all lowercase letters to uppercase.

Return the reformatted license key.
```

__Example 1:__
```
Input: s = "5F3Z-2e-9-w", k = 4
Output: "5F3Z-2E9W"
Explanation: The string s has been split into two parts, each part has 4 characters.
Note that the two extra dashes are not needed and can be removed.
```

__Example 2:__
```
Input: s = "2-5g-3-J", k = 2
Output: "2-5G-3J"
Explanation: The string s has been split into three parts, each part has 2 characters except the first part as it could be shorter as mentioned above.
```

__Constraints:__
```
1 <= s.length <= 105
s consists of English letters, digits, and dashes '-'.
1 <= k <= 104
```

### Right to Left Traversal

![image](https://leetcode.com/problems/license-key-formatting/Figures/482/approach1.png)

```{Python}
class Solution(object):
    def licenseKeyFormatting(self, s, k):
        """
        :type s: str
        :type k: int
        :rtype: str
        """
        """
        "5F3Z-2e-9-w"
        3
        "2-5g-3-J"
        1
        "2-5g-3-J"
        2
        "2-5g-3-J"
        3
        "2-5g-3-J"
        4
        "2-5g-3-J"
        5
        "2-5g-3-J"
        6        
        """
        answer = []
        step = k
        for i in range(len(s)-1, -1, -1):
            if s[i] != '-':
                answer.append(s[i].upper())
                step -= 1
                if step == 0:
                    answer.append('-')
                    step = k
        if len(answer) > 0 and answer[-1] == '-':
            answer = answer[:-1]
        answer = answer[::-1]
        answer = "".join(answer)
        return answer
```        
