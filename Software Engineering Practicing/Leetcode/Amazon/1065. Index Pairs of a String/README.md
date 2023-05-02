## [1065. Index Pairs of a String](https://leetcode.com/problems/index-pairs-of-a-string/)

```Tag```: 

#### Difficulty: Easy

Given a string ```text``` and an array of strings ```words```, return _an array of all index pairs ```[i, j]``` so that the substring ```text[i...j]``` is in ```words```_.

Return the pairs ```[i, j]``` in __sorted order__ (i.e., sort them by their first coordinate, and in case of ties sort them by their second coordinate).

![image](https://user-images.githubusercontent.com/35042430/235569431-d24c9a39-9e06-408e-a3e7-7574ff3e9231.png)

---

__Example 1:__
```
Input: text = "thestoryofleetcodeandme", words = ["story","fleet","leetcode"]
Output: [[3,7],[9,13],[10,17]]
```

__Example 2:__
```
Input: text = "ababa", words = ["aba","ab"]
Output: [[0,1],[0,2],[2,3],[2,4]]
Explanation: Notice that matches can overlap, see "aba" is found in [0,2] and [2,4].
```

__Constraints:__

- ```1 <= text.length <= 100```
- ```1 <= words.length <= 20```
- ```1 <= words[i].length <= 50```
- ```text``` and ```words[i]``` consist of lowercase English letters.
- All the strings of ```words``` are unique.

---


 
