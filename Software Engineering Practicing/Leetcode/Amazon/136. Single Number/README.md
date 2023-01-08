## 136. Single Number

```Tag```: ```Math``` ```Hash Table``` ```Hash Set``` ```Bit Manipulation```

#### Difficulty: Easy

Given an integer array ```nums``` and an integer ```k```, return _```true``` if there are two distinct indices ```i``` and ```j``` in the array such that ```nums[i] == nums[j]``` and ```abs(i - j) <= k```_.

![image](https://user-images.githubusercontent.com/35042430/211179629-d2905e99-089a-4e26-93c2-408fb447b325.png)

---

__Example 1:__
```
Input: nums = [1,2,3,1], k = 3
Output: true
```

__Example 2:__
```
Input: nums = [1,0,1,1], k = 1
Output: true
```

__Example 3:__
```
Input: nums = [1,2,3,1,2,3], k = 2
Output: false
```

__Constraints:__
```
1 <= nums.length <= 105
-109 <= nums[i] <= 109
0 <= k <= 105
```

---

