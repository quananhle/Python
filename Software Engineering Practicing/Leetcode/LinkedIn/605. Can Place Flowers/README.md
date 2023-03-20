## [605. Can Place Flowers](https://leetcode.com/problems/can-place-flowers/)

```Tag```: ```Greedy```

#### Difficulty: Easy

You have a long flowerbed in which some of the plots are planted, and some are not. However, flowers cannot be planted in __adjacent__ plots.

Given an integer array ```flowerbed``` containing ```0```'s and ```1```'s, where ```0``` means empty and ```1``` means not empty, and an integer ```n```, return _if ```n``` new flowers can be planted in the ```flowerbed``` without violating the no-adjacent-flowers rule_.

![image](https://user-images.githubusercontent.com/35042430/226240518-c49af75c-b3c9-4ceb-8d6f-f838c0ba0130.png)

---

__Example 1:__
```
Input: flowerbed = [1,0,0,0,1], n = 1
Output: true
```

__Example 2:__
```
Input: flowerbed = [1,0,0,0,1], n = 2
Output: false
```

__Constraints:__

- 1 <= ```flowerbed.length``` <= 2 * 10<supp>4</sup>
- ```flowerbed[i]``` is ```0``` or ```1```.
- There are no two adjacent flowers in ```flowerbed```.
- ```0 <= n <= flowerbed.length```

---

```Python
class Solution:
    def canPlaceFlowers(self, flowerbed: List[int], n: int) -> bool:
        i = 0
        m = len(flowerbed)

        # Check if there is only 1 empty plot in the flowerbed
        if m == 1 and not flowerbed[0]:
            return True

        # Check if the first and second plots of the flowerbed are empty
        if not flowerbed[0] and not flowerbed[1]:
            n -= 1
            flowerbed[0] = 1
        
        # Check if the last and second to last plots of the flowerbed are empty
        if not flowerbed[m - 1] and not flowerbed[m - 2]:
            n -= 1
            flowerbed[m - 1] = 1
        
        # Iterate through the flowerbed
        while i < len(flowerbed) - 1:
            # Check the current plot and its left and right neighbor plots
            if flowerbed[i] == 0 and not flowerbed[i - 1] and not flowerbed[i + 1]:
                n -= 1
            # Iterate every two plots
            i += 2
        return n <= 0
```

```Python
class Solution:
    def canPlaceFlowers(self, flowerbed: List[int], n: int) -> bool:
        for i in range(len(flowerbed)):
            if flowerbed[i] == 0:
                empty_left = (i == 0) or (flowerbed[i - 1] == 0)
                empty_right = (i == len(flowerbed) - 1) or (flowerbed[i + 1] == 0)

                if empty_left and empty_right:
                    flowerbed[i] = 1
                    n -= 1
                    if n <= 0:
                        return True
        return n <= 0
```
