## [2616. Minimize the Maximum Difference of Pairs](https://leetcode.com/problems/minimize-the-maximum-difference-of-pairs/)

```Tag```:

#### Difficulty: Medium

You are given a __0-indexed__ integer array ```nums``` and an integer ```p```. Find ```p``` pairs of indices of ```nums``` such that the maximum difference amongst all the pairs is minimized. Also, ensure no index appears more than once amongst the ```p``` pairs.

Note that for a pair of elements at the index ```i``` and ```j```, the difference of this pair is ```|nums[i] - nums[j]|```, where ```|x|``` represents the absolute value of ```x```.

Return _the minimum maximum difference among all ```p``` pairs. We define the maximum of an empty set to be zero.

---

__Example 1__:
```
Input: nums = [10,1,2,7,1,3], p = 2
Output: 1
Explanation: The first pair is formed from the indices 1 and 4, and the second pair is formed from the indices 2 and 5. 
The maximum difference is max(|nums[1] - nums[4]|, |nums[2] - nums[5]|) = max(0, 1) = 1. Therefore, we return 1.
```

__Example 2__:
```
Input: nums = [4,2,1,2], p = 1
Output: 0
Explanation: Let the indices 1 and 3 form a pair. The difference of that pair is |2 - 2| = 0, which is the minimum we can attain.
```

__Constraints__:

- $1 \le nums.length \le 10^{5}$
- $0 \le nums[i] \le 10^{9}$
- $0 \le p \le (nums.length)/2$

---
