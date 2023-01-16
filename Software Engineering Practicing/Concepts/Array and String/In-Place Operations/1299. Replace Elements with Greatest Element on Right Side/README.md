## 1299. Replace Elements with Greatest Element on Right Side

```Tag```: ```In-Place Operations``` ```Two Pointers```

#### Difficulty: Easy

Given an array ```arr```, replace every element in that array with the greatest element among the elements to its right, and replace the last element with ```-1```.

After doing so, return _the ```array```_.

![image](https://user-images.githubusercontent.com/35042430/212772315-1c220610-207d-4bb8-babe-dbba2ce7538f.png)

---

__Example 1:__
```
Input: arr = [17,18,5,4,6,1]
Output: [18,6,6,6,1,-1]
Explanation: 
- index 0 --> the greatest element to the right of index 0 is index 1 (18).
- index 1 --> the greatest element to the right of index 1 is index 4 (6).
- index 2 --> the greatest element to the right of index 2 is index 4 (6).
- index 3 --> the greatest element to the right of index 3 is index 4 (6).
- index 4 --> the greatest element to the right of index 4 is index 5 (1).
- index 5 --> there are no elements to the right of index 5, so we put -1.
```

__Example 2:__
```
Input: arr = [400]
Output: [-1]
Explanation: There are no elements to the right of index 0.
```

__Constraints:__
```
1 <= arr.length <= 104
1 <= arr[i] <= 105
```

---
