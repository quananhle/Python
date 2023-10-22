## [1793. Maximum Score of a Good Subarray](https://leetcode.com/problems/maximum-score-of-a-good-subarray)

```Tag```: ```Binary Search```

#### Difficulty: Hard

You are given an array of integers ```nums``` __(0-indexed)__ and an integer ```k```.

The score of a subarray ```(i, j)``` is defined as ```min(nums[i], nums[i+1], ..., nums[j]) * (j - i + 1)```. A good subarray is a subarray where $i \le k \le j$.

Return _the maximum possible __score__ of a __good__ subarray_.

![image](https://github.com/quananhle/Python/assets/35042430/251c48d3-d498-4790-b017-4622db9ebfaf)

---

__Example 1:__
```
Input: nums = [1,4,3,7,4,5], k = 3
Output: 15
Explanation: The optimal subarray is (1, 5) with a score of min(4,3,7,4,5) * (5-1+1) = 3 * 5 = 15.
```

__Example 2:__
```
Input: nums = [5,5,4,5,4,1,1,1], k = 0
Output: 20
Explanation: The optimal subarray is (0, 4) with a score of min(5,5,4,5,4) * (4-0+1) = 4 * 5 = 20.
```

__Constraints:__

- $1 \le nums.length \le 10^5$
- $1 \le nums[i] \le 2 * 10^4$
- $0 \le k \lt nums.length$

---

### Binary Search
