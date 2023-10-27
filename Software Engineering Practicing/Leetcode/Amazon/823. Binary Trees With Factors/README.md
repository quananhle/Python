## [823. Binary Trees With Factors](https://leetcode.com/problems/binary-trees-with-factors)

```Tag```: ```Dynamic Programming``` ```Binary Tree```

#### Difficulty: Medium

Given an array of unique integers, ```arr```, where each integer ```arr[i]``` is strictly greater than ```1```.

We make a binary tree using these integers, and each number may be used for any number of times. Each non-leaf node's value should be equal to the product of the values of its children.

Return _the number of binary trees we can make_. The answer may be too large so return the answer modulo $10^9 + 7$.

![image](https://github.com/quananhle/Python/assets/35042430/42319ea8-cc2e-4535-94ca-5e19a405d736)

---

__Example 1__:
```
Input: arr = [2,4]
Output: 3
Explanation: We can make these trees: [2], [4], [4, 2, 2]
```

__Example 2__:
```
Input: arr = [2,4,5,10]
Output: 7
Explanation: We can make these trees: [2], [4], [5], [10], [4, 2, 2], [10, 2, 5], [10, 5, 2].
```

__Constraints:__

- $1 \le arr.length \le 1000$
- $2 \le arr[i] \le 10^9$
- All the values of ```arr``` are unique.

---

### Dynamic Programming

```Python


```