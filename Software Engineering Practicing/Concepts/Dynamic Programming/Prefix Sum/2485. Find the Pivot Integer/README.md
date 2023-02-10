## 2485. Find the Pivot Integer

```Tag```: ```Prefix Sum```

#### Difficulty: Easy

Given a positive integer ```n```, find the __pivot integer__ ```x``` such that:

- The sum of all elements between ```1``` and ```x``` inclusively equals the sum of all elements between ```x``` and ```n``` inclusively.

Return _the __pivot integer__ ```x```_. If no such integer exists, return ```-1```. It is guaranteed that there will be at most one pivot index for the given input.

![image](https://user-images.githubusercontent.com/35042430/218198561-2b06b830-04af-4872-be29-80b90e748638.png)

---

__Example 1:__
```
Input: n = 8
Output: 6
Explanation: 6 is the pivot integer since: 1 + 2 + 3 + 4 + 5 + 6 = 6 + 7 + 8 = 21.
```

__Example 2:__
```
Input: n = 1
Output: 1
Explanation: 1 is the pivot integer since: 1 = 1.
```

__Example 3:__
```
Input: n = 4
Output: -1
Explanation: It can be proved that no such integer exist.
```

__Constraints:__

- ```1 <= n <= 1000```

---


