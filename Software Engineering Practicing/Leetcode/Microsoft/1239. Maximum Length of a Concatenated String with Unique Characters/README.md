## [1239. Maximum Length of a Concatenated String with Unique Characters](https://leetcode.com/problems/maximum-length-of-a-concatenated-string-with-unique-characters)

```Tag```: ```Array & String``` ```Bitwise Manipulation``` ```Bitmasking``` ```Recursion``` ```Backtracking```

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

### Bitwise Manipulation

```Python
class Solution:
    def maxLength(self, arr: List[str]) -> int:
        res = set([0])
        ans = 0

        def build_string(word: str) -> int:
            char_bitset = 0
            best = 0
            for w in word:
                # Define character mask for current character
                mask = 1 << ord(w) - 97
                # Bitwise AND check using character mask to see if character already found. If so, exit early
                if char_bitset & mask > 0:
                    return 0
                
                # Mark char as seen in char_bitset
                char_bitset += mask
            
            # Check if the initial bitset is already a known result, 
            if char_bitset + (len(word) << 26) in res:
                return 0
            
            for string in list(res):
                # Check if the two bitsets overlap, skip to the next result
                if string & char_bitset:
                    continue
                
                # Merge two into one, add it to result, and keep track of the longest
                new_res_len = (string >> 26) + len(word)
                new_char_bitset = char_bitset + string & ((1 << 26) - 1)
                res.add((new_res_len << 26) + new_char_bitset)
                best = max(best, new_res_len)

            return best
        
        for word in arr:
            ans = max(ans, build_string(word))
        
        return ans
```
