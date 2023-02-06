## 779. K-th Symbol in Grammar

```Tag```: ```Recursion```

#### Difficulty: Medium

We build a table of ```n``` rows (__1-indexed__). We start by writing ```0``` in the 1<sup>st</sup> row. Now in every subsequent row, we look at the previous row and replace each occurrence of ```0``` with ```01```, and each occurrence of ```1``` with ```10```.

For example, for ```n = 3```, the 1<sup>st</sup> row is ```0```, the 2<sup>nd</sup> row is ```01```, and the 3<sup>rd</sup> row is ```0110```.
Given two integer ```n``` and ```k```, return _the k<sup>th</sup> (__1-indexed__) symbol in the n<sup>th</sup> row of a table of ```n``` rows_.

![image](https://user-images.githubusercontent.com/35042430/217025342-0682e08f-7e78-4f97-8d11-465bee862b93.png)

---

__Example 1:__
```
Input: n = 1, k = 1
Output: 0
Explanation: row 1: 0
```

__Example 2:__
```
Input: n = 2, k = 1
Output: 0
Explanation: 
row 1: 0
row 2: 01
```

__Example 3:__
```
Input: n = 2, k = 2
Output: 1
Explanation: 
row 1: 0
row 2: 01
```

__Constraints:__

- ```1 <= n <= 30```
- ```1 <= k <= 2^(n - 1)```

---
