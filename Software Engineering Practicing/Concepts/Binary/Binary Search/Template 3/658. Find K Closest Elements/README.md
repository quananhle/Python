## [658. Find K Closest Elements](https://leetcode.com/problems/find-k-closest-elements)

```Tag```: ```Binary Search```

#### Difficulty: Medium

Given a sorted integer array ```arr```, two integers ```k``` and ```x```, return _the ```k``` closest integers to ```x``` in the array_. The result should also be sorted in ascending order.

An integer ```a``` is closer to ```x``` than an integer ```b``` if:

- ```|a - x| < |b - x|```, or
- ```|a - x| == |b - x|``` and ```a < b```

![image](https://user-images.githubusercontent.com/35042430/230222433-051e5057-225b-4e5e-a5fa-eca1c06fb7fc.png)

---
 
__Example 1:__
```
Input: arr = [1,2,3,4,5], k = 4, x = 3
Output: [1,2,3,4]
```

__Example 2:__
```
Input: arr = [1,2,3,4,5], k = 4, x = -1
Output: [1,2,3,4]
```

__Constraints:__

- ```1 <= k <= arr.length```
- 1 <= ```arr.length``` <= 10<sup>4</sup>
- ```arr``` is sorted in ascending order.
- -10<sup>4</sup> <= ```arr[i]```, ```x``` <= 10<sup>4</sup>

---
