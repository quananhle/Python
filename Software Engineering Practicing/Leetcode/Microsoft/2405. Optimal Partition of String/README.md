## [2405. Optimal Partition of String](https://leetcode.com/problems/optimal-partition-of-string/)

```Tag```: ```Greedy``` ```Hash Table```

#### Difficulty: Medium

Given a string ```s```, partition the string into one or more __substrings__ such that the characters in each substring are __unique__. That is, no letter appears in a single substring more than __once__.

Return _the minimum number of substrings in such a partition_.

Note that each character should belong to exactly one substring in a partition.

![image](https://user-images.githubusercontent.com/35042430/229675737-fdc936e2-482e-4a03-a7f7-6e86cfbd3112.png)

---

__Example 1:__
```
Input: s = "abacaba"
Output: 4
Explanation:
Two possible partitions are ("a","ba","cab","a") and ("ab","a","ca","ba").
It can be shown that 4 is the minimum number of substrings needed.
```

__Example 2:__
```
Input: s = "ssssss"
Output: 6
Explanation:
The only valid partition is ("s","s","s","s","s","s").
```

__Constraints:__

- 1 <= ```s.length``` <= 10<sup>5</sup>
- ```s``` consists of only English lowercase letters.

---

### Greedy

__Algorithm__

1. Create an array ```last_seen``` of size ```26``` to keep track of the most recent position of each character. We fill it with ```-1```.
2. Create an integer variable ```count``` to keep track of the number of substrings formed. We initialize it with ```1``` to start adding characters to the first substring until we can't add anymore.
3. Create another integer variable ```start``` to hold the starting index of the substring under consideration. We initialize it to ```0``` because the first substring begins at index ```0```.
4. Iterate over the string ```s``` and for each index ```i```:
    - If the most recent position of the character ```s[i]``` is greater than or equal to the starting position of the substring, i.e. ```last_seen[s[i] - 'a'] >= start```, it means we have already included this character in this substring. As a result, we increase the count by ```1``` as we start a new substring and set ```start = i```.
    - We update ```last_seen``` for the current character by performing ```last_seen[s[i] - 'a'] = i```.
5. Return ```count```.

```Python
class Solution:
    def partitionString(self, s: str) -> int:
        last_seen = [-1] * 26
        count = 1
        start = 0

        for i, c in enumerate(s):
            if last_seen[ord(c) - ord('a')] >= start:
                count += 1
                start = i
            last_seen[ord(c) - ord('a')] = i

        return count
```
