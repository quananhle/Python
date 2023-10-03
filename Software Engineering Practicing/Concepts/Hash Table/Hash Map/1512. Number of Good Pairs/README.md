## [1512. Number of Good Pairs](https://leetcode.com/problems/number-of-good-pairs)

```Tag```: ```Hash Map```

#### Difficulty: Easy

Given an array of integers ```nums```, return _the number of good pairs_.

A pair ```(i, j)``` is called good if ```nums[i] == nums[j]``` and ```i < j```.

![image](https://github.com/quananhle/Python/assets/35042430/2e6004d3-c3d0-4218-9ed0-1e217689c106)

---

__Example 1:__
```
Input: nums = [1,2,3,1,1,3]
Output: 4
Explanation: There are 4 good pairs (0,3), (0,4), (3,4), (2,5) 0-indexed.
```

__Example 2:__
```
Input: nums = [1,1,1,1]
Output: 6
Explanation: Each pair in the array are good.
```

__Example 3:__
```
Input: nums = [1,2,3]
Output: 0
```

__Constraints:__

- $1 \le nums.length \le 100$
- $1 \le nums[i] \le 100$

---

### Hash Map

```Python
class Solution:
    def numIdenticalPairs(self, nums: List[int]) -> int:
        counter = dict()
        ans = 0
        for num in nums:
            if not num in counter:
                counter[num] = counter.get(num, 0) + 1
            else:
                ans += counter[num]
                counter[num] += 1
        return ans
```
