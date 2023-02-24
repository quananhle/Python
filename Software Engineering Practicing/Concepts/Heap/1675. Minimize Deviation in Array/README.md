## 1675. Minimize Deviation in Array

```Tag```:

#### Difficulty: Hard

You are given an array nums of ```n``` positive integers.

You can perform two types of operations on any element of the array any number of times:

- If the element is even, divide it by ```2```.
  - For example, if the array is ```[1,2,3,4]```, then you can do this operation on the last element, and the array will be ```[1,2,3,2]```.

- If the element is odd, multiply it by ```2```.
  - For example, if the array is ```[1,2,3,4]```, then you can do this operation on the first element, and the array will be ```[2,2,3,4]```.
  
The __deviation__ of the array is the __maximum difference__ between any two elements in the array.

Return _the __minimum deviation__ the array can have after performing some number of operations_.

![image](https://user-images.githubusercontent.com/35042430/221092455-ad92ae65-2f5c-4990-8240-18e59e06f909.png)

---

__Example 1:__
```
Input: nums = [1,2,3,4]
Output: 1
Explanation: You can transform the array to [1,2,3,2], then to [2,2,3,2], then the deviation will be 3 - 2 = 1.
```

__Example 2:__
```
Input: nums = [4,1,5,20,3]
Output: 3
Explanation: You can transform the array after two operations to [4,2,5,5,3], then the deviation will be 5 - 2 = 3.
```

__Example 3:__
```
Input: nums = [2,10,8]
Output: 3
```

__Constraints:__

- ```n == nums.length```
- 2 <= ```n``` <= 5 * 10<sup>4</sup>
- 1 <= ```nums[i]``` <= 10<sup>9</sup>

---

