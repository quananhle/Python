## [456. 132 Pattern](https://leetcode.com/problems/132-pattern)

```Tag```: ```Stack``` ```Binary Search``` ```Interval```

#### Difficulty: Medium

Given an array of ```n``` integers ```nums```, a 132 pattern is a subsequence of three integers ```nums[i]```, ```nums[j]``` and ```nums[k]``` such that ```i < j < k``` and ```nums[i] < nums[k] < nums[j]```.

Return _```true``` if there is a 132 pattern in ```nums```, otherwise, return ```false```_.

![image](https://github.com/quananhle/Python/assets/35042430/f00dfadc-c9c0-432e-b96b-5a132555fb03)

---

__Example 1:__
```
Input: nums = [1,2,3,4]
Output: false
Explanation: There is no 132 pattern in the sequence.
```

__Example 2:__
```
Input: nums = [3,1,4,2]
Output: true
Explanation: There is a 132 pattern in the sequence: [1, 4, 2].
```

__Example 3:__
```
Input: nums = [-1,3,2,0]
Output: true
Explanation: There are three 132 patterns in the sequence: [-1, 3, 2], [-1, 3, 0] and [-1, 2, 0].
```

__Constraints:__

- $n == nums.length$
- $1 \le n \le 2 * 10^{5}$
- $10^{9} \le nums[i] \le 10^{9}$

---

### Brute Force

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N^3)$
- __Space Complexity__: $\mathcal{O}(1)$

```Python
class Solution:
    def find132pattern(self, nums: List[int]) -> bool:
        for i in range(len(nums) - 2):
            for j in range(i + 1, len(nums) - 1):
                for k in range(j + 1, len(nums)):
                    if nums[k] > nums[i] and nums[j] > nums[k]:
                        return True
        
        return False
```
