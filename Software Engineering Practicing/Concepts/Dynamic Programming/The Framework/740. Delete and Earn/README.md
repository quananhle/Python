## [740. Delete and Earn](https://leetcode.com/problems/delete-and-earn)

```Tag```: ```Dynamic Programming``` ```Recursion```

#### Difficulty: Medium

You are given an integer array ```nums```. You want to maximize the number of points you get by performing the following operation any number of times:

- Pick any ```nums[i]``` and delete it to earn ```nums[i]``` points. Afterwards, you must delete every element equal to ```nums[i] - 1``` and every element equal to ```nums[i] + 1```.

Return _the maximum number of points you can earn by applying the above operation some number of times_.

![image](https://user-images.githubusercontent.com/35042430/218806548-1039f922-ff0e-4125-89f6-c128ba865d96.png)

---

__Example 1:__
```
Input: nums = [3,4,2]
Output: 6
Explanation: You can perform the following operations:
- Delete 4 to earn 4 points. Consequently, 3 is also deleted. nums = [2].
- Delete 2 to earn 2 points. nums = [].
You earn a total of 6 points.
```

__Example 2:__
```
Input: nums = [2,2,3,3,3,4]
Output: 9
Explanation: You can perform the following operations:
- Delete a 3 to earn 3 points. All 2's and 4's are also deleted. nums = [3,3].
- Delete a 3 again to earn 3 points. nums = [3].
- Delete a 3 once more to earn 3 points. nums = [].
You earn a total of 9 points.
```

__Constraints:__

- ```1 <= nums.length <= 2 * 10^4```
- ```1 <= nums[i] <= 10^4```

---

### The Framework

#### Intuition

There are two characteristics of this problem that hint towards the use of dynamic programming (DP).

    1. The first is that the problem is asking us to find the maximum of something. 
    2. The second is that we need to make decisions on which numbers to take, and each decision may influence future decisions

The difficult part about this problem is figuring out how to always make the optimal decisions on which elements to take. Let's look at an example to illustrate the problem: ```nums = [5, 4, 5, 4, 3, 5, 3]```. As we mentioned above, we can convert this into a format that's easier to use. We have two ```3```, two ```4```, and three ```5```. That means:

- If we take all the ```3```, we get ```3 * 2 = 6``` points.
- If we take all the ```4```, we get ```4 * 2 = 8``` points.
- If we take all the ```5```, we get ```5 * 3 = 15``` points.

If we tried moving from smaller keys to larger ones in a greedy manner, our first decision would be to take all ```3``` or all ```4```. We can only choose one because picking one deletes the other one. Well, we get ```8``` points if we pick ```4``` and ```6``` points if we pick ```3```, so perhaps we should greedily pick ```4```. Unfortunately, this prevents us from picking ```5```, which gives us way more points.

Perhaps a different greedy strategy would work. How about sorting the keys by how many points they give, and then greedily trying to pick the most points? That way, we would take the ```15``` points here immediately. Well, what if we had an example ```nums = [5, 5, 5, 6, 6, 6, 6, 7, 7]```? We would have:

- ```5``` --> ```15``` points.
- ```6``` --> ```24``` points.
- ```7``` --> ```14``` points.

Again, this greedy strategy won't work. Those ```24``` points are tempting, but by taking them, we delete ```29``` points. In these small examples, it's easy to see what the correct decisions are. But for larger test cases, the question can get out of hand quickly. We need to ensure that we always make the correct decision.

This is where DP comes in. We can formulate DP algorithms in 3 easy steps:

1. First, we need some sort of memory that stores the answer to our question. Because we're doing top-down, we'll use a hash table for memory and a recursive function. Let's declare a function ```dp```. We want ```dp(num)``` to return the maximum points that we can gain if we only consider all the elements in nums with values between ```0``` and ```num```.

2. The second thing we need is a __recurrence relation__, a way to move between __states__. Let's say that we are currently at some arbitrary number ```x```, where ```x``` is in nums one or more times. How can we find ```dp(x)```? When it comes to ```x```, we have to make a choice: __to take__, or __not to take__.

    - If we take ```x```, then we gain points equal to ```x``` times the number of times ```x``` occurs in ```nums``` - we can __pre-compute__ these values. For now, let's call this value ```gain```. However, because of the deletion, by taking ```x```, we are no longer allowed to take ```x - 1```. The largest number that we can still consider is ```x - 2```. Therefore, if we choose to take ```x```, then the most points that we can have here is ```gain + dp(x - 2)```, where ```gain``` is how many points we gain from taking ```x``` and ```dp(x - 2)``` is the maximum number of points we can obtain from the numbers between ```x - 2``` and ```0```.

    - If we choose not to take ```x```, then we don't gain any points here, but we still may have accumulated some points from numbers smaller than ```x```. Because we didn't take ```x```, we did not close the door to ```x - 1```. In this case, the most points we can have here is ```dp(x - 1)```.
    
This forms our __recurrence relation__: for an arbitrary ```x```, ```dp(x) = max(dp(x - 1), dp(x - 2) + gain)```, where ```gain``` is the number of points we can gain from taking ```x```.

      The problem is, even though we figured out how to find dp(x), how do we find dp(x - 1) and dp(x - 2)? 
      That would involve finding dp(x - 3) and dp(x - 4) and so on.

3. The third component of a dynamic programming solution is __base cases__. Typically, we can find base cases with a little bit of logical thinking. First, ```dp(0)``` will always be equal to ```0```. Second, when considering ```dp(1)```, we only care about the elements ```0``` and ```1```. We do not care about ```2``` because of how we defined ```dp(x)```. Looking at the __recurrence relation__, we know that if we arrived at ```1```, it means that we must not have taken ```2```, and because ```1``` times any quantity will be greater than or equal to the number of points we can get from taking ```0```, we should always take ```1``` (if there are any).

With these base cases, we can find ```dp(2)```. With ```dp(2)``` calculated, we can find ```dp(3)```, all the way up to ```dp(max(nums))```. Remember, we defined ```dp(x)``` as the maximum points we can gain when we consider the numbers from ```0``` to ```x```, so ```dp(max(nums))``` covers the entire input, and stores the answer to the original problem.

      Because each call to dp will create 2 extra calls (the recurrence relation looks for dp(num - 1) and dp(num - 2)), 
      we would end up with an exponential amount of function calls. To avoid this, we will memoize our function. When we 
      find the answer for a certain number for the first time, we will store this answer. Then in the future, we can refer 
      to this value instead of repeating computation.

#### Top-Down Dynamic Programming (Recursion)

#### Algorithm

1. Declare a hash table ```points``` that will map elements to the number of points that we can gain from taking each element. Also, declare a hash map ```cache``` that we will use to memoize our recursive function.

2. Loop through ```nums``` once to populate points to find ```highest_point```, which is the largest element in ```nums```.

3. Initialize a function ```dp```, where ```dp(num)``` will return the maximum amount of points we can gain if we only consider numbers from ```0``` to ```num```.

4. In ```highest_point```, first check for the base cases. If ```num == 0```, return ```0```. If ```num == 1```, return ```points[1]```. Otherwise, check if num is already in ```cache```. If it is, just return ```cache[num]```.

5. Otherwise, apply the __recurrence relation__. Find the answer for num with ```max(dp(num - 1), dp(num - 2) + points[num])```. Store this answer in ```cache```, and then return it.

6. Return ```dp(highest_point)```.

__Time Complexity__: ```O(N + K)```, iterate through input array size N and recursive call up to highest point k

__Space Complexity__: ```O(N + K)```, hash table, cache, and recursive call stack

```Python
class Solution:
    def deleteAndEarn(self, nums: List[int]) -> int:
        # Top-Down DP (Recursion)
        points = collections.defaultdict(int)
        highest_point = 0

        # Precompute the number of points that can get from picking an element
        for num in nums:
            points[num] += num
            highest_point = max(highest_point, num)

        @cache
        def dp(num):
            # Base cases
            if num == 0:
                return 0
            if num == 1:
                return points[num]
            
            # Recurrence relation
            return max(dp(num-1), dp(num-2) + points[num])

        return dp(highest_point)
```

#### Bottom-Up Dynamic Programming (Tabulation)

__Time Complexity__: ```O(N + K)```, iterate through input array size N and highest point k

__Space Complexity__: ```O(N + K)```, hash table and cache

```Python
class Solution:
    def deleteAndEarn(self, nums: List[int]) -> int:
        # Bottom-Up DP (Tabulation)
        points = collections.defaultdict(int)
        highest_point = max(nums)
        for num in nums:
            points[num] += num
        
        memo = collections.defaultdict(int)
        memo[0], memo[1] = 0, points[1]

        for i in range(2, highest_point + 1):
            memo[i] = max(memo[i-1], memo[i-2] + points[i])
        
        return memo[highest_point]
```

#### Space Optimized Dynamic Programming (Iteration)

__Time Complexity__: ```O(N + K)```, iterate through input array size N and highest point k

__Space Complexity__: ```O(N)```, hash table

```Python
class Solution:
    def deleteAndEarn(self, nums: List[int]) -> int:
        # Bottom-Up DP
        points = collections.defaultdict(int)
        highest_point = max(nums)
        for num in nums:
            points[num] += num

        # Base cases
        case0, case1 = 0, points[1]
        
        # Iterate to the highest point
        for num in range(2, highest_point + 1):
            # Recurrence relation
            tmp = case1
            case1 = max(case1, case0 + points[num])
            case0 = tmp
        return case1
```

#### Bottom-Up Dynamic Programming (Iteration)

In the previous three approaches, we found the maximum element in nums, and iterated from ```0``` to ```highest_point```. The problem with this idea is that in some test cases, there could be large gaps between elements that we will waste time iterating over. In all three approaches, our time complexity was ```O(N+k)```, or ```O(nums.length+max(nums))```. This is very inefficient for a case such as ```nums = [1, 2, 3, 10000]```.

Instead of iterating over all numbers from ```0``` to ```max(nums)```, we can iterate over only the elements that appear in nums. Unfortunately, we will need to perform a ```sort``` to do this, but in cases like ```nums = [1, 2, 3, 10000]```, the algorithm will run much faster.

__Time Complexity__: ```O(NlogN)```, sort operations take NlogN time

__Space Complexity__: ```O(N)```, hash table

```Python
class Solution:
    def deleteAndEarn(self, nums: List[int]) -> int:
        # Bottom-Up DP
        points = collections.defaultdict(int)
        for num in nums:
            points[num] += num
        
        elements = sorted(points.keys())
        case0, case1 = 0, points[elements[0]]

        for i in range(1, len(elements)):
            curr = elements[i]
            # Check to ensure that elements are in the range [nums[i]-1, nums[i]+1]
            if curr == elements[i-1] + 1:
                tmp = case1
                case1 = max(case1, case0 + points[curr])
                case0 = tmp
            else:
                tmp = case1
                case1 = case1 + points[curr]
                case0 = tmp
        return case1
```
