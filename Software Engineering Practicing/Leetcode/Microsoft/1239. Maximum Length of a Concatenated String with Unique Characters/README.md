## [1239. Maximum Length of a Concatenated String with Unique Characters](https://leetcode.com/problems/maximum-length-of-a-concatenated-string-with-unique-characters)

```Tag```: ```Array & String``` ```Bitwise Manipulation``` ```Recursion``` ```Backtracking```

#### Difficulty: Medium

You are given an array of strings ```arr```. A string ```s``` is formed by the __concatenation__ of a __subsequence__ of ```arr``` that has __unique characters__.

Return _the __maximum__ possible length of ```s```_.

A __subsequence__ is an array that can be derived from another array by deleting some or no elements without changing the order of the remaining elements.

![image](https://github.com/quananhle/Python/assets/35042430/277b229f-18e4-420b-ab2e-6b002ca50b02)

---

__Example 1:__
```
Input: arr = ["un","iq","ue"]
Output: 4
Explanation: All the valid concatenations are:
- ""
- "un"
- "iq"
- "ue"
- "uniq" ("un" + "iq")
- "ique" ("iq" + "ue")
Maximum length is 4.
```

__Example 2:__
```
Input: arr = ["cha","r","act","ers"]
Output: 6
Explanation: Possible longest valid concatenations are "chaers" ("cha" + "ers") and "acters" ("act" + "ers").
```

__Example 3:__
```
Input: arr = ["abcdefghijklmnopqrstuvwxyz"]
Output: 26
Explanation: The only string in arr has all 26 characters.
```

__Constraints:__

- $1 \le arr.length \le 16$
- $1 \le arr[i].length \le 26$
- ```arr[i]``` contains only lowercase English letters.

---

### Brute Force

#### Build All Strings

```Python
class Solution:
    def maxLength(self, arr: List[str]) -> int:
        ans = 0
        res = [""]

        for word in arr:
            for i in range(len(res)):
                subsequence = res[i] + word
                if len(subsequence) != len(set(subsequence)):
                    continue
                res.append(subsequence)
                ans = max(ans, len(subsequence))
            
        return ans
```
