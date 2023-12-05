## [1688. Count of Matches in Tournament](https://leetcode.com/problems/count-of-matches-in-tournament)

```Tag```: ```Math```

#### Difficulty: Easy

You are given an integer ```n```, the number of teams in a tournament that has strange rules:

- If the current number of teams is even, each team gets paired with another team. A total of ```n / 2``` matches are played, and ```n / 2``` teams advance to the next round.
- If the current number of teams is odd, one team randomly advances in the tournament, and the rest gets paired. A total of ```(n - 1) / 2``` matches are played, and ```(n - 1) / 2 + 1``` teams advance to the next round.

Return _the number of matches played in the tournament until a winner is decided_.

![image](https://github.com/quananhle/Python/assets/35042430/a95e6eed-6964-4e6e-a3b3-fe47a48a3a90)

---

__Example 1:__
```
Input: n = 7
Output: 6
Explanation: Details of the tournament: 
- 1st Round: Teams = 7, Matches = 3, and 4 teams advance.
- 2nd Round: Teams = 4, Matches = 2, and 2 teams advance.
- 3rd Round: Teams = 2, Matches = 1, and 1 team is declared the winner.
Total number of matches = 3 + 2 + 1 = 6.
```

__Example 2:__
```
Input: n = 14
Output: 13
Explanation: Details of the tournament:
- 1st Round: Teams = 14, Matches = 7, and 7 teams advance.
- 2nd Round: Teams = 7, Matches = 3, and 4 teams advance.
- 3rd Round: Teams = 4, Matches = 2, and 2 teams advance.
- 4th Round: Teams = 2, Matches = 1, and 1 team is declared the winner.
Total number of matches = 7 + 3 + 2 + 1 = 13.
```

__Constraints:__

- $1 \le n \le 200$

---

### Math

```Python
class Solution:
    def numberOfMatches(self, n: int) -> int:
        ans = 0
        while n > 1:
            ans += n // 2
            n = n // 2 + n % 2

        return ans
```

```Python
class Solution:
    def numberOfMatches(self, n: int) -> int:
        ans = 0
        while n > 1:
            if n % 2:
                ans += (n - 1) // 2
                n = (n - 1) // 2 + 1
            else:
                ans += n // 2
                n //= 2

        return ans
```

#### One-Liner

```Python
class Solution:
    def numberOfMatches(self, n: int) -> int:
        # There are n teams, and 1 winner. Thus, n - 1 teams will be eliminated.
        # As n - 1 teams will be eliminated, there will be n - 1 matches played, with each match eliminating a team.
        return n - 1
```