## [1647. Minimum Deletions to Make Character Frequencies Unique](https://leetcode.com/problems/minimum-deletions-to-make-character-frequencies-unique)

 ```Tag```: ```Hash Map``` ```Hash Set``` ```Priority Queue```

 #### Difficulty: Medium

 A string ```s``` is called good if there are no two different characters in ```s``` that have the same frequency.

Given a string ```s```, return _the minimum number of characters you need to delete to make ```s``` good_.

The frequency of a character in a string is the number of times it appears in the string. For example, in the string ```"aab"```, the frequency of ```'a'``` is ```2```, while the frequency of ```'b'``` is ```1```.

![image](https://github.com/quananhle/Python/assets/35042430/fbc7939a-ad29-4fc0-b3f7-aa412c27990d)

---

__Example 1:__
```
Input: s = "aab"
Output: 0
Explanation: s is already good.
```

__Example 2:__
```
Input: s = "aaabbbcc"
Output: 2
Explanation: You can delete two 'b's resulting in the good string "aaabcc".
Another way it to delete one 'b' and one 'c' resulting in the good string "aaabbc".
```

__Example 3:__
```
Input: s = "ceabaacb"
Output: 2
Explanation: You can delete both 'c's resulting in the good string "eabaab".
Note that we only care about characters that are still in the string at the end (i.e. frequency of 0 is ignored).
```

__Constraints:__

- $1 \le s.length \le 10^{5}$
- ```s``` contains only lowercase English letters.

---

### Counter

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N + K^{2})$
- __Space Complexity__: $\mathcal{O}O(K)$

```Python
class Solution:
    def minDeletions(self, s: str) -> int:
        counter = collections.defaultdict(int)
        for c in s:
            counter[c] = counter.get(c, 0) + 1

        ans = 0
        seen_frequency = set()

        for _, f in counter.items():
            while f and f in seen_frequency:
                f -= 1
                ans += 1
            seen_frequency.add(f)
    
        return ans
```
