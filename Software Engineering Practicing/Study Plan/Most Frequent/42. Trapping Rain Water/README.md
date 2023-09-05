## [42. Trapping Rain Water](https://leetcode.com/problems/trapping-rain-water/)

```Tag```: ```Dynamic Programming```

#### Difficulty: Hard

Given ```n``` non-negative integers representing an elevation map where the width of each bar is ```1```, compute how much water it can trap after raining.

![image](https://github.com/quananhle/Python/assets/35042430/404a8828-0ecd-4777-8d13-3a59b602b473)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2018/10/22/rainwatertrap.png)
```
Input: height = [0,1,0,2,1,0,1,3,2,1,2,1]
Output: 6
Explanation: The above elevation map (black section) is represented by array [0,1,0,2,1,0,1,3,2,1,2,1]. In this case, 6 units of rain water (blue section) are being trapped.
```

__Example 2:__
```
Input: height = [4,2,0,3,2,5]
Output: 9
```

__Constraints:__

- $n == height.length$
- $1 \le n \le 2 * 10^{4}$
- $0 \le height[i] \le 10^{5}$

---

### Brute Force

```Python
class Solution:
    def trap(self, height: List[int]) -> int:
        ans = 0
        n = len(height)

        for i in range(1, n - 1):
            left_peak, right_peak = 0, 0
            for j in range(i, -1, -1):
                left_peak = max(left_peak, height[j])
            
            for j in range(i, n):
                right_peak = max(right_peak, height[j])
            
            ans += min(left_peak, right_peak) - height[i]
        
        return ans
```
