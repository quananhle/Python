## [97. Interleaving String](https://leetcode.com/problems/interleaving-string/)

```Tag```: ```Dynamic Programming``` ```Recursion```

#### Difficulty: Medium

Given strings ```s1```, ```s2```, and ```s3```, find whether ```s3``` is formed by an interleaving of ```s1``` and ```s2```.

An interleaving of two strings ```s``` and ```t``` is a configuration where ```s``` and ```t``` are divided into ```n``` and ```m``` substrings respectively, such that:

- ```s``` = s<sub>1</sub> + s<sub>2</sub> + ... + s<sub>n</sub>
- ```t``` = t<sub>1</sub> + t<sub>2</sub> + ... + t<sub>m</sub>
- ```|n - m| <= 1```
- The interleaving is s<sub>1</sub> + t<sub>1</sub> + s<sub>2</sub> + t<sub>2</sub> + s<sub>3</sub> + t<sub>3</sub> + ... or t<sub>1</sub> + s<sub>1</sub> + t<sub>2</sub> + s<sub>2</sub> + t<sub>3</sub> + s<sub>3</sub> + ...

Note: ```a + b``` is the concatenation of strings ```a``` and ```b```.

![image](https://user-images.githubusercontent.com/35042430/222198491-62aae9c0-6fdb-43bf-ab8f-a90a9dbf6942.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/09/02/interleave.jpg)
```
Input: s1 = "aabcc", s2 = "dbbca", s3 = "aadbbcbcac"
Output: true
Explanation: One way to obtain s3 is:
Split s1 into s1 = "aa" + "bc" + "c", and s2 into s2 = "dbbc" + "a".
Interleaving the two splits, we get "aa" + "dbbc" + "bc" + "a" + "c" = "aadbbcbcac".
Since s3 can be obtained by interleaving s1 and s2, we return true.
```

__Example 2:__
```
Input: s1 = "aabcc", s2 = "dbbca", s3 = "aadbbbaccc"
Output: false
Explanation: Notice how it is impossible to interleave s2 with any other string to obtain s3.
```

__Example 3:__
```
Input: s1 = "", s2 = "", s3 = ""
Output: true
```

__Constraints:__

- ```0 <= s1.length, s2.length <= 100```
- ```0 <= s3.length <= 200```
- ```s1```, ```s2```, and ```s3``` consist of lowercase English letters.
 
---

###

__Follow up__: Could you solve it using only ```O(s2.length)``` additional memory space?
