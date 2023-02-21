## 918. Maximum Sum Circular Subarray

```Tag```: ```Kadane's Algorithm``` ```Dynamic Programming``` ```Math```

#### Difficulty: Medium

Given a circular integer array ```nums``` of length ```n```, return _the maximum possible sum of a non-empty __subarray__ of ```nums```_.

A __circular array__ means the end of the array connects to the beginning of the array. Formally, the next element of ```nums[i]``` is ```nums[(i + 1) % n]``` and the previous element of ```nums[i]``` is ```nums[(i - 1 + n) % n]```.

A subarray may only include each element of the fixed buffer ```nums``` at most once. Formally, for a subarray ```nums[i], nums[i + 1], ..., nums[j]```, there does not exist ```i <= k1```, ```k2 <= j``` with ```k1 % n == k2 % n```.

![image](https://user-images.githubusercontent.com/35042430/220442598-b5cfc7ef-d21e-4184-aaf0-cedb431aa0ee.png)

---

