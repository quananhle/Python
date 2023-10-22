## [1095. Find in Mountain Array](https://leetcode.com/problems/find-in-mountain-array)

```Tag```: ```Binary Search```

#### Difficulty: Hard

(This problem is an interactive problem.)

You may recall that an array ```arr``` is a mountain array if and only if:

- $arr.length \ge 3$
- There exists some ```i``` with $0 \lt i \lt arr.length - 1$ such that:
  - $arr[0] < arr[1] < ... < arr[i - 1] < arr[i]$
  - $arr[i] > arr[i + 1] > ... > arr[arr.length - 1]$

Given a mountain array ```mountainArr```, return _the minimum ```index``` such that $mountainArr.get(index) == target$_. If such an ```index``` does not exist, return ```-1```.

__You cannot access the mountain array directly__. You may only access the array using a ```MountainArray``` interface:

- ```MountainArray.get(k)``` returns the element of the array at index ```k``` (0-indexed).
- ```MountainArray.length()``` returns the length of the array.

Submissions making more than ```100``` calls to ```MountainArray.get``` will be judged __Wrong Answer__. Also, any solutions that attempt to circumvent the judge will result in disqualification.

![image](https://github.com/quananhle/Python/assets/35042430/7117c1fc-c436-47bf-84a4-1ea1e09ce5d3)

---

__Example 1:__
```
Input: array = [1,2,3,4,5,3,1], target = 3
Output: 2
Explanation: 3 exists in the array, at index=2 and index=5. Return the minimum index, which is 2.
```

__Example 2:__
```
Input: array = [0,1,2,4,2,1], target = 3
Output: -1
Explanation: 3 does not exist in the array, so we return -1.
```

__Constraints:__

- $3 \le mountain_arr.length() \le 10^4$
- $0 \le target \le 10^9$
- $0 \le mountain_arr.get(index) \le 10^9$

---

![image](https://leetcode.com/problems/find-in-mountain-array/Figures/1095/1095_used/Slide1.PNG)

![image](https://leetcode.com/problems/find-in-mountain-array/Figures/1095/1095_used/Slide3.PNG)

In Binary Search, we discard half of the search space at each step, based on the test condition on the middle element of the search space. We must ensure that we don't end up discarding the element we are looking for. Our ```[lo, hi]``` search space must always contain the element we are looking for.

```Python
class Solution:
    def findInMountainArray(self, target: int, mountain_arr: 'MountainArray') -> int:
        # Save the length of the mountain array
        length = mountain_arr.length()

        # 1. Find the index of the peak element
        low = 1
        high = length - 2
        while low != high:
            test_index = (low + high) // 2
            if mountain_arr.get(test_index) < mountain_arr.get(test_index + 1):
                low = test_index + 1
            else:
                high = test_index
        peak_index = low

        # 2. Search in the strictly increasing part of the array
        low = 0
        high = peak_index
        while low != high:
            test_index = (low + high) // 2
            if mountain_arr.get(test_index) < target:
                low = test_index + 1
            else:
                high = test_index    
        # Check if the target is present in the strictly increasing part
        if mountain_arr.get(low) == target:
            return low
        
        # 3. Otherwise, search in the strictly decreasing part
        low = peak_index + 1
        high = length - 1
        while low != high:
            test_index = (low + high) // 2
            if mountain_arr.get(test_index) > target:
                low = test_index + 1
            else:
                high = test_index
        # Check if the target is present in the strictly decreasing part
        if mountain_arr.get(low) == target:
            return low
        
        # Target is not present in the mountain array
        return -1
```