## [791. Custom Sort String](https://leetcode.com/problems/custom-sort-string)

```Tag```:

#### Difficulty: Medium

You are given two strings ```order``` and ```s```. All the characters of ```order``` are unique and were sorted in some custom order previously.

Permute the characters of ```s``` so that they match the order that ```order``` was sorted. More specifically, if a character ```x``` occurs before a character ```y``` in ```order```, then ```x``` should occur before ```y``` in the permuted string.

Return _any permutation of ```s``` that satisfies this property_.

![image](https://github.com/quananhle/Python/assets/35042430/87807a08-1288-48e6-8112-760099eb06cd)

---

__Example 1:__
```
Input:  order = "cba", s = "abcd" 

Output:  "cbad" 

Explanation: "a", "b", "c" appear in order, so the order of "a", "b", "c" should be "c", "b", and "a".

Since "d" does not appear in order, it can be at any position in the returned string. "dcba", "cdba", "cbda" are also valid outputs.
```

__Example 2:__
```
Input:  order = "bcafg", s = "abcd" 

Output:  "bcad" 

Explanation: The characters "b", "c", and "a" from order dictate the order for the characters in s. The character "d" in s does not appear in order, so its position is flexible.

Following the order of appearance in order, "b", "c", and "a" from s should be arranged as "b", "c", "a". "d" can be placed at any position since it's not in order. The output "bcad" correctly follows this rule. Other arrangements like "bacd" or "bcda" would also be valid, as long as "b", "c", "a" maintain their order.
```


__Constraints:__

- $1 \le order.length \le 26$
- $1 \le s.length \le 200$
- ```order``` and ```s``` consist of lowercase English letters.
- All the characters of ```order``` are unique.

---
