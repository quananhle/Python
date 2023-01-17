## 414. Third Maximum Number

```Tag```: ```Sort``` ```Priority Queue``` ```Min-Heap``` ```Three Pointers``` ```Hash Set``` ```Hash Table```

#### Difficulty: Easy

Given an integer array ```nums```, return _the __third distinct maximum__ number in this array_. If the third maximum does not exist, return the __maximum__ number_.

![image](https://user-images.githubusercontent.com/35042430/213017833-73c6fa75-5436-47ce-8aa3-784d92d4cc89.png)

---

__Example 1:__
```
Input: nums = [3,2,1]
Output: 1
Explanation:
The first distinct maximum is 3.
The second distinct maximum is 2.
The third distinct maximum is 1.
```

__Example 2:__
```
Input: nums = [1,2]
Output: 2
Explanation:
The first distinct maximum is 2.
The second distinct maximum is 1.
The third distinct maximum does not exist, so the maximum (2) is returned instead.
```

__Example 3:__
```
Input: nums = [2,2,3,1]
Output: 1
Explanation:
The first distinct maximum is 3.
The second distinct maximum is 2 (both 2's are counted together since they have the same value).
The third distinct maximum is 1.
```

__Constraints:__
```
1 <= nums.length <= 104
-231 <= nums[i] <= 231 - 1
```

---



Follow up: Can you find an O(n) solution?
