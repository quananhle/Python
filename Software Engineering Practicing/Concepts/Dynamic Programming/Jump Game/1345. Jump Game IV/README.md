## [1345. Jump Game IV](https://leetcode.com/problems/jump-game-iv/)

```Tag```: ```Dynamic Programming```

#### Difficulty: Hard

Given an array of integers ```arr```, you are initially positioned at the first index of the array.

In one step you can jump from index ```i``` to index:

- ```i + 1``` where: ```i + 1 < arr.length```.
- ```i - 1``` where: ```i - 1 >= 0```.
- ```j``` where: ```arr[i] == arr[j]``` and ```i != j```.

Return _the minimum number of steps to reach the last index of the array_.

Notice that you can not jump outside of the array at any time.

![image](https://user-images.githubusercontent.com/35042430/222947239-a571eac0-ef57-40bc-aff9-e3fd18d67d86.png)

---

__Example 1:__
```
Input: arr = [100,-23,-23,404,100,23,23,23,3,404]
Output: 3
Explanation: You need three jumps from index 0 --> 4 --> 3 --> 9. Note that index 9 is the last index of the array.
```

__Example 2:__
```
Input: arr = [7]
Output: 0
Explanation: Start index is the last index. You do not need to jump.
```

__Example 3:__
```
Input: arr = [7,6,9,6,9,6,9,7]
Output: 1
Explanation: You can jump directly from index 0 to index 7 which is last index of the array.
```

__Constraints:__

- 1 <= ```arr.length``` <= 5 * 10<sup>4</sup>
- -10<sup>8</sup> <= ```arr[i]``` <= 10<sup>8</sup>

---
