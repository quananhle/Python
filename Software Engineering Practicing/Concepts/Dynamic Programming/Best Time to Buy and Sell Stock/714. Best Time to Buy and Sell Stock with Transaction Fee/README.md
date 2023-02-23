## 714. Best Time to Buy and Sell Stock with Transaction Fee

```Tag```: ```Dynamic Programming```

#### Difficulty: Medium

You are given an array ```prices``` where ```prices[i]``` is the price of a given stock on the i<sup>th</sup> day, and an integer ```fee``` representing a transaction fee.

Find the maximum profit you can achieve. You may complete as many transactions as you like, but you need to pay the transaction fee for each transaction.

Note: You may not engage in multiple transactions simultaneously (i.e., you must sell the stock before you buy again).

![image](https://user-images.githubusercontent.com/35042430/221039417-243a02c9-433c-41d8-9de8-3aa067d3f477.png)

---

__Example 1:__
```
Input: prices = [1,3,2,8,4,9], fee = 2
Output: 8
Explanation: The maximum profit can be achieved by:
- Buying at prices[0] = 1
- Selling at prices[3] = 8
- Buying at prices[4] = 4
- Selling at prices[5] = 9
The total profit is ((8 - 1) - 2) + ((9 - 4) - 2) = 8.
```

__Example 2:__
```
Input: prices = [1,3,7,5,10,3], fee = 3
Output: 6
```

__Constraints:__

- 1 <= ```prices.length``` <= 5 * 10<sup>4</sup>
- 1 <= ```prices[i]``` < 5 * 10<sup>4</sup>
- 0 <= ```fee``` < 5 * 10<sup>4</sup>

---

