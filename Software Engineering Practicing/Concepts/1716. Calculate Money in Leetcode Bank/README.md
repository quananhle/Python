## [1716. Calculate Money in Leetcode Bank](https://leetcode.com/problems/calculate-money-in-leetcode-bank)

```Tag```: ```Array & String``` ```Math```

#### Difficulty: Easy

Hercy wants to save money for his first car. He puts money in the Leetcode bank every day.

He starts by putting in ```$1``` on Monday, the first day. Every day from Tuesday to Sunday, he will put in ```$1``` more than the day before. On every subsequent Monday, he will put in ```$1``` more than the previous Monday.

Given ```n```, return _the total amount of money he will have in the Leetcode bank at the end of the $n^{th}$ day_.

---

__Example 1:__
```
Input: n = 4
Output: 10
Explanation: After the 4th day, the total is 1 + 2 + 3 + 4 = 10.
```

__Example 2:__
```
Input: n = 10
Output: 37
Explanation: After the 10th day, the total is (1 + 2 + 3 + 4 + 5 + 6 + 7) + (2 + 3 + 4) = 37. Notice that on the 2nd Monday, Hercy only puts in $2.
```

__Example 3:__
```
Input: n = 20
Output: 96
Explanation: After the 20th day, the total is (1 + 2 + 3 + 4 + 5 + 6 + 7) + (2 + 3 + 4 + 5 + 6 + 7 + 8) + (3 + 4 + 5 + 6 + 7 + 8) = 96.
```

__Constraints:__

- $1 \le n \le 1000$

---

### Simulation

```Python
class Solution:
    def totalMoney(self, n: int) -> int:
      ans = 0
      start = 1

      while n > 0:
        for day in range(min(n, 7)):
          ans += start + day
        n -= 7
        start += 1
      
      return ans
```

### Math

```Python
class Solution:
    def totalMoney(self, n: int) -> int:
        daily_contributes = [1, 2, 3, 4, 5, 6, 7]
        ans = 0

        for day in range(n):
            weekly_bonuses = day // 7
            day = day % 7
            ans += daily_contributes[day] + weekly_bonuses 

        return ans
```

![image](https://github.com/quananhle/Python/assets/35042430/7b788c20-e922-4530-8024-bb76ca775ee2)

```Python
class Solution:
    def totalMoney(self, n: int) -> int:
      k = n // 7
      F = 28
      L = 28 + (k - 1) * 7
      arithmetic_sum = k * (F + L) // 2

      monday = 1 + k
      final_week = 0

      for day in range(n % 7):
        final_week += monday + day

      return arithmetic_sum + final_week
```
