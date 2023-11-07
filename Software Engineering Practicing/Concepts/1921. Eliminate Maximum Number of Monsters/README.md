## [1921. Eliminate Maximum Number of Monsters](https://leetcode.com/problems/eliminate-maximum-number-of-monsters)

```Tag```: ```Array & String``` ```Priority Queue```

#### Difficulty: Medium

You are playing a video game where you are defending your city from a group of ```n``` monsters. You are given a 0-indexed integer array ```dist``` of size ```n```, where ```dist[i]``` is the initial distance in kilometers of the $i^{th}$ monster from the city.

The monsters walk toward the city at a constant speed. The speed of each monster is given to you in an integer array ```speed``` of size ```n```, where ```speed[i]``` is the speed of the $i^{th}$ monster in kilometers per minute.

You have a weapon that, once fully charged, can eliminate a single monster. However, the weapon takes one minute to charge. The weapon is fully charged at the very start.

You lose when any monster reaches your city. If a monster reaches the city at the exact moment the weapon is fully charged, it counts as a loss, and the game ends before you can use your weapon.

Return _the __maximum__ number of monsters that you can eliminate before you lose, or ```n``` if you can eliminate all the monsters before they reach the city_.

---

__Example 1:__
```
Input: dist = [1,3,4], speed = [1,1,1]
Output: 3
Explanation:
In the beginning, the distances of the monsters are [1,3,4]. You eliminate the first monster.
After a minute, the distances of the monsters are [X,2,3]. You eliminate the second monster.
After a minute, the distances of the monsters are [X,X,2]. You eliminate the thrid monster.
All 3 monsters can be eliminated.
```

__Example 2:__
```
Input: dist = [1,1,2,3], speed = [1,1,1,1]
Output: 1
Explanation:
In the beginning, the distances of the monsters are [1,1,2,3]. You eliminate the first monster.
After a minute, the distances of the monsters are [X,0,1,2], so you lose.
You can only eliminate 1 monster.
```

__Example 3:__
```
Input: dist = [3,2,4], speed = [5,3,2]
Output: 1
Explanation:
In the beginning, the distances of the monsters are [3,2,4]. You eliminate the first monster.
After a minute, the distances of the monsters are [X,0,2], so you lose.
You can only eliminate 1 monster.
```

__Constraints:__

- $n == dist.length == speed.length$
- $1 \le n \le 10^5$
- $1 \le dist[i], speed[i] \le 10^5$

---

### Sort

__Sort by Travel Time__

```Python
class Solution:
    def eliminateMaximum(self, dist: List[int], speed: List[int]) -> int:
        time = list()
        n = len(dist)

        # Get the travel time needed for all monsters to arrive the city
        for i in range(n):
            time.append(dist[i] / speed[i])

        # Sort the time to select from closest to farthest monster to kill
        time.sort()

        kills = 0
        first = True
        minute_passed = 0

        for i, e in enumerate(time):
            # Player goes first, monster is always killed in the first round
            if first:
                first = False
                kills += 1
                continue

            # Increment the time passed after every turn
            minute_passed += 1
            # Check if monster has arrived the city
            if e - minute_passed <= 0:
                break

            # Increment kills after every turn
            kills += 1

        return kills
```
