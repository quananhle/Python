## 220. Contains Duplicate III

```Tag```: ```Binary Search Tree```

#### Difficulty: Hard

You are given an integer array ```nums``` and two integers ```indexDiff``` and ```valueDiff```. Find a pair of indices ```(i, j)``` such that:

- ```i != j```,
- ```abs(i - j) <= indexDiff```.
- ```abs(nums[i] - nums[j]) <= valueDiff```, 

and return _```true``` if such pair exists or ```false``` otherwise_.

![image](https://user-images.githubusercontent.com/35042430/216531043-a674984d-ded0-4318-b72a-1a89edfeb5d7.png)

---

__Example 1:__
```
Input: nums = [1,2,3,1], indexDiff = 3, valueDiff = 0
Output: true
Explanation: We can choose (i, j) = (0, 3).
We satisfy the three conditions:
i != j --> 0 != 3
abs(i - j) <= indexDiff --> abs(0 - 3) <= 3
abs(nums[i] - nums[j]) <= valueDiff --> abs(1 - 1) <= 0
```

__Example 2:__
```
Input: nums = [1,5,9,1,5,9], indexDiff = 2, valueDiff = 3
Output: false
Explanation: After trying all the possible pairs (i, j), we cannot satisfy the three conditions, so we return false.
```

__Constraints:__

- 2 <= ```nums.length``` <= 10<sup>5</sup>
- -10<sup>9</sup> <= ```nums[i]``` <= 10<sup>9</sup>
- ```1 <= indexDiff <= nums.length```
- 0 <= ```valueDiff``` <= 10<sup>9</sup>

---

### Sliding Window

```Python
class Solution:
    def containsNearbyAlmostDuplicate(self, nums: List[int], indexDiff: int, valueDiff: int) -> bool:
        # Brute Force Sliding Window
        n = len(nums)
        for i in range(n):
            # i != j
            # abs(i - j) <= indexDiff
            for j in range(max(i - indexDiff, 0), i):
                # abs(nums[i] - nums[j]) <= valueDiff
                if abs(nums[i] - nums[j]) <= valueDiff:
                    return True
        return False
```
