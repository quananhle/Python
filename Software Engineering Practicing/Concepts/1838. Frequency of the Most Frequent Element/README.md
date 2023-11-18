## [1838. Frequency of the Most Frequent Element](https://leetcode.com/problems/frequency-of-the-most-frequent-element)

```Tag```: ```Priority Queue```

#### Difficulty: Medium

The frequency of an element is the number of times it occurs in an array.

You are given an integer array ```nums``` and an integer ```k```. In one operation, you can choose an index of ```nums``` and increment the element at that index by ```1```.

Return _the __maximum possible frequency__ of an element after performing at most ```k``` operations_.

---

__Example 1:__
```
Input: nums = [1,2,4], k = 5
Output: 3
Explanation: Increment the first element three times and the second element two times to make nums = [4,4,4].
4 has a frequency of 3.
```

__Example 2:__
```
Input: nums = [1,4,8,13], k = 5
Output: 2
Explanation: There are multiple optimal solutions:
- Increment the first element three times to make nums = [4,4,8,13]. 4 has a frequency of 2.
- Increment the second element four times to make nums = [1,8,8,13]. 8 has a frequency of 2.
- Increment the third element five times to make nums = [1,4,13,13]. 13 has a frequency of 2.
```

__Example 3:__
```
Input: nums = [3,9,6], k = 2
Output: 1
```

__Constraints:__

- $1 \le nums.length \le 10^5$
- $1 \le nums[i] \le 10^5$
- $1 \le k \le 10^5$

---
