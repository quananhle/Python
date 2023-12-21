## [2706. Buy Two Chocolates](https://leetcode.com/problems/buy-two-chocolates)

```Tag```: ```Array & String``` ```Priority Queue``` ```Counting Sort``` ```Bucket Sort``` ```Greedy Algorithm```

#### Difficulty: Easy

You are given an integer array ```prices``` representing the prices of various chocolates in a store. You are also given a single integer ```money```, which represents your initial amount of money.

You must buy exactly two chocolates in such a way that you still have some non-negative leftover money. You would like to minimize the sum of the prices of the two chocolates you buy.

Return _the amount of money you will have leftover after buying the two chocolates_. If there is no way for you to buy two chocolates without ending up in debt, return ```money```. Note that the leftover must be non-negative.

---

__Example 1:__
```
Input: prices = [1,2,2], money = 3
Output: 0
Explanation: Purchase the chocolates priced at 1 and 2 units respectively. You will have 3 - 3 = 0 units of money afterwards. Thus, we return 0.
```

__Example 2:__
```
Input: prices = [3,2,3], money = 3
Output: 3
Explanation: You cannot buy 2 chocolates without going in debt, so we return 3.
```

__Constraints:__

- $2 \le prices.length \le 50$
- $1 \le prices[i] \le 100$
- $1 \le money \le 100$

---

### Find Lowest and Second Lowest Elements

#### Two Passes (```pop()```)

![image](https://leetcode.com/problems/buy-two-chocolates/Figures/2706/2706_slide_images_used/Slide1_1.PNG)

![image](https://leetcode.com/problems/buy-two-chocolates/Figures/2706/2706_slide_images_used/Slide1_2.PNG)

```Python
class Solution:
    def buyChoco(self, prices: List[int], money: int) -> int:
        def get_min_idx() -> int:
            n = len(prices)
            min_idx = 0
            for i in range(1, n):
                if prices[i] < prices[min_idx]:
                    min_idx = i
            return min_idx

        lowest = prices.pop(get_min_idx())
        second_lowest = prices.pop(get_min_idx())

        if lowest + second_lowest <= money:
            return money - lowest - second_lowest
        
        return money
```

#### One Pass

```Python

```

```Python

```

### Greedy Algorithm

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(n \log{}n)$
- __Space Complexity__: $\mathcal{O}(n)$ or $\mathcal{O}(\log{}n)$

```Python
class Solution:
    def buyChoco(self, prices: List[int], money: int) -> int:
        prices.sort()

        if prices[0] + prices[1] <= money:
            return money - (prices[0] + prices[1])

        return money
```

### Counting Sort

```Python
class Solution:
    def buyChoco(self, prices: List[int], money: int) -> int:
        n = len(prices)

        freq = [0] * 101
        for price in prices:
            freq[price] += 1
        
        minimum = second_minimum = 0
        for price in range(1, 101):
            if freq[price] > 1:
                minimum = second_minimum = price
                break
            elif freq[price] == 1:
                minimum = price
                if second_minimum == 0:
                    for price in range(minimum + 1, 101):
                        if freq[price] > 0:
                            second_minimum = price
                            break
                break
        
        if minimum + second_minimum <= money:
            return money - minimum - second_minimum
        
        return money
```

### Priority Queue

```Python

```
