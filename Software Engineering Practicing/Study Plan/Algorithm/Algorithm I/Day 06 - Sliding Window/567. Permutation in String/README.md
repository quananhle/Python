## [567. Permutation in String](https://leetcode.com/problems/permutation-in-string)

```Tag```: ```Sorting``` ```Hash Map``` ```Sliding Window```

#### Difficulty: Medium

Given two strings ```s1``` and ```s2```, return _```true``` if ```s2``` contains a permutation of ```s1```, or ```false``` otherwise_.

In other words, return _```true``` if one of ```s1```'s permutations is the substring of ```s2```_.

![image](https://user-images.githubusercontent.com/35042430/216755889-f17da9fa-8939-48ac-8e0f-13a66efd5e09.png)

---

__Example 1:__
```
Input: s1 = "ab", s2 = "eidbaooo"
Output: true
Explanation: s2 contains one permutation of s1 ("ba").
```

__Example 2:__
```
Input: s1 = "ab", s2 = "eidboaoo"
Output: false
```

__Constraints:__

- 1 <= ```s1.length, s2.length``` <= 10<sup>4</sup>
- ```s1``` and ```s2``` consist of lowercase English letters.

---

![image](https://user-images.githubusercontent.com/35042430/216882985-aa2efee1-a6b8-40f5-9bcd-94d9526ffeed.png)

### Hashmap and Counter

```Python
class Solution:
    def checkInclusion(self, s1: str, s2: str) -> bool:
        s1_counter = collections.defaultdict(int)
        for c in s1:
            if not c in s1_counter:
                s1_counter[c] = 1
            else:
                s1_counter[c] += 1

        def matches(counter1, counter2):
            for key, val in counter1.items():
                if counter1[key] - counter2.get(key, -1) != 0:
                    return False
            return True

        for i in range(len(s2) - len(s1) + 1):
            s2_counter = collections.defaultdict(int)
            for j in range(len(s1)):
                s2_counter[s2[i + j]] = 1 + s2_counter.get(s2[i + j], 0)
            if matches(s1_counter, s2_counter):
                return True
        return False
```

```Python
class Solution:
    def checkInclusion(self, s1: str, s2: str) -> bool:
        def matches(counter1, counter2):
            for key, val in counter1.items():
                if counter1[key] - counter2.get(key, -1) != 0:
                    return False
            return True

        s1_counter = collections.Counter(s1)
        for i in range(len(s2) - len(s1) + 1):
            s2_counter = collections.defaultdict(int)
            for j in range(len(s1)):
                s2_counter[s2[i + j]] = 1 + s2_counter.get(s2[i + j], 0)
            if matches(s1_counter, s2_counter):
                return True
        return False
```

### Counter and Sliding Window

```Python
class Solution:
    def checkInclusion(self, s1: str, s2: str) -> bool:
        m, n = len(s1), len(s2)
        s1_counter = collections.Counter(s1)

        for start in range(n - m + 1):
            end = start + n
            window = s2[start : end]
            s2_counter = collections.Counter(window)
            if s1_counter == s2_counter:
                return True

        return False
```
