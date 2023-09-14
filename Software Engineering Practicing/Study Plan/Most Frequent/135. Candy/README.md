## [135. Candy](https://leetcode.com/problems/candy)

```Tag```: ```Array & String``` ```Greedy Algorithm```

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

### Brute Force (Time Limit Exceeded)

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(n^{2})$.
- __Space Complexity__: $\mathcal{O}(n)$.

```Python
class Solution:
    def candy(self, ratings: List[int]) -> int:
        n = len(ratings)
        # Give at least 1 candy to every student
        candies = [1] * n
        have_change = True

        # Check if no update in candies, return the number of candies
        while have_change:
            have_change = not have_change
            for i in range(n):
                # Check if current student has higher rating and has less or equal candies than the next student
                if i != n - 1 and ratings[i] > ratings[i + 1] and candies[i] <= candies[i + 1]:
                    # Give more candies to current student
                    candies[i] = candies[i + 1] + 1
                    have_change = True
                # Check if current student has higher rating and has less or equal candies than the previous student  
                if i > 0 and ratings[i] > ratings[i - 1] and candies[i] <= candies[i - 1]:
                    # Give more candies to current student
                    candies[i] = candies[i - 1] + 1
                    have_change = True
                
        return sum(candies)
```

### Two Arrays

![image](https://leetcode.com/problems/candy/Figures/135_Candy_Two_Pass.gif)

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(n)$.
- __Space Complexity__: $\mathcal{O}(n)$.

```Python
class Solution:
    def candy(self, ratings: List[int]) -> int:
        ans = 0
        n = len(ratings)
        # Give at least 1 candy to every student
        left_to_right = [1] * n
        right_to_left = [1] * n

        for i in range(1, n):
            if ratings[i - 1] < ratings[i]:
                left_to_right[i] = left_to_right[i - 1] + 1
        
        for i in range(n - 2, -1, -1):
            if ratings[i + 1] < ratings[i]:
                right_to_left[i] = right_to_left[i + 1] + 1
        
        for i in range(n):
            ans += max(left_to_right[i], right_to_left[i])

        return ans
```

### One Array (Two Passes)

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(n)$.
- __Space Complexity__: $\mathcal{O}(n)$.

```Python
class Solution:
    def candy(self, ratings: List[int]) -> int:
        ans = 0
        n = len(ratings)
        # Give at least 1 candy to every student
        candies = [1] * n

        for i in range(1, n):
            if ratings[i - 1] < ratings[i]:
                candies[i] = candies[i - 1] + 1
        
        ans = candies[n - 1]
        for i in range(n - 2, -1, -1):
            if ratings[i + 1] < ratings[i]:
                candies[i] = max(candies[i], candies[i + 1] + 1)
            ans += candies[i]

        return ans
```

### One Pass with Constant Space

![image](https://leetcode.com/problems/candy/Figures/135_Candy_Constant_Space.PNG)

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(n)$.
- __Space Complexity__: $\mathcal{O}(n)$.

```Python

```
