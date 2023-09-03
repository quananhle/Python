## [2707. Extra Characters in a String](https://leetcode.com/problems/extra-characters-in-a-string)

```Tag```: ```Dynamic Programming``` ```Trie```

#### Difficulty: Medium

You are given a 0-indexed string ```s``` and a dictionary of words ```dictionary```. You have to break ```s``` into one or more non-overlapping substrings such that each substring is present in ```dictionary```. There may be some extra characters in ```s``` which are not present in any of the substrings.

Return _the minimum number of extra characters left over if you break up ```s``` optimally_.

--- 

__Example 1__:
```
Input: s = "leetscode", dictionary = ["leet","code","leetcode"]
Output: 1
Explanation: We can break s in two substrings: "leet" from index 0 to 3 and "code" from index 5 to 8. There is only 1 unused character (at index 4), so we return 1.
```

__Example 2__:
```
Input: s = "sayhelloworld", dictionary = ["hello","world"]
Output: 3
Explanation: We can break s in two substrings: "hello" from index 3 to 7 and "world" from index 8 to 12. The characters at indices 0, 1, 2 are not used in any substring and thus are considered as extra characters. Hence, we return 3.
```

__Constraints__:

- $1 \le s.length \le 50$
- $1 \le dictionary.length \le 50$
- $1 \le dictionary[i].length \le 50$
- ```dictionary[i]``` and ```s``` consists of only lowercase English letters
- ```dictionary``` contains distinct words

---

### The Framework

#### Top-Down Dynamic Programming

```Python

```

#### Bottom-Up Dynamic Programming

```Python

```

---
