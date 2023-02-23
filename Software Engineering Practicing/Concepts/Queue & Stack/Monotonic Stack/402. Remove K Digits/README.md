## 402. Remove K Digits

```Tag```: ```Monotonic Stack```

#### Difficulty: Medium

Given string ```num``` representing a non-negative integer ```num```, and an integer ```k```, return _the smallest possible integer after removing ```k``` digits from ```num```_.

![image](https://user-images.githubusercontent.com/35042430/220970016-b60d67ec-776f-461c-b648-ec52ccc4ee34.png)

---

__Example 1:__
```
Input: num = "1432219", k = 3
Output: "1219"
Explanation: Remove the three digits 4, 3, and 2 to form the new number 1219 which is the smallest.
```

__Example 2:__
```
Input: num = "10200", k = 1
Output: "200"
Explanation: Remove the leading 1 and the number is 200. Note that the output must not contain leading zeroes.
```

__Example 3:__
```
Input: num = "10", k = 2
Output: "0"
Explanation: Remove all the digits from the number and it is left with nothing which is 0.
```

__Constraints:__

- ```1 <= k <= num.length <= 10^5```
- ```num``` consists of only digits.
- ```num``` does not have any leading zeros except for the zero itself.

---
