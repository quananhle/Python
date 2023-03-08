## [875. Koko Eating Bananas](https://leetcode.com/problems/koko-eating-bananas/)

```Tag```: ```Binary Search```

#### Difficulty: Medium

Koko loves to eat bananas. There are ```n``` piles of bananas, the i<sup>th</sup> pile has ```piles[i]``` bananas. The guards have gone and will come back in ```h``` hours.

Koko can decide her bananas-per-hour eating speed of ```k```. Each hour, she chooses some pile of bananas and eats ```k``` bananas from that pile. If the pile has less than ```k``` bananas, she eats all of them instead and will not eat any more bananas during this hour.

Koko likes to eat slowly but still wants to finish eating all the bananas before the guards return.

Return _the minimum integer ```k``` such that she can eat all the bananas within ```h``` hours_.

![image](https://user-images.githubusercontent.com/35042430/223606088-687c5e7c-dc7b-4968-8003-c5b275274ef9.png)

---

__Example 1:__
```
Input: piles = [3,6,7,11], h = 8
Output: 4
```

__Example 2:__
```
Input: piles = [30,11,23,4,20], h = 5
Output: 30
```

__Example 3:__
```
Input: piles = [30,11,23,4,20], h = 6
Output: 23
```

![image](https://user-images.githubusercontent.com/35042430/223606125-5505931d-3ff2-4da9-afb5-8704211b5a51.png)

---

![image](https://leetcode.com/problems/koko-eating-bananas/Figures/875/875-sol_1.png)

### Brute Force

- __Time complexity__: ```O(n * m)```
- __Space complexity__: ```O(1)```

```Python
class Solution:
    def minEatingSpeed(self, piles: List[int], h: int) -> int:
        # Brute Force
        ### Time Limit Exceeded
        n = len(piles)
        most = max(piles)
        if n == h:
            return most

        for speed in range(1, most + 1):
            hour = h
            for pile in piles:
                hour -= math.ceil(pile / speed)
            if hour >= 0:
                return speed
```

```Python
class Solution:
    def minEatingSpeed(self, piles: List[int], h: int) -> int:
        speed = 1

        while True:
            hours = 0
            for pile in piles:
                hours += math.ceil(pile / speed)
            if hours <= h:
                return speed
            speed += 1
```

### Binary Search

![image](https://leetcode.com/problems/koko-eating-bananas/Figures/875/875-ana.png)

![image](https://leetcode.com/problems/koko-eating-bananas/Figures/875/875-ana_2.png)

```Python
class Solution:
    def minEatingSpeed(self, piles: List[int], h: int) -> int:
        lo, hi = 1, max(piles)
        n = len(piles)
        if n == h:
            return max(piles)

        while lo < hi:
            mi = lo + (hi - lo) // 2
            hours = 0
            for pile in piles:
                hours += math.ceil(pile / mi)
            
            if hours <= h:
                hi = mi
            else:
                lo = mi + 1
        return hi
```

```Python
class Solution:
    def minEatingSpeed(self, piles: List[int], h: int) -> int:
        lo, hi = 1, max(piles)
        n = len(piles)
        if n == h:
            return max(piles)

        while lo < hi:
            mi = lo + (hi - lo) // 2
            hours = h
            for pile in piles:
                hours -= math.ceil(pile / mi)
            
            if hours >= 0:
                hi = mi
            else:
                lo = mi + 1
        return hi
```
