## 1259. Handshakes That Don't Cross

```Tag```: ```Dynamic Programming``` ```Math```

#### Difficulty: Hard

You are given an __even__ number of people ```numPeople``` that stand around a circle and each person shakes hands with someone else so that there are ```numPeople / 2``` handshakes total.

Return _the number of ways these handshakes could occur such that none of the handshakes cross_.

Since the answer could be very large, return it __modulo__ ```10^9 + 7```.

![image](https://user-images.githubusercontent.com/35042430/220688007-d6651779-763b-4290-a4da-9bff67687ca7.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2019/07/11/5125_example_2.png)
```
Input: numPeople = 4
Output: 2
Explanation: There are two ways to do it, the first way is [(1,2),(3,4)] and the second one is [(2,3),(4,1)].
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2019/07/11/5125_example_3.png)
```
Input: numPeople = 6
Output: 5
```

__Constraints:__

- ```2 <= numPeople <= 1000```
- ```numPeople``` is even.

---
