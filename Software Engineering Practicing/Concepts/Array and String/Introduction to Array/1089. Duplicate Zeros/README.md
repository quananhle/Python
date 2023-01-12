## 1089. Duplicate Zeros

```Tag```: ```Array``` ```Sliding Window```

Given a fixed-length integer array ```arr```, duplicate each occurrence of zero, shifting the remaining elements to the right.

Note that elements beyond the length of the original array are not written. Do the above modifications to the input array in place and do not return anything.

![image](https://user-images.githubusercontent.com/35042430/211963017-7bc289db-d4d4-4a8f-a2c5-4a918335ae28.png)

---

__Example 1:__
```
Input: arr = [1,0,2,3,0,4,5,0]
Output: [1,0,0,2,3,0,0,4]
Explanation: After calling your function, the input array is modified to: [1,0,0,2,3,0,0,4]
```

__Example 2:__
```
Input: arr = [1,2,3]
Output: [1,2,3]
Explanation: After calling your function, the input array is modified to: [1,2,3]
```

__Constraints:__
```
1 <= arr.length <= 104
0 <= arr[i] <= 9
```

---

