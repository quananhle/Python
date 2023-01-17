## 487. Max Consecutive Ones II

```Tag```: ```Sliding Window```

#### Difficulty: Medium

Given a binary array ```nums```, return _the maximum number of consecutive ```1```'s in the array if you can flip at most one ```0```_.

![image](https://user-images.githubusercontent.com/35042430/212833830-88349a94-08ff-4a4d-a1d8-7f6e1541ded5.png)

---

__Example 1:__
```
Input: nums = [1,0,1,1,0]
Output: 4
Explanation: 
- If we flip the first zero, nums becomes [1,1,1,1,0] and we have 4 consecutive ones.
- If we flip the second zero, nums becomes [1,0,1,1,1] and we have 3 consecutive ones.
The max number of consecutive ones is 4.
```

__Example 2:__
```
Input: nums = [1,0,1,1,0,1]
Output: 4
Explanation: 
- If we flip the first zero, nums becomes [1,1,1,1,0,1] and we have 4 consecutive ones.
- If we flip the second zero, nums becomes [1,0,1,1,1,1] and we have 4 consecutive ones.
The max number of consecutive ones is 4.
```

__Constraints:__
```
1 <= nums.length <= 105
nums[i] is either 0 or 1.
```

---

### Brute Force

```Python

```

__Follow up__: What if the input numbers come in one by one as an infinite stream? In other words, you can't store all numbers coming from the stream as it's too large to hold in memory. Could you solve it efficiently?

### Sliding Window

```Python

```


