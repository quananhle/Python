## 941. Valid Mountain Array

```Tag```: ```Two-Pointer```

#### Difficulty: Easy

Given an array of integers ```arr```, return _```true``` if and only if it is a valid mountain array_.

Recall that ```arr``` is a mountain array if and only if:

- arr.length >= 3
- There exists some i with 0 < i < arr.length - 1 such that:
  - arr[0] < arr[1] < ... < arr[i - 1] < arr[i] 
  - arr[i] > arr[i + 1] > ... > arr[arr.length - 1]

![image](https://assets.leetcode.com/uploads/2019/10/20/hint_valid_mountain_array.png)

![image](https://user-images.githubusercontent.com/35042430/212525271-e8ded11a-1753-40af-9607-1b80b2a400de.png)

---
