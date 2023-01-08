## 2214. Minimum Health to Beat Game

```Tag```: ```Greedy Algorithms``` ```Prefix Sum```

#### Difficulty: Medium

You are playing a game that has ```n``` levels numbered from ```0``` to ```n - 1```. You are given a __0-indexed__ integer array ```damage``` where ```damage[i]``` is the amount of health you will lose to complete the i<sup>th</sup> level.

You are also given an integer ```armor```. You may use your armor ability __at most once__ during the game on any level which will protect you from at most ```armor``` damage.

You must complete the levels in order and your health must be __greater than ```0```__ at all times to beat the game.

Return _the __minimum__ health you need to start with to beat the game_.

![image](https://user-images.githubusercontent.com/35042430/211183348-ad93cabb-8349-4b06-9cd3-004dd74481de.png)

---

__Example 1:__
```
Input: damage = [2,7,4,3], armor = 4
Output: 13
Explanation: One optimal way to beat the game starting at 13 health is:
On round 1, take 2 damage. You have 13 - 2 = 11 health.
On round 2, take 7 damage. You have 11 - 7 = 4 health.
On round 3, use your armor to protect you from 4 damage. You have 4 - 0 = 4 health.
On round 4, take 3 damage. You have 4 - 3 = 1 health.
Note that 13 is the minimum health you need to start with to beat the game.
```

__Example 2:__
```
Input: damage = [2,5,3,4], armor = 7
Output: 10
Explanation: One optimal way to beat the game starting at 10 health is:
On round 1, take 2 damage. You have 10 - 2 = 8 health.
On round 2, use your armor to protect you from 5 damage. You have 8 - 0 = 8 health.
On round 3, take 3 damage. You have 8 - 3 = 5 health.
On round 4, take 4 damage. You have 5 - 4 = 1 health.
Note that 10 is the minimum health you need to start with to beat the game.
```

__Example 3:__
```
Input: damage = [3,3,3], armor = 0
Output: 10
Explanation: One optimal way to beat the game starting at 10 health is:
On round 1, take 3 damage. You have 10 - 3 = 7 health.
On round 2, take 3 damage. You have 7 - 3 = 4 health.
On round 3, take 3 damage. You have 4 - 3 = 1 health.
Note that you did not use your armor ability.
```

__Constraints:__
```
n == damage.length
1 <= n <= 105
0 <= damage[i] <= 105
0 <= armor <= 105
```

---

### Greedy

![image](https://leetcode.com/problems/minimum-health-to-beat-game/solutions/2902954/Figures/2214/2214-1.png)

```Python
class Solution:
    def minimumHealth(self, damage: List[int], armor: int) -> int:
        # Greedy
        # After the last index, health must retain to be at least 1. If traverse backward, starting from 1, adding up all health and deduct maximum armor needed
        '''
        if armor >= max(damage):
            armor = max(damage)
        '''
        max_damage = 0
        for d in damage:
            if max_damage < d:
                max_damage = d
        if armor >= max_damage:
            armor = max_damage
        return sum(damage) + 1 - armor
```

### One Liner

```Python
class Solution:
    def minimumHealth(self, damage: List[int], armor: int) -> int:
        # Greedy
        return sum(damage) + 1 - min(armor, max(damage))
```
