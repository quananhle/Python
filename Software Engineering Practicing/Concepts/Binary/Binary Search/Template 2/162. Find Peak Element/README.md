## [162. Find Peak Element](https://leetcode.com/problems/find-peak-element/)

```Tag```: ```Binary Search```

#### Difficulty: Medium

A peak element is an element that is strictly greater than its neighbors.

Given a __0-indexed__ integer array ```nums```, find a peak element, and return _its index_. If the array contains multiple peaks, return the index to __any of the peaks__.

You may imagine that ```nums[-1] = nums[n] = -∞```. In other words, an element is always considered to be strictly greater than a neighbor that is outside the array.

You must write an algorithm that runs in ```O(log n)``` time.

![image](https://user-images.githubusercontent.com/35042430/229907589-405a072e-b0b6-4aa4-88ca-901ee5efc596.png)

---

__Example 1:__
```
Input: nums = [1,2,3,1]
Output: 2
Explanation: 3 is a peak element and your function should return the index number 2.
```

__Example 2:__
```
Input: nums = [1,2,1,3,5,6,4]
Output: 5
Explanation: Your function can return either index number 1 where the peak element is 2, or index number 5 where the peak element is 6.
```

__Constraints:__

- ```1 <= nums.length <= 1000```
- -2<sup>31</sup> <= ```nums[i]``` <= 2<sup>31</sup> - 1
- ```nums[i] != nums[i + 1]``` for all valid ```i```.

---

