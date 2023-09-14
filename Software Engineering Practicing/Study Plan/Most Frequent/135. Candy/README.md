## [135. Candy](https://leetcode.com/problems/candy)

```Tag```:

#### Difficulty: Hard

There are ```n``` children standing in a line. Each child is assigned a rating value given in the integer array ```ratings```.

You are giving candies to these children subjected to the following requirements:

- Each child must have at least one candy.
- Children with a higher rating get more candies than their neighbors.

Return _the minimum number of candies you need to have to distribute the candies to the children_.

![image](https://github.com/quananhle/Python/assets/35042430/e9c829f6-7c97-4320-bae5-9abad66104fc)

---

__Example 1:__
```
Input: ratings = [1,0,2]
Output: 5
Explanation: You can allocate to the first, second and third child with 2, 1, 2 candies respectively.
```

__Example 2:__
```
Input: ratings = [1,2,2]
Output: 4
Explanation: You can allocate to the first, second and third child with 1, 2, 1 candies respectively.
The third child gets 1 candy because it satisfies the above two conditions.
```

__Constraints:__

- $n == ratings.length$
- $1 \le n \le 2 * 10^{4}$
- $0 \le ratings[i] \le 2 * 10^{4}$

---

### Brute Force

```Python
class Solution:
    def candy(self, ratings: List[int]) -> int:
        n = len(ratings)
        candies = [1] * n
        have_change = True

        while have_change:
            have_change = not have_change
            for i in range(n):
                if i != n - 1 and ratings[i] > ratings[i + 1] and candies[i] <= candies[i + 1]:
                    candies[i] = candies[i + 1] + 1
                    have_change = True
                if i > 0 and ratings[i] > ratings[i - 1] and candies[i] <= candies[i - 1]:
                    candies[i] = candies[i - 1] + 1
                    have_change = True
                
        return sum(candies)
```
