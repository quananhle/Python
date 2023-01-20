## 249. Group Shifted Strings

```Tag```: ```Hash Table```

#### Difficulty: Medium

We can shift a string by shifting each of its letters to its successive letter.

- For example, ```"abc"``` can be shifted to be ```"bcd"```.

We can keep shifting the string to form a sequence.

- For example, we can keep shifting ```"abc"``` to form the sequence: ```"abc" -> "bcd" -> ... -> "xyz"```.

Given an array of strings ```strings```, group all ```strings[i]``` that belong to the same shifting sequence. You may return the answer in __any order__.

![image](https://user-images.githubusercontent.com/35042430/213777108-d7ef9bc9-122a-461b-ad02-204c2cb1c11c.png)

---

__Example 1:__
```
Input: strings = ["abc","bcd","acef","xyz","az","ba","a","z"]
Output: [["acef"],["a","z"],["abc","bcd","xyz"],["az","ba"]]
```

__Example 2:__
```
Input: strings = ["a"]
Output: [["a"]]
```

__Constraints:__
```
1 <= strings.length <= 200
1 <= strings[i].length <= 50
strings[i] consists of lowercase English letters.
```

---

__Note__: Modulo operator ```%``` behaves differently in C++/Java and Python. The difference lies in the operator implementation.

```C++/Java```: ```a % b = a - int(a / b) * b```

```Python```: ```a % b = a - floor(a / b) * b```

### Hash Table 

```Python
class Solution:
    def groupStrings(self, strings: List[str]) -> List[List[str]]:
        group = collections.defaultdict(list)
        for string in strings:
            pattern = tuple()
            for i in range(1, len(string)):
                pattern += ((ord(string[i]) - ord(string[i-1]) + 26) % 26,)
            group[pattern].append(string)
        return group.values()
```

```Python
class Solution:
    def groupStrings(self, strings: List[str]) -> List[List[str]]:
        group = collections.defaultdict(list)
        for string in strings:
            key = list()
            for a, b in zip(string, string[1:]):
                key.append(chr((ord(b) - ord(a)) % 26 + ord('a')))
            hash_key = ''.join(key)
            group[hash_key].append(string)
        return group.values()
```
