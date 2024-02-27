## [1642. Furthest Building You Can Reach](https://leetcode.com/problems/furthest-building-you-can-reach)

```Tag```: ```Priority Queue``` ```Binary Search```

#### Difficulty: Medium

You are given an integer array ```heights``` representing the heights of buildings, some ```bricks```, and some ```ladders```.

You start your journey from building ```0``` and move to the next building by possibly using bricks or ladders.

While moving from building ```i``` to building ```i+1``` (__0-indexed__),

- If the current building's height is greater than or equal to the next building's height, you do not need a ladder or bricks.
- If the current building's height is less than the next building's height, you can either use one ladder or $(h[i+1] - h[i])$ bricks.

Return _the furthest building index (__0-indexed__) you can reach if you use the given ladders and bricks optimally_.

![image](https://github.com/quananhle/Python/assets/35042430/0a184ef2-5ff5-4f53-9678-c587eb7ae955)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/10/27/q4.gif)
```
Input: heights = [4,2,7,6,9,14,12], bricks = 5, ladders = 1
Output: 4
Explanation: Starting at building 0, you can follow these steps:
- Go to building 1 without using ladders nor bricks since 4 >= 2.
- Go to building 2 using 5 bricks. You must use either bricks or ladders because 2 < 7.
- Go to building 3 without using ladders nor bricks since 7 >= 6.
- Go to building 4 using your only ladder. You must use either bricks or ladders because 6 < 9.
It is impossible to go beyond building 4 because you do not have any more bricks or ladders.
```

__Example 2:__
```
Input: heights = [4,12,2,7,3,18,20,3,19], bricks = 10, ladders = 2
Output: 7
```

__Example 3:__
```
Input: heights = [14,3,19,3], bricks = 17, ladders = 0
Output: 3
```

__Constraints:__

- $1 \le heights.length \le 10^5$
- $1 \le heights[i] \le 10^6$
- $0 \le bricks \le 10^9$
- $0 \le ladders \le heights.length$

---

### Min-Heap

![image](https://leetcode.com/problems/furthest-building-you-can-reach/Figures/1642/example_1.png)

The best strategy is to use the ladders for the longest climbs and the bricks for the shortest climbs. This shouldn’t seem too surprising; a ladder is most valuable in the cases where we would have to use a lot of bricks.

![image](https://leetcode.com/problems/furthest-building-you-can-reach/Figures/1642/example_1_solution.png)

```
define function furthestBuilding(heights, bricks, ladders):
    ladder_allocations = a new min heap
    for each i from 0 to heights.length - 2 (including the end point):
        current_height = heights[i]
        next_height = heights[i + 1]
        difference = next_height - current_height
        if difference is 0 or difference is negative:
            continue
        rename difference to climb
        if there are ladders remaining:
            add climb to ladder_allocations
            subtract 1 from ladders
        else: (There are no ladders remaining)
            smallest_ladder_allocation = peek at the minimum in ladder_allocations
            if smallest_ladder_allocation is null or climb is smaller:
                subtract climb from bricks
            else: (smallest_ladder_allocation is smaller)
                pop smallest_ladder_allocation from ladder_allocations
                add climb to ladder_allocations
                subtract smallest_ladder_allocation from bricks
            if bricks is now negative:
                return i (we didn't have enough bricks to climb to i + 1)
    return heights.length - 1 (we must have covered all of the climbs)
```

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N\log{N})$ or $\mathcal{O}(N\log{L})$
- __Space Complexity__: $\mathcal{O}(N)$ or $\mathcal{O}(L)$

```Python
class Solution:
    def furthestBuilding(self, heights: List[int], bricks: int, ladders: int) -> int:
        n = len(heights)
        ladder_allocations = list()
        
        for i in range(n - 1):
            height_difference = heights[i + 1] - heights[i]
            if height_difference <= 0:
                continue
            
            climb = height_difference
            del height_difference

            if ladders:
                heapq.heappush(ladder_allocations, climb)
                ladders -= 1
            else:
                if ladder_allocations:
                    smallest_ladder_allocation = heapq.heappop(ladder_allocations)
                    if smallest_ladder_allocation < climb:
                        heapq.heappush(ladder_allocations, climb)
                        bricks -= smallest_ladder_allocation
                    else:
                        heapq.heappush(ladder_allocations, smallest_ladder_allocation)
                        bricks -= climb
                else:
                    bricks -= climb
                if bricks < 0:
                    return i
            
        return n - 1
```

```
define function furthestBuilding(heights, bricks, ladders):
    ladder_allocations = a new min heap
    for each i from 0 to heights.length - 2 (including the end point):
        current_height = heights[i]
        next_height = heights[i + 1]
        difference = next_height - current_height
        if difference is 0 or difference is negative:
            continue
        rename difference to climb
        add climb to ladder_allocations
        if climbs in ladder_allocations is now greater than ladders:
            smallest_ladder_allocation = remove minimum from ladder_allocations
            subtract smallest_ladder_allocation from bricks
            if bricks is now negative:
                return i (we didn't have enough bricks to climb to i + 1)
    return heights.length - 1 (we must have covered all of the climbs)
```

```Python
class Solution:
    def furthestBuilding(self, heights: List[int], bricks: int, ladders: int) -> int:
        n = len(heights)
        height_differences = list()

        for i in range(1, n):
            climb = heights[i] - heights[i - 1]
            if climb <= 0:
                continue
            heapq.heappush(height_differences, climb)
            if len(height_differences) <= ladders:
                continue
            bricks -= heapq.heappop(height_differences)
            if bricks < 0:
                return i - 1

        return n - 1
```

### Max-Heap

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N\log{N})$
- __Space Complexity__: $\mathcal{O}(N)$

```Python
class Solution:
    def furthestBuilding(self, heights: List[int], bricks: int, ladders: int) -> int:
        n = len(heights)
        bricks_allocations = list()

        for i in range(1, n):
            height = heights[i] - heights[i - 1]
            if height <= 0:
                continue
            heapq.heappush(bricks_allocations, -height)
            bricks -= height

            if bricks < 0 and ladders == 0:
                return i - 1
            
            if bricks < 0:
                bricks += -heapq.heappop(bricks_allocations)
                ladders -= 1

        return n - 1
```

```Python
class Solution:
    def furthestBuilding(self, heights: List[int], bricks: int, ladders: int) -> int:
        n = len(heights)
        bricks_allocations = list()

        for i in range(1, n):
            height = heights[i] - heights[i - 1]
            if height <= 0:
                continue
            heapq.heappush(bricks_allocations, -height)
            bricks -= height

            if ladders and bricks < 0:
                bricks -= heapq.heappop(bricks_allocations)
                ladders -= 1
            
            if not ladders and bricks < 0:
                return i - 1
            
        return n - 1
```

---

### Binary Search

#### Observation.

Given an input, determining whether or not it is possible to go all the way across is an easy problem; you could simply make a list of all the climbs, min-sort it, and then cover as many climbs as you can with bricks, and then cover the rest with ladders. If this covered the entire climb list, then you’d know that it was possible to get all the way across.

Whenever you have an algorithm based on linear search that is too slow, your brain should be jumping straight to thinking about binary search. Binary search can be used whenever the list is sorted on the property we’re searching for.

There are two main parts to this algorithm: checking whether or not a given building is reachable and using a binary search to decide which buildings to check.

```
heights, bricks, and ladders are as specified in the problem

define function isReachable(building_index):
    climbs = a new list
    for each i between 0 and building_index - 1 (inclusive):
        climb_distance = heights[i + 1] - heights[i]
        if climb_distance is positive:
            add climb_distance to climbs
    min-sort climbs
    bricks_remaining = bricks
    ladders_remaining = ladders
    for each climb in climbs:
        if there are enough bricks_remaining for climb:
            subtract climb from bricks_remaining
        else if there is at least one ladder left:
            subtract 1 from ladders_available
        else:
            return false
     return true
```

> The importance of being able to methodically design and implement a binary search cannot be understated. You'll almost certainly encounter it in multiple interviews. Focus firstly on your accuracy and then work on your coding speed. While coding fast and correctly is the ideal, keep in mind that accuracy is still worth more than speed. Buggy code is bad, no matter how quickly you wrote it.

These are the questions we'll be answering and then putting into code.

1. What is the target item, value, and type?

We want to know which building in the ```heights``` array (i.e., not a climb distance) is the final-reachable-building. Buildings are identified by indexes in the array; therefore, we're looking for the index in ```heights``` that corresponds to the final-reachable-building. It might sound obvious in this case, but it's always important to pinpoint whether we're looking for an index, between two indexes, or something else entirely.

2. What bounds must the target item be within?

The highest possible index for the final-reachable-building is ```heights.length - 1``` (i.e. the last building in ```heights```). In the worst case, the only building we’ll be able to reach is the building at index ```0``` (which we can always reach). Therefore, the answer could be anywhere from ```0``` to ```heights.length - 1```, inclusive of both of these endpoints. In the binary search code, this will be:
```
lo, hi = 0, len(heights) - 1
```

> Notice that we haven't used ```hi = heights.length``` or ```lo = -1```, or anything else like that. People are sometimes tempted to put that stuff in to "cover edge cases", handle inclusive vs. exclusive endpoints, etc., without fully understanding what they were trying to achieve with it. It's generally easiest to set ```lo``` to represent the lowest possible position of the target and ```hi``` to be the highest possible position.

3. How do we know when we found the target?

Often in a binary search, we immediately know when we've found the answer. For example, if the problem was to search for ```12``` in a sorted array, then as soon as the value at ```mi``` is ```12```, we can return ```True```.

For this problem, though, we can't do that. If the value of ```isReachable(mi)``` is ```True```, then it is possible that it is indeed the final-reachable-building, but it is also very possible that the final-reachable-building is further to the right. Because of this, we should instead shrink the search space down to length-one (i.e., to where ```lo = hi```) and then determine whether or not that one item is the one we want. In this case, we know that the target definitely exists, so as soon as the search space is of length-one, the index in it is for the final-reachable-building.

```
lo, hi = 0, len(heights) - 1
while lo is less than hi:
    Details here are still to be decided
return lo
```

4. What can we conclude when ```isReachable(mi)``` returns ```True``` ("yes")?

If ```isReachable(mi)``` returns ```True```, then we know that the building at ```mi``` is __reachable__. We're no longer interested in any of the buildings before ```mi```, as they can’t possibly be the final-reachable-building (as ```mi``` is further than them). We don't know whether or not the building at ```mi + 1``` is reachable, though, and nor should we check right now. Remembering that ```lo``` and ```hi``` represent the boundaries of where the final-reachable-building could be, we should set ```lo = mi```. This means that the building at ```mi``` is now the lowest building in the search range.

> Setting ```lo = mi + 1``` would be incorrect here because it’s possible that all buildings from ```mi + 1``` onwards are not reachable, and that we’ve just chopped the final-reachable-building out of the search space (remember, we want to shrink the search space down to a single index; the index of the final-reachable-building).

5. What can we conclude when ```isReachable(mi)``` returns ```False``` ("no") ?

If ```isReachable(mi)``` returns ```False```, then we know that the building at ```mi``` is __not reachable__. This means that none of the buildings after ```mi``` could possibly be reachable either. Therefore, the final reachable building must be before ```mi```; in other words, the highest possible candidate now is ```mi - 1```. So we should set ```hi = mi - 1```.

> A common mistake here is to simply use ```hi = mi``` so as to avoid having to reason about whether or not to put the ```- 1```. This is very problematic, though, as whenever you’re doing a binary search with the while lo is less than ```hi``` condition (i.e., reducing the search space to length-one), you must have at least one of ```hi = mi - 1``` and ```lo = mi + 1```. If you have neither of these, then your algorithm might infinitely loop once the search space is of length-two.

Updating our code with the latest details we've determined, here is what we have so far.

```
lo, hi = 0, len(heights) - 1
while lo is less than hi:
    mi = [formula to be decided]
    if building at mi is reachable:
        lo = mi
    else:
        hi = mi - 1
return lo
```

6. Which calculation for ```mi``` should we use?

On an odd-lengthed search space, identifying the midpoint is straightforward. On even-lengthed search spaces, though, we have two possible midpoints. The final step of the binary search algorithm design process is to decide whether it is the lower or higher midpoint that should be used.

Your decision should be based on how you are updating hi and lo (i.e., ```lo = mi``` and ```hi = mi - 1``` for the algorithm we've designed here). Think about what happens once the search space is of length-two. You must ensure that the search space is guaranteed to be shrunk down to length-one, regardless of which condition is executed. If you take the lower middle, it will sometimes infinitely loop. And if you take the upper middle, it will be guaranteed to shrink the search space down to one.

So, it is the upper-middle that we want.

> The short rule to remember is: if you used ```hi = mi - 1```, then use the higher midpoint. If you used ```lo = mi + 1```, then use the lower midpoint. If you used both of these, then you can use either midpoint. If you didn’t use either (i.e., you have ```lo = mi``` and ```hi = mi```), then, unfortunately, your code is buggy, and you won’t be able to guarantee convergence.

Whenever we want the upper middle, we use either ```mi = (lo + hi + 1) // 2``` or ```mi = lo + (hi - lo + 1) // 2``` or ```mi = hi - (hi - lo) // 2```. Thus, for lower middle, ```mi = lo + (hi - lo) // 2```. These formulas ensure that on even-lengthed search spaces, the upper middle is chosen and on odd-lengthed search spaces, the actual middle is chosen.

This completes our binary search algorithm.

```
lo, hi = 0, len(heights) - 1
while lo is less than hi:
    mi = lo + (hi - lo + 1) / 2
    if building at mi is reachable:
        lo = mi
    else:
        hi = mi - 1
return lo
```

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N \log^2{N})$
- __Space Complexity__: $\mathcal{O}(N)$

```Python
class Solution:
    def furthestBuilding(self, heights: List[int], bricks: int, ladders: int) -> int:
        def is_reachable(building_idx):
            height_differences = list()
            for h1, h2 in zip(heights[:building_idx], heights[1:building_idx+1]):
                if h2 - h1 > 0:
                    height_differences.append(h2 - h1)
            height_differences.sort()
            bricks_remaining = bricks
            ladders_remaining = ladders
            for climb in height_differences:
                # Bricks to be used first to smaller height
                if climb <= bricks_remaining:
                    bricks_remaining -= climb
                # If not enough bricks, use ladder
                elif ladders_remaining >= 1:
                    ladders_remaining -= 1
                # If there is no ladder, can't go any further
                else:
                    return False
            return True

        lo, hi = 0, len(heights) - 1
        while lo < hi:
            mi = hi - (hi - lo) // 2
            if is_reachable(mi):
                lo = mi
            else:
                hi = mi - 1
        
        return lo
```

#### Improved Binary Search

If we were to simply extract all the climbs, put them in a list, and sort them, then ```isReachable(...)``` would run into the problem of not knowing which climbs are within the relevant range and which are not. The solution to this is surprisingly simple, though: attach an index to each climb in the climbs list. This way, ```isReachable(...)``` can iterate over the sorted list in the same fashion as before, but with an extra conditional telling it to skip any climbs with an index higher than the index of the building we're checking the reachability of.

__Algorithm__

```
heights, bricks, and ladders are as specified in the problem

sorted_climbs = a new list
for each i between 0 and heights.length - 2 (inclusive):
    difference = heights[i + 1] - heights[i]
    if difference is positive:
        add pair(difference, i + 1) to sorted_climbs
min-sort sorted_climbs using the first value (climb distances) of each pair
```

While the binary search algorithm stays the same, the implementation of ```isReachable(...)``` needs to be changed slightly. We no longer need to build and sort a list of climbs within it. We should, instead, use ```sorted_climbs``` and add an additional check to skip any climbs that are beyond the index we're checking the reachability of.

```
heights, bricks, and ladders are as specified in the problem
sorted_climbs is the list we defined just above

define function isReachable(building_index):
    bricks_remaining = bricks
    ladders_remaining = ladders
    for each value in sorted_climbs:
        climb, index = split value into its two parts
        if index is greater than building_index:
            continue to the next iteration
        if bricks_remaining is at least climb:
            subtract climb from bricks_remaining
        else if ladders_remaining greater than 0:
            subtract 1 from ladders_available
        else:
            return false
     return true
```

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N \log{N})$
- __Space Complexity__: $\mathcal{O}(N)$

```Python
class Solution:
    def furthestBuilding(self, heights, bricks, ladders):
        # Make a sorted list of all the climbs
        sorted_climbs = []
        for i in range(len(heights) - 1):
            climb = heights[i + 1] - heights[i]
            if climb <= 0:
                continue
            sorted_climbs.append((climb, i + 1))
        sorted_climbs.sort()

        def is_reachable(building_index, bricks, ladders):
            for climb, index in climbs:
                # Check if this climb is within the range.
                if index > building_index:
                    continue
                # In a sorted heights, allocate bricks first if enough remain; otherwise, allocate a ladder if at least one remains
                if climb <= bricks:
                    bricks -= climb
                elif ladders >= 1:
                    ladders -= 1
                else:
                    return False
            return True

        lo, hi = 0, len(heights) - 1
        while lo < hi:
            mi = hi - (hi - lo) // 2
            if is_reachable(mi, sorted_climbs, bricks, ladders):
                lo = mi
            else:
                hi = mi - 1
        # Note that return lo would be equivalent
        return hi  
```

### Binary Search on Threshold (Advanced)

All of our approaches so far have used a strategy of allocating bricks to the shortest climbs and ladders to the longest climbs until no ladders or "usable" bricks remained. This guaranteed that at least one of the following conditions was true at the end.

- We reached the final building.
- We were not able to go any further, and there was no way of rearranging bricks or ladders so that we could go any further.

Let's quickly define and prove what we mean by "we were not able to go any further".

More precisely, each of the previous approaches guaranteed that all of the following conditions were true of an optimal solution (in cases where it was not possible to reach the final building).

1. There were no ```ladders``` remaining, and there were not enough bricks for the next climb.
2. The number of ```bricks``` remaining at the end was *less* than the length of the shortest climb to use a ladder.
3. The longest climb to use bricks was shorter than, or equal to, the shortest climb to use a ladder.

Condition 3 from above is particularly interesting: the longest climb to use bricks is not greater than the shortest climb to use a ladder. The implication of this is that for all optimal solutions identified by our previous approaches, there exists some threshold value, ```K```, where the shortest climb to use a ladder is equal to this ```K```, and there is no climb greater than ```K``` that used bricks.

If we somehow knew ```K``` beforehand (we don't, but let's just follow this thought through), then coming up with the optimal solution could be done in linear time and constant space! Let's write an algorithm to do exactly this.

The main challenge in designing the algorithm is handling climbs of length ```K``` itself; some will be with ```bricks```, and others with ```ladders```. We'll start by pretending that all climb lengths are unique, and as such, there will be at most one climb of length ```K```, and this would be covered with a ladder.

```
heights, bricks, and ladders are as specified in the problem

define function solveWithGivenThreshold(K):
    
    ladders_remaining = ladders
    bricks_remaining = bricks
    
    for each i between 0 and building_index - 1 (inclusive):
    
        climb = heights[i + 1] - heights[i]
        if climb is not positive:
            continue (this is not a climb)
    
        if climb is greater than or equal to K:
            subtract 1 from ladders_remaining
        else:
            subtract climb from bricks_remaining
    
        if bricks_remaining or ladders_remaining is now negative:
            return i
    
    return heights.length - 1
```

The way that we can make it work with non-unique climb lengths is to allocate ladders to climbs of length ```K```, but keep track of how many ladders were allocated in this way. If we then come across a climb of length ```K``` when we only have bricks left, we should simply cover it with bricks. And if we come across a climb longer than ```K``` and are out of ladders, we should check if we used any ladders on ```K``` length climbs, and if so, attempt to replace that ladder with bricks to reclaim it. Essentially, we are optimizing the use of ```ladders``` and ```bricks``` on this edge case.

```
heights, bricks, and ladders are as specified in the problem

define function solveWithGivenThreshold(K):
    
    ladders_remaining = ladders
    bricks_remaining = bricks
    ladders_assigned_on_threshold = 0
    
    for each i between 0 and building_index - 1 (inclusive):
        
        climb = heights[i + 1] - heights[i]
        if climb is not positive:
            continue (this is not a climb)
        
        if climb is greater than or equal to K:
            subtract 1 from ladders_remaining
            if climb is equal to K:
                ladders_assigned_on_threshold += 1
        else:
            subtract climb from bricks_remaining
        
        if ladders_remaining is now negative:
            if ladders_assigned_on_threshold is positive:
                subtract 1 from ladders_assigned_on_threshold
                add 1 to ladders_remaining
                subtract K from bricks_remaining
                [Note: if this made bricks_remaining negative, the next condition will catch it]
            else:
                return i
        
        if bricks_remaining is now negative:
            return i

    return heights.length - 1
```

_Laying the foundations for a binary search on ```K```_

What is the range of values that this K could be?

Well, the shortest climb to use a ladder must be the shortest climb that can be extracted from the heights array. If K was this value, then potentially all climbs would be using a ladder, other than possibly a few of length K itself that were using bricks.

The other extreme would be that we're not using ladders at all. In this case, the shortest climb to use a ladder would essentially be 1 more than the longest climb from the height array (in code, we can get away with just setting it to be the length of the longest climb; the optimization around K itself will cover the possibility of no ladders being used on ```K```).

With this, we could do a linear search until we find a solution that is optimal, based on our definition above of an optimal solution. This linear search wouldn't work very well; the possible range in climb length is huge! In the worst case, it will be equal to the maximum height in heights, and according to the problem description, that is a very big number!

As I said earlier in this article, when linear search is too slow, consider using binary search!

A binary search would work by identifying the maximum possible value for ```K```, the lowest possible value, and then cutting out half of the possible values on each iteration.

We've already figured out a way of knowing if a solution is optimal, but in the case that it's not, how do we know whether the value we tried was too high or too low? It turns out there is a way, and that's what we're going to look at next.

Identifying when mid is greater than ```K```

If ```mid > K```, then it turns out that either we'd reach the final building regardless, or we'd have at least one ladder left over. But why?

Well, the optimal solution, whatever it is, makes CCC climbs. Additionally, we know that LLL of those climbs have to be with ladders (remember, optimal solutions that don't reach the end have to use all of the ladders!). These ladders were allocated to all climbs greater than K, and at least one climb equal to K. If mid was not optimal, then it has to have made a subset of those CCC climbs (i.e., it can't have covered any climbs that were beyond the optimal solution's final-reachable-building). Of that subset, it only put ladders on the climbs greater than K, which is strictly a smaller number of climbs than the optimal solution put ladders on. Therefore, there has to be at least one ladder left over at the end.

So, if there is at least one ladder left over, then we know that mid is too high.

Identifying when mid is less than ```K```

If ```mid < K```, then either we'd reach the final building regardless, or we'd have a non-optimal solution that used all of the ladders.

By setting mid below ```K```, we're essentially going to be wasting a lot of ladders on climbs that the optimal solution would have used bricks for. Remember that our not-optimal solution could only make a subset of the CCC climbs that the optimal solution must make. There are enough bricks to get to the optimal solution's final-reachable-index using a higher threshold, and so our lower threshold definitely won't run out of bricks. So, it will be running out of ladders that causes it to fail to go all of the way.

Putting everything together

You now have all the ingredients you need to assemble the code for this algorithm.

Firstly, we should modify the ```solveWithGivenThreshold``` function so that it returns a 2D array with 3 values: the index reached, ladders remaining, and bricks remaining. Secondly, we need to write the binary search. It needs to interpret the return value from ```solveWithGivenThreshold``` to know how to proceed with the search. Keep in mind: this algorithm is not allowed to use auxiliary memory!

```
define function furthestBuilding(heights, bricks, ladders):

    lo = find the minimum climb 
    hi = find the maximum climb
    if lo and hi are undefined (there was no climbs):
        return heights.length - 1

    while lo is not greater than hi:
        mid = lo + (hi - lo) / 2
        result = solveWithGivenThreshold(mid)
        index_reached, ladders_remaining, bricks_remaining = unpack result
        if index_reached is heights.length - 1:
            return heights.length - 1
        if ladders_remaining is not zero:
            hi = mid - 1
        else if the climb from index_reached to index_reached + 1 could be covered
                with the bricks_remaining, or bricks_remaining was at least K:
            lo = mid + 1
        else:
            return index_reached
```

- __Time Complexity__: $\mathcal{O}(N \log{maxClimb})$
- __Space Complexity__: $\mathcal{O}(1)$

```Python
class Solution:
    def furthestBuilding(self, heights, bricks, ladders):
        def solveWithGivenThreshold(K):
            ladders_remaining = ladders
            bricks_remaining = bricks
            ladders_used_on_threshold = 0

            for i in range(len(heights) - 1):
                climb = heights[i + 1] - heights[i]
                if climb <= 0:
                    continue
                
                if climb == K:
                    ladders_used_on_threshold += 1
                    ladders_remaining -= 1
                elif climb > K:
                    ladders_remaining -= 1
                else:
                    bricks_remaining -= climb
                
                if ladders_remaining < 0:
                    if ladders_used_on_threshold:
                        ladders_used_on_threshold -= 1
                        ladders_remaining += 1
                        bricks_remaining -= K
                    else:
                        return [i, ladders_remaining, bricks_remaining]

                if bricks_remaining < 0:
                    return [i, ladders_remaining, bricks_remaining]
            
            return [len(heights) - 1, ladders_remaining, bricks_remaining]

        lo, hi = math.inf, -math.inf
        for i in range(len(heights) - 1):
            climb = heights[i + 1] - heights[i]
            if climb <= 0:
                continue
            lo, hi = min(lo, climb), max(hi, climb)

            while lo <= hi:
                mi = lo + (hi - lo) // 2
                index_reached, ladders_remaining, bricks_remaining = solveWithGivenThreshold(mi)
                if index_reached == len(heights) - 1:
                    return len(heights) - 1
                if ladders_remaining > 0:
                    hi = mi - 1
                    continue
                next_climb = heights[index_reached + 1] - heights[index_reached]
                if bricks_remaining < next_climb and bricks_remaining < mi:
                    return index_reached
                
                lo = mi + 1
```
