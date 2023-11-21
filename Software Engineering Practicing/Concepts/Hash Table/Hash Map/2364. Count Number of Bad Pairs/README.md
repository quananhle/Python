## [2364. Count Number of Bad Pairs](https://leetcode.com/problems/count-number-of-bad-pairs)

```Tag```: ```Array & String``` ```Hash Map``` ```Math```

#### Difficulty: Medium

You are given a __0-indexed__ integer array ```nums```. A pair of indices ```(i, j)``` is a bad pair if ```i < j``` and ```j - i != nums[j] - nums[i]```.

Return _the total number of bad pairs in ```nums```_.

---

__Example 1__:
```
Input: nums = [4,1,3,3]
Output: 5
Explanation: The pair (0, 1) is a bad pair since 1 - 0 != 1 - 4.
The pair (0, 2) is a bad pair since 2 - 0 != 3 - 4, 2 != -1.
The pair (0, 3) is a bad pair since 3 - 0 != 3 - 4, 3 != -1.
The pair (1, 2) is a bad pair since 2 - 1 != 3 - 1, 1 != 2.
The pair (2, 3) is a bad pair since 3 - 2 != 3 - 3, 1 != 0.
There are a total of 5 bad pairs, so we return 5.
```

__Example 2__:
```
Input: nums = [1,2,3,4,5]
Output: 0
Explanation: There are no bad pairs.
```

__Constraints:__

- $1 \le nums.length \le 10^5$
- $1 \le nums[i] \le 10^9$

---
