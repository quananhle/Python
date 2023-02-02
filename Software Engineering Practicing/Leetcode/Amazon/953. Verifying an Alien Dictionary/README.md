## 953. Verifying an Alien Dictionary

```Tag```: ```Hash Map```

#### Difficulty: Easy

In an alien language, surprisingly, they also use English lowercase letters, but possibly in a different order. The order of the alphabet is some permutation of lowercase letters.

Given a sequence of ```words``` written in the alien language, and the ```order``` of the alphabet, return _```true``` iff the given ```words``` are sorted lexicographically in this alien language_.

![image](https://user-images.githubusercontent.com/35042430/216239014-9eee23e0-3891-4303-8f5f-ba018c7e4e81.png)

---
 
__Example 1:__
```
Input: words = ["hello","leetcode"], order = "hlabcdefgijkmnopqrstuvwxyz"
Output: true
Explanation: As 'h' comes before 'l' in this language, then the sequence is sorted.
```

__Example 2:__
```
Input: words = ["word","world","row"], order = "worldabcefghijkmnpqstuvxyz"
Output: false
Explanation: As 'd' comes after 'l' in this language, then words[0] > words[1], hence the sequence is unsorted.
```

__Example 3:__
```
Input: words = ["apple","app"], order = "abcdefghijklmnopqrstuvwxyz"
Output: false
Explanation: The first three characters "app" match, and the second string is shorter (in size.) According to lexicographical rules "apple" > "app", because 'l' > '∅', where '∅' is defined as the blank character which is less than any other character (More info).
```

__Constraints:__

- ```1 <= words.length <= 100```
- ```1 <= words[i].length <= 20```
- ```order.length == 26```
- All characters in ```words[i]``` and ```order``` are English lowercase letters.

---
