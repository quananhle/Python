## [18. 4Sum](https://leetcode.com/problems/4sum/)

```Tag```: ```Hash Map```

#### Difficulty: Medium

Given an array nums of ```n``` integers, return _an array of all the __unique__ quadruplets_ ```[nums[a], nums[b], nums[c], nums[d]]``` such that:

- ```0 <= a, b, c, d < n```
- ```a```, ```b```, ```c```, and ```d``` are distinct.
- ```nums[a] + nums[b] + nums[c] + nums[d] == target```

You may return the answer in any order.

![image](https://user-images.githubusercontent.com/35042430/214489305-5f40c0c9-6b5c-41f9-bbc9-7c982f1a8f96.png)

---

__Example 1:__
```
Input: nums = [1,0,-1,0,-2,2], target = 0
Output: [[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]
```

__Example 2:__
```
Input: nums = [2,2,2,2,2], target = 8
Output: [[2,2,2,2]]
```

__Constraints:__

- 1 <= nums.length <= 200
- -10<sup>9</sup> <= nums[i] <= 10<sup>9</sup>
- -10<sup>9</sup> <= target <= 10<sup>9</sup>

---

### Two Pointers

#### Hash Map

```Python
class Solution:
    def fourSum(self, nums: List[int], target: int) -> List[List[int]]:
        seen = set()
        n = len(nums)
        res = set()
        for i in range(n):
            for j in range(i+1, n):
                for k in range(j+1, n):
                    complement = target - nums[i] - nums[j] - nums[k]
                    if complement in seen:
                        tmp = sorted([complement, nums[i], nums[j], nums[k]])
                        res.add((tmp[0], tmp[1], tmp[2], tmp[3]))
            seen.add(nums[i])
        return res
```
