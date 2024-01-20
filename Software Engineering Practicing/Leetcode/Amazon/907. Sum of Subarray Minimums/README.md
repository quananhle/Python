## [907. Sum of Subarray Minimums](https://leetcode.com/problems/sum-of-subarray-minimums)

```Tag```:

#### Difficulty: Medium

Given an array of integers ```arr```, find the sum of ```min(b)```, where ```b``` ranges over every (contiguous) subarray of ```arr```. Since the answer may be large, return the answer modulo $10^9 + 7$.

![image](https://github.com/quananhle/Python/assets/35042430/b34d62f7-5d0d-424f-b65d-f758c3b212a0)

---

__Example 1:__
```
Input: arr = [3,1,2,4]
Output: 17
Explanation: 
Subarrays are [3], [1], [2], [4], [3,1], [1,2], [2,4], [3,1,2], [1,2,4], [3,1,2,4]. 
Minimums are 3, 1, 2, 4, 1, 1, 2, 1, 1, 1.
Sum is 17.
```

__Example 2:__
```
Input: arr = [11,81,94,43,3]
Output: 444
```

__Constraints:__

- $1 \le arr.length \le 3 * 10^4$
- $1 \le arr[i] \le 3 * 10^4$

---
