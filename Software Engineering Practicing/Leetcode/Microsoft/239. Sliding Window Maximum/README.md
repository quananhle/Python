## [239. Sliding Window Maximum](https://leetcode.com/problems/sliding-window-maximum/)

```Tag```: ```Sliding Window```

#### Difficulty: Hard

You are given an array of integers ```nums```, there is a sliding window of size ```k``` which is moving from the very left of the array to the very right. You can only see the ```k``` numbers in the window. Each time the sliding window moves right by one position.

Return __the max sliding window__.

![image](https://github.com/quananhle/Python/assets/35042430/db529708-b29f-48a2-afc1-54a017f46efd)

---
 
__Example 1:__
```
Input: nums = [1,3,-1,-3,5,3,6,7], k = 3
Output: [3,3,5,5,6,7]
Explanation: 
Window position                Max
---------------               -----
[1  3  -1] -3  5  3  6  7       3
 1 [3  -1  -3] 5  3  6  7       3
 1  3 [-1  -3  5] 3  6  7       5
 1  3  -1 [-3  5  3] 6  7       5
 1  3  -1  -3 [5  3  6] 7       6
 1  3  -1  -3  5 [3  6  7]      7
```

__Example 2:__
```
Input: nums = [1], k = 1
Output: [1]
```

__Constraints:__

- $1 \le nums.length \le 10^{5}$
- $-10^{4} \le nums[i] \le 10^{4}$
- $1 \le k \le nums.length$

---

### Brute-Force (Time Limit Exceeded)

```Python
class Solution:
    def maxSlidingWindow(self, nums: List[int], k: int) -> List[int]:
        start = 0
        n = len(nums)
        res = list()

        for end in range(start + k, max(n, start + k) + 1):
            res.append(max(nums[start:end]))
            start += 1
        
        return res
```
