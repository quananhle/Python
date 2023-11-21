## [1887. Reduction Operations to Make the Array Elements Equal](https://leetcode.com/problems/reduction-operations-to-make-the-array-elements-equal)

```Tag```:

#### Difficulty: Medium

Given an integer array ```nums```, your goal is to make all elements in ```nums``` equal. To complete one operation, follow these steps:

1. Find the __largest__ value in ```nums```. Let its index be ```i``` (__0-indexed__) and its value be ```largest```. If there are multiple elements with the largest value, pick the smallest ```i```.
2. Find the next largest value in ```nums``` strictly smaller than largest. Let its value be ```nextLargest```.
3. Reduce ```nums[i]``` to ```nextLargest```.

Return _the number of operations to make all elements in ```nums``` equal_.

---

__Example 1:__
```
Input: nums = [5,1,3]
Output: 3
Explanation: It takes 3 operations to make all elements in nums equal:
1. largest = 5 at index 0. nextLargest = 3. Reduce nums[0] to 3. nums = [3,1,3].
2. largest = 3 at index 0. nextLargest = 1. Reduce nums[0] to 1. nums = [1,1,3].
3. largest = 3 at index 2. nextLargest = 1. Reduce nums[2] to 1. nums = [1,1,1].
```

__Example 2:__
```
Input: nums = [1,1,1]
Output: 0
Explanation: All elements in nums are already equal.
```

__Example 3:__
```
Input: nums = [1,1,2,2,3]
Output: 4
Explanation: It takes 4 operations to make all elements in nums equal:
1. largest = 3 at index 4. nextLargest = 2. Reduce nums[4] to 2. nums = [1,1,2,2,2].
2. largest = 2 at index 2. nextLargest = 1. Reduce nums[2] to 1. nums = [1,1,1,2,2].
3. largest = 2 at index 3. nextLargest = 1. Reduce nums[3] to 1. nums = [1,1,1,1,2].
4. largest = 2 at index 4. nextLargest = 1. Reduce nums[4] to 1. nums = [1,1,1,1,1].
```

__Constraints:__

- $1 \le nums.length \le 5 * 10^4$
- $1 \le nums[i] \le 5 * 10^4$

---
