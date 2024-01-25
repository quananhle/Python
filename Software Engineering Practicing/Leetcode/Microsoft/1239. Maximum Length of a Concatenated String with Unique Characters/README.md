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

![image](https://github.com/quananhle/Python/assets/35042430/ff205c25-5109-4742-ae5e-e21b3bedb623)

![image](https://github.com/quananhle/Python/assets/35042430/2a4e6eae-7efe-4bdf-a7fd-9bf8107509bf)

![image](https://github.com/quananhle/Python/assets/35042430/0d452f92-989d-4e6e-8397-dbde2fd8cf31)

![image](https://github.com/quananhle/Python/assets/35042430/d0c10220-01e3-4171-8236-46302d61ef57)

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(2^N)$
- __Space Complexity__: $\mathcal{O}(2^{min(N,K)})$

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

---

### Backtracking

#### Hash Map

```Python
class Solution:
    def maxLength(self, arr: List[str]) -> int:
        counter = collections.Counter()
        n = len(arr)

        def backtracking(curr: int) -> int:
            # Base case: check for duplicate characters
            if len(counter) and counter.most_common(1)[0][1] > 1:
                return 0
            
            best = len(counter)
            for i in range(curr, n):
                word_map = collections.Counter(arr[i])
                if len(word_map) != len(arr[i]):
                    continue
                counter.update(word_map)
                best = max(best, backtracking(i + 1))

                # Backtracking
                for c in word_map:
                    if counter[c] == word_map[c]:
                        del counter[c]
                    else:
                        counter[c] -= word_map[c]

            return best

        return backtracking(0)
```

#### Bitmasking

```Python
class Solution:
    def maxLength(self, arr: List[str]) -> int:
        opt_set = set()

        def word_to_bitset(word: str) -> None:
            char_bitset = 0
            for c in word:
                mask = 1 << ord(c) - 97
                # Check if the bitset contains a duplicate character, exit early if so
                if char_bitset & mask:
                    return
                char_bitset += mask
            opt_set.add(char_bitset + (len(word) << 26))
        

        for word in arr:
            word_to_bitset(word)
        opt_arr = list(opt_set)

        def backtracking(curr: int, curr_chars: int, curr_len: int) -> int:
            best = curr_len
            for i in range(curr, len(opt_arr)):
                new_chars = opt_arr[i] & ((1 << 26) - 1)
                new_len = opt_arr[i] >> 26

                # Check if two bitsets overlap, skip to the next
                if new_chars & curr_chars:
                    continue
                
                curr_chars += new_chars
                curr_len += new_len
                best = max(best, backtracking(i + 1, curr_chars, curr_len))

                # Backtracking
                curr_chars -= new_chars
                curr_len -= new_len
            
            return best
        
        return backtracking(0, 0, 0)
```
