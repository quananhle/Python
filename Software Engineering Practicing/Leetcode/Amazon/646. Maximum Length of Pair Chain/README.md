## [646. Maximum Length of Pair Chain](https://leetcode.com/problems/maximum-length-of-pair-chain/)

```Tag```:

#### Difficulty: Medium

You are given an array of ```n``` pairs ```pairs``` where ```pairs[i] = [lefti, righti]``` and ```lefti < righti```.

A pair ```p2 = [c, d]``` follows a pair ```p1 = [a, b]``` if ```b < c```. A chain of pairs can be formed in this fashion.

Return _the length longest chain which can be formed_.

You do not need to use up all the given intervals. You can select pairs in any order.

![image](https://github.com/quananhle/Python/assets/35042430/93fe27e4-db8d-45fc-a192-63992ce0bffe)

---

__Example 1:__
```
Input: pairs = [[1,2],[2,3],[3,4]]
Output: 2
Explanation: The longest chain is [1,2] -> [3,4].
```

__Example 2:__
```
Input: pairs = [[1,2],[7,8],[4,5]]
Output: 3
Explanation: The longest chain is [1,2] -> [4,5] -> [7,8].
```

__Constraints:__

- $n == pairs.length$
- $1 \le n \le 1000$
- $-1000 \le lefti \lt righti \le 1000$

---
