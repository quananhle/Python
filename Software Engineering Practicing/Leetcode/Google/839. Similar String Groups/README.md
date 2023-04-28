## [839. Similar String Groups](https://leetcode.com/problems/similar-string-groups)

```Tag```: ```Depth-First Search```

#### Difficulty: Hard

Two strings ```X``` and ```Y``` are similar if we can swap two letters (in different positions) of ```X```, so that it equals ```Y```. Also two strings ```X``` and ```Y``` are similar if they are equal.

For example, ```"tars"``` and ```"rats"``` are similar (swapping at positions ```0``` and ```2```), and ```"rats"``` and ```"arts"``` are similar, but ```"star"``` is not similar to ```"tars"```, ```"rats"```, or ```"arts"```.

Together, these form two connected groups by similarity: ```{"tars", "rats", "arts"}``` and ```{"star"}```.  Notice that ```"tars"``` and ```"arts"``` are in the same group even though they are not similar.  Formally, each group is such that a word is in the group if and only if it is similar to at least one other word in the group.

We are given a list ```strs``` of strings where every string in ```strs``` is an anagram of every other string in ```strs```. How many groups are there?

![image](https://user-images.githubusercontent.com/35042430/235188769-f59d6ff8-3bcc-4b2e-832e-28c91bf21093.png)

---

__Example 1:__
```
Input: strs = ["tars","rats","arts","star"]
Output: 2
```

__Example 2:__
```
Input: strs = ["omv","ovm"]
Output: 1
```

__Constraints:__

- ```1 <= strs.length <= 300```
- ```1 <= strs[i].length <= 300```
- ```strs[i]``` consists of lowercase letters only.
- All words in ```strs``` have the same length and are anagrams of each other.

---
