## [368. Largest Divisible Subset](https://leetcode.com/problems/largest-divisible-subset)

```Tag```:

#### Difficulty: Medium

Given a set of distinct positive integers ```nums```, return _the largest subset answer such that every pair ```(answer[i], answer[j])``` of elements in this subset satisfies_:

- $answer[i] % answer[j] == 0$, or
- $answer[j] % answer[i] == 0$

If there are multiple solutions, return _any of them_.

![image](https://github.com/quananhle/Python/assets/35042430/b321b61f-97a0-4248-8f21-d26b772d7431)

---

__Example 1:__
```
Input: n = 12
Output: 3
Explanation: 12 = 4 + 4 + 4.
```

__Example 2:__
```
Input: n = 13
Output: 2
Explanation: 13 = 4 + 9.
```

__Constraints:__

- $1 \le n \le 10^4$

---
