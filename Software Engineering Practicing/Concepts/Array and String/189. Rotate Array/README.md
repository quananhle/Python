## 189. Rotate Array

```Tag```: ```Two Pointers``` ```Stack``` ```Splicing```

#### Difficulty: Medium

Given an array, rotate the array to the right by ```k``` steps, where ```k``` is non-negative.

![image](https://user-images.githubusercontent.com/35042430/210019065-ea0ee90a-dc60-4509-8f6e-eccdba3ef0fb.png)

---

__Example 1:__
```
Input: nums = [1,2,3,4,5,6,7], k = 3
Output: [5,6,7,1,2,3,4]
Explanation:
rotate 1 steps to the right: [7,1,2,3,4,5,6]
rotate 2 steps to the right: [6,7,1,2,3,4,5]
rotate 3 steps to the right: [5,6,7,1,2,3,4]
```

__Example 2:__
```
Input: nums = [-1,-100,3,99], k = 2
Output: [3,99,-1,-100]
Explanation: 
rotate 1 steps to the right: [99,-1,-100,3]
rotate 2 steps to the right: [3,99,-1,-100]
```

__Constraints:__
```
1 <= nums.length <= 105
-231 <= nums[i] <= 231 - 1
0 <= k <= 105
```

---
