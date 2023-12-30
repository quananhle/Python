## [1897. Redistribute Characters to Make All Strings Equal](https://leetcode.com/problems/redistribute-characters-to-make-all-strings-equal)

```Tag```: ```Array & String``` ```Hash Map```

#### Difficulty: Easy

You are given an array of strings ```words``` (0-indexed).

In one operation, pick two distinct indices ```i``` and ```j```, where ```words[i]``` is a non-empty string, and move any character from ```words[i]``` to any position in ```words[j]```.

Return _```True``` if you can make every string in ```words``` equal using any number of operations, and ```False``` otherwise_.

---

__Example 1:__
```
Input: words = ["abc","aabc","bc"]
Output: true
Explanation: Move the first 'a' in words[1] to the front of words[2],
to make words[1] = "abc" and words[2] = "abc".
All the strings are now equal to "abc", so return true.
```

__Example 2:__
```
Input: words = ["ab","a"]
Output: false
Explanation: It is impossible to make all the strings equal using the operation.
```

__Constraints:__

- $1 \le words.length \le 100$
- $1 \le words[i].length \le 100$
- ```words[i]``` consists of lowercase English letters.

---

### Hash Map

#### Frequency Counter

```Python
class Solution:
    def makeEqual(self, words: List[str]) -> bool:
        counter = collections.defaultdict(int)
        for word in words:
            for c in word:
                counter[c] += 1
        
        n = len(words)
        for _, val in counter.items():
            # Check if all characters can be equally distributed among every word to make all strings equal
            if val % n:
                return False
        
        return True
```
