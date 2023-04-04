## [2405. Optimal Partition of String](https://leetcode.com/problems/optimal-partition-of-string/)

```Tag```: ```Greedy``` ```Hash Table```

#### Difficulty: 

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

