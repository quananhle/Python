## [719. Find K-th Smallest Pair Distance](https://leetcode.com/problems/find-k-th-smallest-pair-distance)

```Tag```: ```Binary Search```

#### Difficulty: Hard

The distance of a pair of integers ```a``` and ```b``` is defined as the absolute difference between ```a``` and ```b```.

Given an integer array ```nums``` and an integer ```k```, return _the k<sup>th</sup> smallest distance among all the pairs ```nums[i]``` and ```nums[j]``` where ```0 <= i < j < nums.length```_.

![image](https://user-images.githubusercontent.com/35042430/235253137-f74a1514-126b-407e-bc97-adc0f6cde8f4.png)

---

__Example 1:__
```
Input: nums = [1,3,1], k = 1
Output: 0
Explanation: Here are all the pairs:
(1,3) -> 2
(1,1) -> 0
(3,1) -> 2
Then the 1st smallest distance pair is (1,1), and its distance is 0.
```

__Example 2:__
```
Input: nums = [1,1,1], k = 2
Output: 0
```

__Example 3:__
```
Input: nums = [1,6,1], k = 3
Output: 5
```

__Constraints:__

- ```n == nums.length```
- 2 <= ```n``` <= 10<sup>4</sup>
- 0 <= ```nums[i]``` <= 10<sup>6</sup>
- ```1 <= k <= n * (n - 1) / 2```

---
