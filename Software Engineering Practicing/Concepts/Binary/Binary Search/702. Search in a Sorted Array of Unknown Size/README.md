## [702. Search in a Sorted Array of Unknown Size](https://leetcode.com/problems/search-in-a-sorted-array-of-unknown-size)

```Tag```: ```Binary Search```

#### Difficulty: Medium

This is an __interactive problem.__

You have a sorted array of __unique__ elements and an __unknown size__. You do not have an access to the array but you can use the ```ArrayReader``` interface to access it. You can call ```ArrayReader.get(i)``` that:

- returns the value at the ```i```<sup>```th```</sup> index (__0-indexed__) of the secret array (i.e., __secret[i]__), or
- returns ```2```<sup>```31```</sup>``` - 1``` if the ```i``` is out of the boundary of the array.

You are also given an integer ```target```.

Return _the index ```k``` of the hidden array where ```secret[k] == target``` or return ```-1``` otherwise_.

You must write an algorithm with ```O(log n)``` runtime complexity.

![image](https://user-images.githubusercontent.com/35042430/230826162-cb7d2f90-f1b3-482c-81d4-315bf8fbdef7.png)

---

__Example 1:__
```
Input: secret = [-1,0,3,5,9,12], target = 9
Output: 4
Explanation: 9 exists in secret and its index is 4.
```

__Example 2:__
```
Input: secret = [-1,0,3,5,9,12], target = 2
Output: -1
Explanation: 2 does not exist in secret so return -1.
```

__Constraints:__

- 1 <= ```secret.length``` <= 10<sup>4</sup>
- -10<sup>4</sup> <= ```secret[i]```, ```target``` <= 10<sup>4</sup>
- ```secret``` is sorted in a __strictly increasing__ order.

---
