## [358. Rearrange String k Distance Apart](https://leetcode.com/problems/rearrange-string-k-distance-apart/)

```Tag```:

#### Difficulty: Medium

Given a string ```s``` and an integer ```k```, rearrange ```s``` such that the same characters are at least distance ```k``` from each other. If it is not possible to rearrange the string, return an empty string ```""```.

![image](https://github.com/quananhle/Python/assets/35042430/fe61a43d-6106-49e8-8e90-b8bf73eaf46a)

---

__Example 1:__
```
Input: s = "aabbcc", k = 3
Output: "abcabc"
Explanation: The same letters are at least a distance of 3 from each other.
```

__Example 2:__
```
Input: s = "aaabc", k = 3
Output: ""
Explanation: It is not possible to rearrange the string.
```

__Example 3:__
```
Input: s = "aaadbbcc", k = 2
Output: "abacabcd"
Explanation: The same letters are at least a distance of 2 from each other.
```

__Constraints:__

- $1 \le s.length \le 3 * 10^{5}$
- ```s``` consists of only lowercase English letters.
- $0 \le k \le s.length$

---
