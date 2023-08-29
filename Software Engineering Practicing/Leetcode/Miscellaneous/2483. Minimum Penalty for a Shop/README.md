## [2483. Minimum Penalty for a Shop](https://leetcode.com/problems/minimum-penalty-for-a-shop/)

```Tag```: ```Array & String```

#### Difficulty: Medium

You are given the customer visit log of a shop represented by a __0-indexed__ string ```customers``` consisting only of characters ```'N'``` and ```'Y'```:

- if the $i^{th}$ character is ```'Y'```, it means that customers come at the $i^{th}$ hour
- whereas ```'N'``` indicates that no customers come at the $i^{th}$ hour.

If the shop closes at the $j^{th}$ hour $(0 \le j \le n)$, the penalty is calculated as follows:

- For every hour when the shop is open and no customers come, the penalty increases by ```1```.
- For every hour when the shop is closed and customers come, the penalty increases by ```1```.

Return _the __earliest__ hour at which the shop must be closed to incur a __minimum__ penalty_.

Note that if a shop closes at the $j^{th}$ hour, it means the shop is closed at the hour ```j```.

![image](https://github.com/quananhle/Python/assets/35042430/f69b914e-8613-4939-9874-c984c871eece)

---

__Example 1:__
```
Input: customers = "YYNY"
Output: 2
Explanation: 
- Closing the shop at the 0th hour incurs in 1+1+0+1 = 3 penalty.
- Closing the shop at the 1st hour incurs in 0+1+0+1 = 2 penalty.
- Closing the shop at the 2nd hour incurs in 0+0+0+1 = 1 penalty.
- Closing the shop at the 3rd hour incurs in 0+0+1+1 = 2 penalty.
- Closing the shop at the 4th hour incurs in 0+0+1+0 = 1 penalty.
Closing the shop at 2nd or 4th hour gives a minimum penalty. Since 2 is earlier, the optimal closing time is 2.
```

__Example 2:__
```
Input: customers = "NNNNN"
Output: 0
Explanation: It is best to close the shop at the 0th hour as no customers arrive.
```

__Example 3:__
```
Input: customers = "YYYY"
Output: 4
Explanation: It is best to close the shop at the 4th hour as customers arrive at each hour.
```

__Constraints:__

- $1 \le customers.length \le 10^5$
- ```customers``` consists only of characters ```'Y'``` and ```'N'```.

---

### Counter

```Python
class Solution:
    def bestClosingTime(self, customers: str) -> int:
        # Minimize 'Y' and maximize 'N'
        counter = collections.Counter(customers)
        ans = 0
        curr_penalty = min_penalty = counter.get('Y', 0)

        for h, c in enumerate(customers):
            if c == 'Y':
                curr_penalty -= 1
            else:
                curr_penalty += 1

            if curr_penalty < min_penalty:
                ans = h + 1
                min_penalty = curr_penalty

        return ans
```

### One Pass

```Python
class Solution:
    def bestClosingTime(self, customers: str) -> int:
        # Minimize 'Y' and maximize 'N'
        counter = collections.Counter(customers)
        ans = 0
        curr_penalty = min_penalty = 0

        for h, c in enumerate(customers):
            if c == 'Y':
                curr_penalty -= 1
            else:
                curr_penalty += 1

            if curr_penalty < min_penalty:
                ans = h + 1
                min_penalty = curr_penalty

        return ans
```
