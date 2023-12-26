## [904. Fruit Into Baskets](https://leetcode.com/problems/fruit-into-baskets)

```Tag```: ```Sliding Window``` ```Hash Map```

#### Difficulty: Medium

You are visiting a farm that has a single row of fruit trees arranged from left to right. The trees are represented by an integer array ```fruits``` where ```fruits[i]``` is the type of fruit the i<sup>th</sup> tree produces.

You want to collect as much fruit as possible. However, the owner has some strict rules that you must follow:

- You only have two baskets, and each basket can only hold a single type of fruit. There is no limit on the amount of fruit each basket can hold.
- Starting from any tree of your choice, you must pick exactly one fruit from every tree (including the start tree) while moving to the right. The picked fruits must fit in one of your baskets.
- Once you reach a tree with fruit that cannot fit in your baskets, you must stop.

Given the integer array ```fruits```, return _the __maximum number__ of fruits you can pick_.

![image](https://user-images.githubusercontent.com/35042430/217147952-2d1b2470-dfe9-49c5-9809-4494f1bce3bc.png)

---

__Example 1:__
```
Input: fruits = [1,2,1]
Output: 3
Explanation: We can pick from all 3 trees.
```

__Example 2:__
```
Input: fruits = [0,1,2,2]
Output: 3
Explanation: We can pick from trees [1,2,2].
If we had started at the first tree, we would only pick from trees [0,1].
```

__Example 3:__
```
Input: fruits = [1,2,3,2,2]
Output: 4
Explanation: We can pick from trees [2,3,2,2].
If we had started at the first tree, we would only pick from trees [1,2].
```

__Constraints:__

- 1 <= ```fruits.length``` <= 10<sup>5</sup>
- ```0 <= fruits[i] < fruits.length```

---

![image](https://leetcode.com/problems/fruit-into-baskets/solutions/2960000/Figures/904/904-example_1.png)

![image](https://leetcode.com/problems/fruit-into-baskets/solutions/2960000/Figures/904/904-example_2.png)

### Brute Force

__Algorithm__

1. Initialize ```max_picked = 0``` to track the maximum number of fruits we can collect.
2. Iterate over the left index ```slow``` of subarrays.
3. For every subarray start at index ```left```, iterate over every index ```right``` to fix the end of subarray.
4. For each subarray ```(left, right)```, count the types of fruits it contains.
  - If there are no more than 2 types, this subarray is valid, we take its length to update ```max_picked```.
  - Otherwise, if the current subarray is __invalid__, we move on to the next subarray.
5. Once we finish the iteration, return ```max_picked``` as the maximum number of fruits we can collect.

```Python
class Solution:
    def totalFruit(self, fruits: List[int]) -> int:
        # Brute Force
        max_picked = 0
        n = len(fruits)
        for slow in range(n):
            for fast in range(slow, n):
                basket = set()
                for curr in range(slow, fast + 1):
                    basket.add(fruits[curr])
                if len(basket) <= 2:
                    max_picked = max(max_picked, fast - slow + 1)
        return max_picked
```

### Optimized Brute Force

![image](https://leetcode.com/problems/fruit-into-baskets/solutions/2960000/Figures/904/904-no_dup.png)

![image](https://leetcode.com/problems/fruit-into-baskets/solutions/2960000/Figures/904/904-early_stop.png)

#### Algorithm

1. Initialize ```max_picked``` as 0.
2. Iterate over ```left```, the left index of the subarray.
3. For every subarray start at index ```left```, we iterate over every index ```right``` to fix the end of subarray, and calculate the types of fruits in this subarray.
  - If there are no more than 2 types, this subarray is valid, we update ```max_picked``` with the length of this subarray.
  - Otherwise, the current subarray, as well as all the longer subarrays (with the same left index ```left```) are invalid. Move on to the next left index ```left + 1```.
4. Once we finish the iteration, return ```max_picked``` as the maximum number of fruits we can collect.

```Python
class Solution:
    def totalFruit(self, fruits: List[int]) -> int:
        # Optimized Brute Force
        max_picked = 0

        for left in range(len(fruits)):
            basket = set()
            right = left
            while right < len(fruits):
                # Check if adding new fruits makes 3 types of fruit in basket
                if not fruits[right] in basket and len(basket) == 2:
                    break
                # Otherwise, add fruit to the basket
                basket.add(fruits[right])
                right += 1
            max_picked = max(max_picked, right - left)
        
        return max_picked
```

### Sliding Window

![image](https://leetcode.com/problems/fruit-into-baskets/solutions/2960000/Figures/904/904_sw_exp.png)

#### Algorithm

1. Start with an empty window with ```left``` and ```right``` as its left and right index.
2. We iterate over ```right``` and add ```fruits[right]``` to this window.
  - If the number is no larger than 2, meaning that we collect no more than 2 types of fruits, this subarray is valid.
  - Otherwise, it is not the right time to expand the window and we must keep its size. Since we have added one fruit from the right side, we should remove one fruit from the left side of the window, and increment ```left``` by 1.
3. Once we are done iterating, the difference between ```left``` and ```right``` stands for the longest valid subarray we encountered, i.e. the maximum number of fruits we can collect.

```Python
class Solution:
    def totalFruit(self, fruits: List[int]) -> int:
        # Sliding Window
        basket = collections.defaultdict(int)
        left = 0

        for right, fruit in enumerate(fruits):
            if not fruit in basket:
                basket[fruit] = 1
            else:
                basket[fruit] += 1
            
            # Check if current window has more than 2 types of fruits
            if len(basket) > 2:
                # Remove 1 fruit from the left index of the window
                basket[fruits[left]] -= 1

                # Check if number of the fruit at left index of the window is now 0, update the basket
                if basket[fruits[left]] == 0:
                    del basket[fruits[left]]
                left += 1
        
        return right - left + 1
```

### Optimized Sliding Window

![image](https://leetcode.com/problems/fruit-into-baskets/solutions/2960000/Figures/904/904_sc_3.png)

__Time Complexity__: ```O(N)```, iterate through the input array once

__Space Complexity__: ```O(1)```, only maintain at most 3 types of fruit in the basket hashmap at any given time

```Python
class Solution:
    def totalFruit(self, fruits: List[int]) -> int:
        # Sliding Window
        basket = collections.defaultdict(int)
        left = 0
        max_picked = 0

        for right, fruit in enumerate(fruits):
            if not fruit in basket:
                basket[fruit] = 1
            else:
                basket[fruit] += 1
            
            # Check if current window has more than 2 types of fruit, keep removing the fruits from the left index
            while len(basket) > 2:
                basket[fruits[left]] -= 1
                # Check if quantity of fruit[left] is 0, update the basket
                if basket[fruits[left]] == 0:
                    del basket[fruits[left]]
                left += 1
            
            max_picked = max(max_picked, right - left + 1)
        
        return max_picked
```
