## 1011. Capacity To Ship Packages Within D Days

```Tag```: ```Binary Search```

#### Difficulty: Medium

A conveyor belt has packages that must be shipped from one port to another within ```days``` days.

The i<sup>th</sup> package on the conveyor belt has a weight of ```weights[i]```. Each day, we load the ship with packages on the conveyor belt (in the order given by ```weights```). We may not load more weight than the maximum weight capacity of the ship.

Return _the least weight capacity of the ship that will result in all the packages on the conveyor belt being shipped within ```days``` days_.

![image](https://user-images.githubusercontent.com/35042430/220540582-77d06c24-63b9-4a50-a725-4bb937d30ab2.png)

---

__Example 1:__
```
Input: weights = [1,2,3,4,5,6,7,8,9,10], days = 5
Output: 15
Explanation: A ship capacity of 15 is the minimum to ship all the packages in 5 days like this:
1st day: 1, 2, 3, 4, 5
2nd day: 6, 7
3rd day: 8
4th day: 9
5th day: 10

Note that the cargo must be shipped in the order given, so using a ship of capacity 14 and splitting the packages into parts like (2, 3, 4, 5), (1, 6, 7), (8), (9), (10) is not allowed.
```

__Example 2:__
```
Input: weights = [3,2,2,4,1,4], days = 3
Output: 6
Explanation: A ship capacity of 6 is the minimum to ship all the packages in 3 days like this:
1st day: 3, 2
2nd day: 2, 4
3rd day: 1, 4
```

__Example 3:__
```
Input: weights = [1,2,3,1,1], days = 4
Output: 3
Explanation:
1st day: 1
2nd day: 2
3rd day: 3
4th day: 1, 1
```

__Constraints:__

- ```1 <= days <= weights.length <= 5 * 10^4```
- ```1 <= weights[i] <= 500```

---

- If we cannot ship the packages in the required days with capacity ```A```, we can never ship the packages with capacity less than ```A```. 
- Also, if we can ship the packages in the required days with capacity ```B```, we can always ship it with capacity greater than ```B```. So, in such a case, the optimal capacity lies between ```[A + 1, B]``` (both inclusive).

A scenario like this where our task is to search for an element ```X``` from a given range ```(L, R)``` where all values smaller than ```X``` do not satisfy a certain condition and all values greater than or equal to ```X``` satisfy it (or vice-versa), can be solved optimally with a binary search algorithm. In binary search, we repeatedly divide the solution space where the answer could be in half until the range contains just one element.

![image](https://leetcode.com/problems/capacity-to-ship-packages-within-d-days/solutions/2934252/Figures/1011/1011-1.png)

Following the above discussion, we set the starting of the range to the largest weight in ```weights```, say ```max_weight``` and set the ending of the range to the sum of the elements of ```weights```, say ```total_weight```. We define two variables, ```left = max_weight``` and ```right = total_weight``` to indicate the start and end of the range, respectively. Notice that the end of the range ```right``` is always a way to ship the elements within the required ```days```.

- If we are able to ship the packages with ```mid``` capacity within the required ```days```, we know the answer is at most ```mid```, so we can look for a better answer by moving to the lower half - change ```right = mid```.
- Otherwise, if we are not able to ship the packages with ```mid``` capacity, we cannot ship the packages with any capacity less than or equal to ```mid```. So, we move to the upper half of the range by moving ```left = mid + 1```.

To check whether we can ship all the packages with a given capacity, ```capacity```, we create a method and define two variables in it, ```days_needed = 1``` and ```current_load = 0``` which store the total number of days needed to ship all the weights with ```capacity``` ship capacity and to keep track of how much weight has been placed in the ship on a day, respectively. We iterate over all the ```weights```, and for each weight, we place the weight in the ship and increase its load to ```current_load = current_load + weight```. We keep on placing the weights until ```current_load > capacity```. 

- If ```current_load``` exceeds ```capacity```, we cannot keep adding ```weight``` and need an additional day. So, we increase the days needed to ship the packages by one, i.e., ```days_needed = days_needed + 1``` we also set ```current_load = weight``` as this is the current load for the next day. Finally, if days_needed <= days, we return ```True```. 
- Otherwise, we return ```False```.    

### Binary Search

```Python
class Solution:
    def shipWithinDays(self, weights: List[int], days: int) -> int:
        # Binary Search
        def feasible(capacity):
            days_needed = 1
            current_load = 0
            for weight in weights:
                current_load += weight
                if current_load > capacity:
                    days_needed += 1
                    current_load = weight
            return days_needed <= days
        
        max_load = total_load = 0
        for weight in weights:
            max_load = max(max_load, weight)
            total_load += weight
        
        left, right = max_load, total_load
        while left < right:
            mid = left + (right - left) // 2
            if feasible(mid):
                right = mid
            else:
                left = mid + 1
        return left
```

```Python
class Solution:
    def shipWithinDays(self, weights: List[int], days: int) -> int:
        # Binary Search
        def calculate_capacity(capacity):
            count = 1
            maximum = capacity
            for weight in weights:
                if weight > maximum:
                    maximum = capacity
                    count += 1
                maximum -= weight
            return count <= days

        lo, hi = max(weights), sum(weights)
        while lo < hi:
            capacity = lo + (hi - lo) // 2
            if calculate_capacity(capacity):
                hi = capacity
            else:
                lo = capacity + 1
        return lo
```

```Python
class Solution:
    def shipWithinDays(self, weights: List[int], days: int) -> int:
        # Binary Search
        def calculate_capacity(capacity):
            count = 1
            maximum = capacity
            for weight in weights:
                if weight > maximum:
                    maximum = capacity
                    count += 1
                maximum -= weight
            return count <= days

        lo, hi = max(weights), sum(weights)
        min_capacity = lo
        while lo <= hi:
            capacity = lo + (hi - lo) // 2
            if calculate_capacity(capacity):
                min_capacity = capacity
                hi = capacity - 1
            else:
                lo = capacity + 1
        return min_capacity
```
