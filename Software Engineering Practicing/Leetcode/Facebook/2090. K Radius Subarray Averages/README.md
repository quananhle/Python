## [2090. K Radius Subarray Averages](https://leetcode.com/problems/k-radius-subarray-averages/)

```Tag```:

#### Difficulty: Medium

You are given a __0-indexed__ array nums of ```n``` integers, and an integer ```k```.

The __k-radius average__ for a subarray of ```nums``` centered at some index ```i``` with the radius ```k``` is the average of all elements in ```nums``` between the indices ```i - k``` and ```i + k``` (inclusive). If there are less than ```k``` elements before or after the index ```i```, then the k-radius average is ```-1```.

Build and return _an array ```avgs``` of length ```n``` where ```avgs[i]``` is the __k-radius average__ for the subarray centered at index ```i```_.

The average of ```x``` elements is the sum of the ```x``` elements divided by ```x```, using integer division. The integer division truncates toward zero, which means losing its fractional part.

- For example, the average of four elements ```2```, ```3```, ```1```, and ```5``` is ```(2 + 3 + 1 + 5) / 4 = 11 / 4 = 2.75```, which truncates to ```2```.

![image](https://github.com/quananhle/Python/assets/35042430/be5f5659-3796-4e15-adc2-a1fa39ae079c)

---
