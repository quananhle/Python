## 989. Add to Array-Form of Integer

```Tag```: ```Array``` ```Math```

#### Difficulty: Easy

The array-form of an integer ```num``` is an array representing its digits in left to right order.

- For example, for ```num = 1321```, the array form is ```[1,3,2,1]```.

Given __num__, the __array-form__ of an integer, and an integer ```k```, return _the __array-form__ of the integer ```num + k```_.

![image](https://user-images.githubusercontent.com/35042430/218947957-3ca29c5b-7f93-45bc-8652-8e1880a9e204.png)

---

__Example 1:__
```
Input: num = [1,2,0,0], k = 34
Output: [1,2,3,4]
Explanation: 1200 + 34 = 1234
```

__Example 2:__
```
Input: num = [2,7,4], k = 181
Output: [4,5,5]
Explanation: 274 + 181 = 455
```

__Example 3:__
```
Input: num = [2,1,5], k = 806
Output: [1,0,2,1]
Explanation: 215 + 806 = 1021
```

__Constraints:__

- ```1 <= num.length <= 10^4```
- ```0 <= num[i] <= 9```
- ```num``` does not contain any leading zeros except for the zero itself.
- ```1 <= k <= 10^4```

---


