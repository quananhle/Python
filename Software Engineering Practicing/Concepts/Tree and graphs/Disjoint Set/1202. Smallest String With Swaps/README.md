## 1202. Smallest String With Swaps



#### Difficulty: Medium

You are given a string ```s```, and an array of pairs of indices in the string ```pairs``` where ```pairs[i] = [a, b]``` indicates 2 indices(0-indexed) of the string.

You can swap the characters at any pair of indices in the given ```pairs``` any number of times.

Return _the lexicographically smallest string that ```s``` can be changed to after using the swaps_.

![image](https://user-images.githubusercontent.com/35042430/211417589-38e64021-9824-4dd6-9b2c-b14089b5375e.png)

---

__Example 1:__
```
Input: s = "dcab", pairs = [[0,3],[1,2]]
Output: "bacd"
Explaination: 
Swap s[0] and s[3], s = "bcad"
Swap s[1] and s[2], s = "bacd"
```

__Example 2:__
```
Input: s = "dcab", pairs = [[0,3],[1,2],[0,2]]
Output: "abcd"
Explaination: 
Swap s[0] and s[3], s = "bcad"
Swap s[0] and s[2], s = "acbd"
Swap s[1] and s[2], s = "abcd"
```

__Example 3:__
```
Input: s = "cba", pairs = [[0,1],[1,2]]
Output: "abc"
Explaination: 
Swap s[0] and s[1], s = "bca"
Swap s[1] and s[2], s = "bac"
Swap s[0] and s[1], s = "abc"
```

__Constraints:__
```
1 <= s.length <= 10^5
0 <= pairs.length <= 10^5
0 <= pairs[i][0], pairs[i][1] < s.length
s only contains lower case English letters.
```

---
