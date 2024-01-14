## [1657. Determine if Two Strings Are Close](https://leetcode.com/problems/determine-if-two-strings-are-close)

```Tag```: ```Counter``` ```Sorting```

#### Difficulty: Medium

Two strings are considered __close__ if you can attain one from the other using the following operations:

- Operation 1: Swap any two __existing__ characters.
  - For example, ```abcde -> aecdb```

- Operation 2: Transform __every__ occurrence of one __existing__ character into another __existing__ character, and do the same with the other character.
  - For example, ```aacabb -> bbcbaa``` (all ```a```'s turn into ```b```'s, and all ```b```'s turn into ```a```'s)

You can use the operations on either string as many times as necessary.

Given two strings, ```word1``` and ```word2```, return ```true``` if ```word1``` and ```word2``` are close, and ```false``` otherwise.

![image](https://github.com/quananhle/Python/assets/35042430/ccd184f0-1e15-4399-977f-f1a537d39664)

---

__Example 1:__
```
Input: word1 = "abc", word2 = "bca"
Output: true
Explanation: You can attain word2 from word1 in 2 operations.
Apply Operation 1: "abc" -> "acb"
Apply Operation 1: "acb" -> "bca"
```

__Example 2:__
```
Input: word1 = "a", word2 = "aa"
Output: false
Explanation: It is impossible to attain word2 from word1, or vice versa, in any number of operations.
```

__Example 3:__
```
Input: word1 = "cabbba", word2 = "abbccc"
Output: true
Explanation: You can attain word2 from word1 in 3 operations.
Apply Operation 1: "cabbba" -> "caabbb"
Apply Operation 2: "caabbb" -> "baaccc"
Apply Operation 2: "baaccc" -> "abbccc"
```

__Constraints:__
```
1 <= word1.length, word2.length <= 105
word1 and word2 contain only lowercase English letters.
```

---

### HashMap

```Python
class Solution(object):
    def closeStrings(self, word1, word2):
        """
        :type word1: str
        :type word2: str
        :rtype: bool
        """
        # HashMap
        #### Time Complexity: O(N), iterate over the length of inputs containing fixed number of character of 26 word1 and word2. Sort operations take O(26log26) time.
        #### Space Complexity: O(1), constant extra space, maximum size of hashmap is 26 
        w1_dict, w2_dict = dict(), dict()
        for c in word1:
            if c not in w1_dict:
                w1_dict[c] = 1
            else:
                w1_dict[c] += 1
        for c in word2:
            if c not in w2_dict:
                w2_dict[c] = 1
            else:
                w2_dict[c] += 1
        w1_keys, w2_keys = set(), set()
        w1_vals, w2_vals = list(), list()
        for key,val in w1_dict.items():
            w1_keys.add(key)
            w1_vals.append(val)
        for key,val in w2_dict.items():
            w2_keys.add(key)
            w2_vals.append(val)
        w1_vals.sort(), w2_vals.sort()
        # return sorted(w1_dict.keys()) == sorted(w2_dict.keys()) and sorted(w1_dict.values()) == sorted(w2_dict.values())
        return w1_keys == w2_keys and w1_vals == w2_vals
```

### One Liner
```Python
class Solution(object):
    def closeStrings(self, word1, word2):
        """
        :type word1: str
        :type word2: str
        :rtype: bool
        """
        # HashMap
        #### Time Complexity: O(N), iterate over the length of inputs containing fixed number of character of 26 word1 and word2. Sort operations take O(26log26) time.
        #### Space Complexity: O(1), constant extra space, maximum size of hashmap is 26 
        return sorted(collections.Counter(word1).keys()) == sorted(collections.Counter(word2).keys()) and sorted(collections.Counter(word1).values()) == sorted(collections.Counter(word2).values())
```
    
    
