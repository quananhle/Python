## [1004. Max Consecutive Ones III](https://leetcode.com/problems/max-consecutive-ones-iii)

```Tag```: ```Sliding Window``` ```Two Pointers```

#### Difficulty: Medium

Given a binary array ```nums``` and an integer ```k```, return _the maximum number of consecutive ```1```'s in the array if you can flip at most ```k``` ```0```'s_.

![image](https://github.com/quananhle/Python/assets/35042430/2d4f8ad2-7882-4360-8b73-b3c66fa2ce22)

---

__Example 1:__
```
Input: nums = [1,1,1,0,0,0,1,1,1,1,0], k = 2
Output: 6
Explanation: [1,1,1,0,0,1,1,1,1,1,1]
Bolded numbers were flipped from 0 to 1. The longest subarray is underlined.
```

__Example 2:__
```
Input: nums = [0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1], k = 3
Output: 10
Explanation: [0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1]
Bolded numbers were flipped from 0 to 1. The longest subarray is underlined.
```

__Constraints:__

- ```1 <= nums.length <= 10^5```
- ```nums[i]``` is either ```0``` or ```1```.
- ```0 <= k <= nums.length```

---
 
![image](https://leetcode.com/problems/max-consecutive-ones-iii/Figures/1004/1004_Max_Consecutive_Ones_1.png)

__Algorithm__

1. Initialize two pointers. The two pointers help us to mark the ```start``` and ```end``` end of the window/subarray with contiguous ```1```'s.

```Python
start = 0, end = 0, window_size = 0
```

2. We use the ```end``` pointer to expand the window until the window/subarray is desirable. i.e. number of ```0```'s in the window are in the allowed range of ```[0, k]```.
3. Once we have a window which has more than the allowed number of ```0```'s, we can move the ```start``` pointer ahead one by one until we encounter ```0``` on the ```start``` too. This step ensures we are throwing out the extra zero.

![image](https://leetcode.com/problems/max-consecutive-ones-iii/Figures/1004/1004_Max_Consecutive_Ones_2.png)

> Note: As suggested in the discussion forum. We can solve this problem a little efficiently. Since we have to find the MAXIMUM window, we never reduce the size of the window. We either increase the size of the window or remain same but never reduce the size.

![image](https://leetcode.com/problems/max-consecutive-ones-iii/Figures/1004/1004_Max_Consecutive_Ones_3.png)

Observe we don't contract the window if it's not needed and thus save on some computation.
