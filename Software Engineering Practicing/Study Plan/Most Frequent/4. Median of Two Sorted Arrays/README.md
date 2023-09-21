## [4. Median of Two Sorted Arrays](https://leetcode.com/problems/median-of-two-sorted-arrays)

```Tag```:

#### Difficulty: Hard

Given two sorted arrays ```nums1``` and ```nums2``` of size ```m``` and ```n``` respectively, return _the median of the two sorted arrays_.

The overall run time complexity should be $\mathcal{O}(\log (m+n))$.

![image](https://github.com/quananhle/Python/assets/35042430/80128db9-2cb7-4c23-a970-8359c558ea54)

---

__Example 1:__
```
Input: nums1 = [1,3], nums2 = [2]
Output: 2.00000
Explanation: merged array = [1,2,3] and median is 2.
```

__Example 2:__
```
Input: nums1 = [1,2], nums2 = [3,4]
Output: 2.50000
Explanation: merged array = [1,2,3,4] and median is (2 + 3) / 2 = 2.5.
```

__Constraints:__

- $nums1.length == m$
- $nums2.length == n$
- $0 \le m \le 1000$
- $0 \le n \le 1000$
- $1 \le m + n \le 2000$
- $-10^{6} \le nums1[i], nums2[i] \le 10^{6}$

---
