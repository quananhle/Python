## [443. String Compression](https://leetcode.com/problems/string-compression)

```Tag```: ```String & Array``` ```Two Pointers```

#### Difficulty: Medium

Given an array of characters ```chars```, compress it using the following algorithm:

Begin with an empty string ```s```. For each group of consecutive repeating characters in ```chars```:

- If the group's length is ```1```, append the character to ```s```.
- Otherwise, append the character followed by the group's length.

The compressed string ```s``` should not be returned separately, but instead, be stored in the input character array ```chars```. Note that group lengths that are ```10``` or longer will be split into multiple characters in ```chars```.

After you are done modifying the input array, return _the new length of the array_.

You must write an algorithm that uses only constant extra space.

![image](https://github.com/quananhle/Python/assets/35042430/7a2fb804-312d-49c9-9202-47810708c1b5)

---

__Example 1:__
```
Input: chars = ["a","a","b","b","c","c","c"]
Output: Return 6, and the first 6 characters of the input array should be: ["a","2","b","2","c","3"]
Explanation: The groups are "aa", "bb", and "ccc". This compresses to "a2b2c3".
```

__Example 2:__
```
Input: chars = ["a"]
Output: Return 1, and the first character of the input array should be: ["a"]
Explanation: The only group is "a", which remains uncompressed since it's a single character.
```

__Example 3:__
```
Input: chars = ["a","b","b","b","b","b","b","b","b","b","b","b","b"]
Output: Return 4, and the first 4 characters of the input array should be: ["a","b","1","2"].
Explanation: The groups are "a" and "bbbbbbbbbbbb". This compresses to "ab12".
```

__Constraints:__

- ```1 <= chars.length <= 2000```
- ```chars[i]``` is a lowercase English letter, uppercase English letter, digit, or symbol.

---

### Three Pointers

```Python
class Solution:
    def compress(self, chars: List[str]) -> int:
        n = len(chars)
        start = 0
        end = count = 1

        while end < n + 1:
            if end < n and chars[end] == chars[end - 1]:
                count += 1
            else:
                chars[start] = chars[end - 1]
                start += 1
                if count > 1:
                    for c in str(count):
                        chars[start] = c
                        start += 1
                count = 1
            end += 1

        return start
```
