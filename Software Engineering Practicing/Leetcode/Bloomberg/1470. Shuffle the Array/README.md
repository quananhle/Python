## 1470. Shuffle the Array

```Tag```:

#### Difficulty: Easy

Given the array ```nums``` consisting of ```2n``` elements in the form [x<sub>1</sub>,x<sub>2</sub>,...,x<sub>n</sub>,y<sub>1</sub>,y<sub>2</sub>,...,y<sub>n</sub>].

Return _the array in the form [x<sub>1</sub>,y<sub>1</sub>,x<sub>2</sub>,y<sub>2</sub>,...,x<sub>n</sub>,y<sub>n</sub>]_.

![image](https://user-images.githubusercontent.com/35042430/216894087-34a31a5b-13c6-4f8d-8972-bb6ee6a32528.png)

---

__Example 1:__
```
Input: nums = [2,5,1,3,4,7], n = 3
Output: [2,3,5,4,1,7] 
Explanation: Since x1=2, x2=5, x3=1, y1=3, y2=4, y3=7 then the answer is [2,3,5,4,1,7].
```

__Example 2:__
```
Input: nums = [1,2,3,4,4,3,2,1], n = 4
Output: [1,4,2,3,3,2,4,1]
```

__Example 3:__
```
Input: nums = [1,1,2,2], n = 2
Output: [1,2,1,2]
```

__Constraints:__

- ```1 <= n <= 500```
- ```nums.length == 2n```
- ```1 <= nums[i] <= 10^3```

---
