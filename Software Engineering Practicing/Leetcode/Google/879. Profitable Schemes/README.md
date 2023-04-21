## [879. Profitable Schemes](https://leetcode.com/problems/profitable-schemes/)

```Tag```:

#### Difficulty: Medium

There is a group of ```n``` members, and a list of various crimes they could commit. The ```i```<sup>```th```</sup> crime generates a ```profit[i]``` and requires ```group[i]``` members to participate in it. If a member participates in one crime, that member can't participate in another crime.

Let's call a profitable scheme any subset of these crimes that generates at least ```minProfit``` profit, and the total number of members participating in that subset of crimes is at most ```n```.

Return _the number of schemes that can be chosen_. Since the answer may be very large, return it modulo 10<sup>9</sup> + 7.

![image](https://user-images.githubusercontent.com/35042430/233707867-a7b14756-9fae-4bbf-a1a0-e5a0994a3d0e.png)

---

__Example 1:__
```
Input: n = 5, minProfit = 3, group = [2,2], profit = [2,3]
Output: 2
Explanation: To make a profit of at least 3, the group could either commit crimes 0 and 1, or just crime 1.
In total, there are 2 schemes.
```

__Example 2:__
```
Input: n = 10, minProfit = 5, group = [2,3,5], profit = [6,7,8]
Output: 7
Explanation: To make a profit of at least 5, the group could commit any crimes, as long as they commit one.
There are 7 possible schemes: (0), (1), (2), (0,1), (0,2), (1,2), and (0,1,2).
```

__Constraints:__

- ```1 <= n <= 100```
- ```0 <= minProfit <= 100```
- ```1 <= group.length <= 100```
- ```1 <= group[i] <= 100```
- ```profit.length == group.length```
- ```0 <= profit[i] <= 100```

---

