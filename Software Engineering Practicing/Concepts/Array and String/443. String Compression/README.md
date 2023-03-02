## [443. String Compression](https://leetcode.com/problems/string-compression/)

```Tag```: ```String``` ```Array``` ```Two Pointers```

#### Difficulty: Medium

Given an array of characters ```chars```, compress it using the following algorithm:

Begin with an empty string ```s```. For each group of consecutive repeating characters in ```chars```:

- If the group's length is ```1```, append the character to ```s```.
- Otherwise, append the character followed by the group's length.

The compressed string ```s``` __should not be returned separately__, but instead, be stored __in the input character array ```chars```__. Note that group lengths that are ```10``` or longer will be split into multiple characters in ```chars```.

After you are done __modifying the input array__, return _the new length of the array_.

You must write an algorithm that uses only constant extra space.

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

### Two Pointers

```Python
class Solution:
    def compress(self, chars: List[str]) -> int:
        count = 0
        n = len(chars)
        i = 0
        while i < len(chars):
            group_length = 1
            while i + group_length < len(chars) and chars[i + group_length] == chars[i]:
                group_length += 1
            chars[count] = chars[i]
            count += 1

            if group_length > 1:
                str_len = str(group_length)
                chars[count:count + len(str_len)] = list(str_len)
                count += len(str_len)

            i += group_length
            
        return count
```
