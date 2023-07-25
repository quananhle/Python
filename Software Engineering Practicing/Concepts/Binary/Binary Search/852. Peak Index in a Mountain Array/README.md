## [852. Peak Index in a Mountain Array](https://leetcode.com/problems/peak-index-in-a-mountain-array/)

```Tag```: ```Binary Search```

#### Difficulty: Medium

An array ```arr``` a mountain if the following properties hold:

- ```arr.length >= 3```
- There exists some ```i``` with ```0 < i < arr.length - 1``` such that:
    - ```arr[0] < arr[1] < ... < arr[i - 1] < arr[i]```
    - ```arr[i] > arr[i + 1] > ... > arr[arr.length - 1]```

Given a mountain array ```arr```, return _the index ```i``` such that ```arr[0] < arr[1] < ... < arr[i - 1] < arr[i] > arr[i + 1] > ... > arr[arr.length - 1]```_.

You must solve it in ```O(log(arr.length))``` time complexity.

![image](https://github.com/quananhle/Python/assets/35042430/2978a749-4136-4271-a964-56778fb8bb63)

---

__Example 1:__
```
Input: arr = [0,1,0]
Output: 1
```

__Example 2:__
```
Input: arr = [0,2,1,0]
Output: 1
```

__Example 3:__
```
Input: arr = [0,10,5,2]
Output: 1
```

__Constraints:__

- $3 \le arr.length \le 10^{5}$
- $0 \le arr[i] \le 10^{6}$
- ```arr``` is guaranteed to be a mountain array.

---
