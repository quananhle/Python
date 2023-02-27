## [1220. Count Vowels Permutation](https://leetcode.com/problems/count-vowels-permutation/)

```Tag```: ```Dynamic Programming```

#### Difficulty: Hard

Given an integer ```n```, your task is to count how many strings of length ```n``` can be formed under the following rules:

- Each character is a lower case vowel (```'a'```, ```'e'```, ```'i'```, ```'o'```, ```'u'```)
- Each vowel ```'a'``` may only be followed by an ```'e'```.
- Each vowel ```'e'``` may only be followed by an ```'a'``` or an ```'i'```.
- Each vowel ```'i'``` may not be followed by another ```'i'```.
- Each vowel ```'o'``` may only be followed by an ```'i'``` or a ```'u'```.
- Each vowel ```'u'``` may only be followed by an ```'a'```.

Since the answer may be too large, return it modulo ```10^9 + 7```.

![image](https://user-images.githubusercontent.com/35042430/221495440-0c246a29-d2ab-4da8-a920-e867790e3db3.png)

---

__Example 1:__
```
Input: n = 1
Output: 5
Explanation: All possible strings are: "a", "e", "i" , "o" and "u".
```

__Example 2:__
```
Input: n = 2
Output: 10
Explanation: All possible strings are: "ae", "ea", "ei", "ia", "ie", "io", "iu", "oi", "ou" and "ua".
```

__Example 3:__
```
Input: n = 5
Output: 68
```

__Constraints:__

- ```1 <= n <= 2 * 10^4```

---

![image](https://leetcode.com/problems/count-vowels-permutation/Figures/1220/1220-Page-1.png)
_Figure 1. Visualization of the rules._

![image](https://leetcode.com/problems/count-vowels-permutation/Figures/1220/1220-Page-2.png)
_Figure 2. Putting the rules together._

```
aCountNew = eCount + iCount + uCount
eCountNew = aCount + iCount
iCountNew = eCount + oCount
oCountNew = iCount
uCountNew = iCount + oCount
```

### The Framework

#### Top-Down Dynamic Programming (Recursion)

```Python

```
