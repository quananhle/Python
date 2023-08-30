## [1183. Maximum Number of Ones](https://leetcode.com/problems/maximum-number-of-ones/)

```Tag```:

#### Difficulty: Hard

Consider a matrix ```M``` with dimensions ```width * height```, such that every cell has value ```0``` or ```1```, and any square sub-matrix of ```M``` of size ```sideLength * sideLength``` has at most ```maxOnes``` ones.

Return _the maximum possible number of ones that the matrix ```M``` can have_.

![image](https://github.com/quananhle/Python/assets/35042430/acc9b3db-b86e-41c3-b128-54b21de3159b)

---

__Example 1:__
```
Input: width = 3, height = 3, sideLength = 2, maxOnes = 1
Output: 4
Explanation:
In a 3*3 matrix, no 2*2 sub-matrix can have more than 1 one.
The best solution that has 4 ones is:
[1,0,1]
[0,0,0]
[1,0,1]
```

__Example 2:__
```
Input: width = 3, height = 3, sideLength = 2, maxOnes = 2
Output: 6
Explanation:
[1,0,1]
[1,0,1]
[1,0,1]
```

__Constraints:__

- $1 \le width, height \le 100$
- $1 \le sideLength \le width, height$
- $0 \le maxOnes \le sideLength \cdot sideLength$

---
