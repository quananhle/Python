## [1318. Minimum Flips to Make a OR b Equal to c](https://leetcode.com/problems/minimum-flips-to-make-a-or-b-equal-to-c/)

```Tag```:

#### Difficulty: Medium

Given 3 positives numbers ```a```, ```b``` and ```c```. Return _the minimum flips required in some bits of ```a``` and ```b``` to make ( ```a``` OR ```b == c``` ). (bitwise OR operation)_.
Flip operation consists of change any single bit 1 to 0 or change the bit 0 to 1 in their binary representation.

![image](https://github.com/quananhle/Python/assets/35042430/c1857a6e-2eee-4a52-8d6d-e9400c9a1658)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/01/06/sample_3_1676.png)
```
Input: a = 2, b = 6, c = 5
Output: 3
Explanation: After flips a = 1 , b = 4 , c = 5 such that (a OR b == c)
```

__Example 2:__
```
Input: a = 4, b = 2, c = 7
Output: 1
```

__Example 3:__
```
Input: a = 1, b = 2, c = 3
Output: 0
```

__Constraints:__

- ```1 <= a <= 10^9```
- ```1 <= b <= 10^9```
- ```1 <= c <= 10^9```

---
