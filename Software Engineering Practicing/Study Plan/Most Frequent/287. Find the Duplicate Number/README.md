## [287. Find the Duplicate Number](https://leetcode.com/problems/find-the-duplicate-number)

```Tag```: ```Array & String``` ```Two Pointers```

#### Difficulty: Medium

Given an array of integers ```nums``` containing __n + 1__ integers where each integer is in the range ```[1, n]``` inclusive.

There is only one repeated number in ```nums```, return _this repeated number_.

You must solve the problem without modifying the array ```nums``` and uses only constant extra space.

![image](https://github.com/quananhle/Python/assets/35042430/485ee903-e230-41a4-8e8a-7929eca64bf1)

---

__Example 1:__
```
Input: nums = [1,3,4,2,2]
Output: 2
```

__Example 2:__
```
Input: nums = [3,1,3,4,2]
Output: 3
```

__Constraints:__

- $1 \le n \le 10^{5}$
- $nums.length == n + 1$
- $1 \le nums[i] \le n$
- All the integers in ```nums``` appear only once except for precisely one integer which appears two or more times.

---

### First Approach: Array Modifications

### Sort()

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(n \log n)$
- __Space Complexity__: $\mathcal{O}(\log n)$ or $\mathcal{O}(n)$

```Python
class Solution:
    def findDuplicate(self, nums: List[int]) -> int:
        nums.sort()
        for i in range(1, len(nums)):
            if nums[i - 1] == nums[i]:
                return nums[i]
        return -1
```

### Set()

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(n)$
- __Space Complexity__: $\mathcal{O}(n)$

```Python
class Solution:
    def findDuplicate(self, nums: List[int]) -> int:
        seen = set()
        for num in nums:
            if num in seen:
                return num
            seen.add(num)
        return -1
```

### Negative Masking

```Python

```

__Follow up__:

- How can we prove that at least one duplicate number must exist in nums?
- Can you solve the problem in linear runtime complexity?
