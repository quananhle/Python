## [1481. Least Number of Unique Integers after K Removals](https://leetcode.com/problems/least-number-of-unique-integers-after-k-removals)

```Tag```:

#### Difficulty: Medium

Given an array of integers arr and an integer k. Find the least number of unique integers after removing exactly k elements.

![image](https://github.com/quananhle/Python/assets/35042430/3d39e22a-9317-4323-895f-33f007fb319a)

---

__Example 1:__
```
Input: arr = [5,5,4], k = 1
Output: 1
Explanation: Remove the single 4, only 5 is left.
Example 2:
Input: arr = [4,3,1,1,3,3,2], k = 3
Output: 2
Explanation: Remove 4, 2 and either one of the two 1s or three 3s. 1 and 3 will be left.
```

__Constraints:__

- $1 \le arr.length \le 10^5$
- $1 \le arr[i] \le 10^9$
- $0 \le k \le arr.length$

---
