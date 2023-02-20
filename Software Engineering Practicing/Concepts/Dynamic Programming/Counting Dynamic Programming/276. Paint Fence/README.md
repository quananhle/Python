## 276. Paint Fence

```Tag```: ```Dynamic Programming```

#### Difficulty: Medium

You are painting a fence of ```n``` posts with ```k``` different colors. You must paint the posts following these rules:

- Every post must be painted __exactly one__ color.
- There __cannot__ be three or more __consecutive__ posts with the same color.

Given the two integers ```n``` and ```k```, return _the number of ways you can paint the fence_.

![image](https://user-images.githubusercontent.com/35042430/220183689-88bb2baf-cb55-49a5-a1b3-498ff2845cae.png)

---

Example 1:

![image](https://assets.leetcode.com/uploads/2021/02/28/paintfenceex1.png)
```
Input: n = 3, k = 2
Output: 6
Explanation: All the possibilities are shown.
Note that painting all the posts red or all the posts green is invalid because there cannot be three posts in a row with the same color.
```

__Example 2:__
```
Input: n = 1, k = 1
Output: 1
```

__Example 3:__
```
Input: n = 7, k = 2
Output: 42
```

__Constraints:__

- ```1 <= n <= 50```
- ```1 <= k <= 105```
- The testcases are generated such that the answer is in the range ```[0, 2^31 - 1]``` for the given ```n``` and ```k```.

---
