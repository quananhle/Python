## [287. Find the Duplicate Number](https://leetcode.com/problems/find-the-duplicate-number)

```Tag```: ```Binary Search``` ```Sorting```

#### Difficulty: Medium

Given an array of integers nums containing ```n + 1``` integers where each integer is in the range ```[1, n]``` inclusive.

There is only one repeated number in ```nums```, return _this repeated number_.

You must solve the problem without modifying the array nums and uses only constant extra space.

![image](https://user-images.githubusercontent.com/35042430/234982483-9d1d458a-9716-4473-8fea-a3b3e3ce7442.png)

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

- 1 <= ```n``` <= 10<sup>5</sup>
- ```nums.length == n + 1```
- ```1 <= nums[i] <= n```
- All the integers in ```nums``` appear only once except for precisely one integer which appears two or more times.

---

__Proof__

Proving that at least one duplicate must exist in ```nums``` is an application of the [pigeonhole principle](https://en.wikipedia.org/wiki/Pigeonhole_principle). Here, each number in ```nums``` is a "```pigeon```" and each distinct number that can appear in ```nums``` is a "```pigeonhole```." Because there are ```n + 1``` numbers and ```n``` distinct possible numbers, the pigeonhole principle implies that if you were to put each of the ```n+1``` pigeons into ```n``` pigeonholes, at least one of the pigeonholes would have ```2``` or more pigeons.

### Sorting & Linear Search

```Python
class Solution:
    def findDuplicate(self, nums: List[int]) -> int:
        # Sort
        n = len(nums)
        nums.sort()
        for i in range(1, n):
            if nums[i] == nums[i - 1]:
                return nums[i]
```

### Sorting & Binary Search

```Python

```

__Follow up:__

- How can we prove that at least one duplicate number must exist in nums?
- Can you solve the problem in linear runtime complexity?
