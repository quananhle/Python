## [1750. Minimum Length of String After Deleting Similar Ends](https://leetcode.com/problems/minimum-length-of-string-after-deleting-similar-ends)

```Tag```: ```Array & String``` ```Two Pointers```

Given a string ```s``` consisting only of characters ```'a'```, ```'b'```, and ```'c'```. You are asked to apply the following algorithm on the string any number of times:

- Pick a non-empty prefix from the string ```s``` where all the characters in the prefix are equal.
- Pick a non-empty suffix from the string ```s``` where all the characters in this suffix are equal.
- The prefix and the suffix should not intersect at any index.
- The characters from the prefix and suffix must be the same.
- Delete both the prefix and the suffix.

Return _the minimum length of ```s``` after performing the above operation any number of times (possibly zero times)_.

---

__Example 1:__
```
Input: s = "ca"
Output: 2
Explanation: You can't remove any characters, so the string stays as is.
```

__Example 2:__
```
Input: s = "cabaabac"
Output: 0
Explanation: An optimal sequence of operations is:
- Take prefix = "c" and suffix = "c" and remove them, s = "abaaba".
- Take prefix = "a" and suffix = "a" and remove them, s = "baab".
- Take prefix = "b" and suffix = "b" and remove them, s = "aa".
- Take prefix = "a" and suffix = "a" and remove them, s = "".
```

__Example 3:__
```
Input: s = "aabccabba"
Output: 3
Explanation: An optimal sequence of operations is:
- Take prefix = "aa" and suffix = "a" and remove them, s = "bccabb".
- Take prefix = "b" and suffix = "bb" and remove them, s = "cca".
```

__Constraints:__

- $1 \le s.length \le 10^5$
- ```s``` only consists of characters ```'a'```, ```'b'```, and ```'c'```.

---
