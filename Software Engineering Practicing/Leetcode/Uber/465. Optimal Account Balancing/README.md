## [465. Optimal Account Balancing](https://leetcode.com/problems/optimal-account-balancing/)

```Tag```: ```Backtracking```

#### Difficulty: Hard

You are given an array of transactions ```transactions``` where ```transactions[i] = [fromi, toi, amounti]``` indicates that the person with ```ID = fromi``` gave ```amounti``` $ to the person with ```ID = toi```.

Return _the minimum number of transactions required to settle the debt_.

![image](https://github.com/quananhle/Python/assets/35042430/0e02bfb3-2a99-4c90-8b84-e6e89847f497)

---

__Example 1:__
```
Input: transactions = [[0,1,10],[2,0,5]]
Output: 2
Explanation:
Person #0 gave person #1 $10.
Person #2 gave person #0 $5.
Two transactions are needed. One way to settle the debt is person #1 pays person #0 and #2 $5 each.
```

__Example 2:__
```
Input: transactions = [[0,1,10],[1,0,1],[1,2,5],[2,0,5]]
Output: 1
Explanation:
Person #0 gave person #1 $10.
Person #1 gave person #0 $1.
Person #1 gave person #2 $5.
Person #2 gave person #0 $5.
Therefore, person #1 only need to give person #0 $4, and all debt is settled.
```

__Constraints:__

- ```1 <= transactions.length <= 8```
- ```transactions[i].length == 3```
- ```0 <= fromi, toi < 12```
- ```fromi != toi```
- ```1 <= amounti <= 100```

---

Rather than focusing on the debt relationships between each pair of individuals, we can direct our attention towards the net balance of each person. For instance, person ```1``` is owed ```5``` by person ```2```, but owes ```10``` to person ```3``` and ```10``` to person ```4```. Therefore, person ```1``` owes a net ```15```.

![image](https://leetcode.com/problems/optimal-account-balancing/Figures/465/1.png)
