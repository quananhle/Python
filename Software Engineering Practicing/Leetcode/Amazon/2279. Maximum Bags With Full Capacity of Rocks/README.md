## 2279. Maximum Bags With Full Capacity of Rocks

```Tag```: ```Greedy Algorithm``` ```Array``` ```Sorting``` ```Hash Table```

#### Difficulty: Medium

You have ```n``` bags numbered from ```0``` to ```n - 1```. You are given two ```0-indexed``` integer arrays ```capacity``` and ```rocks```. The i<sup>th</sup> bag can hold a maximum of ```capacity[i]``` rocks and currently contains ```rocks[i]``` rocks. You are also given an integer ```additionalRocks```, the number of additional rocks you can place in any of the bags.

Return _the __maximum number__ of bags that could have full capacity after placing the additional rocks in some bags_.

![image](https://user-images.githubusercontent.com/35042430/209719042-bc79001d-0bbb-4ae7-ab94-545ee55707f5.png)

---

__Example 1:__
```
Input: capacity = [2,3,4,5], rocks = [1,2,4,4], additionalRocks = 2
Output: 3
Explanation:
Place 1 rock in bag 0 and 1 rock in bag 1.
The number of rocks in each bag are now [2,3,4,4].
Bags 0, 1, and 2 have full capacity.
There are 3 bags at full capacity, so we return 3.
It can be shown that it is not possible to have more than 3 bags at full capacity.
Note that there may be other ways of placing the rocks that result in an answer of 3.
```

__Example 2:__
```
Input: capacity = [10,2,2], rocks = [2,2,0], additionalRocks = 100
Output: 3
Explanation:
Place 8 rocks in bag 0 and 2 rocks in bag 2.
The number of rocks in each bag are now [10,2,2].
Bags 0, 1, and 2 have full capacity.
There are 3 bags at full capacity, so we return 3.
It can be shown that it is not possible to have more than 3 bags at full capacity.
Note that we did not use all of the additional rocks.
```

__Constraints:__
```
n == capacity.length == rocks.length
1 <= n <= 5 * 104
1 <= capacity[i] <= 109
0 <= rocks[i] <= capacity[i]
1 <= additionalRocks <= 109
```

---

### Greedy Algorithm

```Python
class Solution:
    def maximumBags(self, capacity: List[int], rocks: List[int], additionalRocks: int) -> int:
        # Greedy Algorithm
        spaces = list()
        for caps, rock in zip(capacity, rocks):
            spaces.append(caps - rock)
        spaces.sort()
        # Check if there is not enough rock to fill the least empty capacity bag
        if spaces[0] > additionalRocks:
            return 0
        for idx, cap in enumerate(spaces):
            additionalRocks -= cap
            if additionalRocks < 0:
                return idx
        # Check if there are more rocks to fill than empty capacity
        return len(capacity)
```

```Python
class Solution:
    def maximumBags(self, capacity: List[int], rocks: List[int], additionalRocks: int) -> int:
        # Greedy Algorithm
        #### Time Complexity: O(NlogN), sort opeartions take NlogN time
        #### Space Complexity: O(N), extra space to store the empty capacity
        remaining_capacity = [cap - rock for cap, rock in zip(capacity, rocks)]
        remaining_capacity.sort()
        count = 0

        for cap in remaining_capacity:
            if additionalRocks >= cap:
                additionalRocks -= cap
                count += 1
            else:
                break
        return count 
```
