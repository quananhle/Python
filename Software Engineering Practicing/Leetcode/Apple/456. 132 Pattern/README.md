## [456. 132 Pattern](https://leetcode.com/problems/132-pattern)

```Tag```:

#### Difficulty: Medium

Given an array of ```n``` integers ```nums```, a 132 pattern is a subsequence of three integers ```nums[i]```, ```nums[j]``` and ```nums[k]``` such that ```i < j < k``` and ```nums[i] < nums[k] < nums[j]```.

Return _```true``` if there is a 132 pattern in ```nums```, otherwise, return ```false```_.

![image](https://github.com/quananhle/Python/assets/35042430/f00dfadc-c9c0-432e-b96b-5a132555fb03)

---

Example 1:

Input: nums = [1,2,3,4]
Output: false
Explanation: There is no 132 pattern in the sequence.
Example 2:

Input: nums = [3,1,4,2]
Output: true
Explanation: There is a 132 pattern in the sequence: [1, 4, 2].
Example 3:

Input: nums = [-1,3,2,0]
Output: true
Explanation: There are three 132 patterns in the sequence: [-1, 3, 2], [-1, 3, 0] and [-1, 2, 0].
 

Constraints:

n == nums.length
1 <= n <= 2 * 105
-109 <= nums[i] <= 109

---
