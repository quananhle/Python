## [2141. Maximum Running Time of N Computers](https://leetcode.com/problems/maximum-running-time-of-n-computers/)

```Tag```: ```Binary Search``` ```Greedy``` ```Prefix Sum```

#### Difficulty: Hard

You have ```n``` computers. You are given the integer ```n``` and a 0-indexed integer array ```batteries``` where the i<sup>th</sup> battery can run a computer for ```batteries[i]``` minutes. You are interested in running all ```n``` computers simultaneously using the given batteries.

Initially, you can insert at most one battery into each computer. After that and at any integer time moment, you can remove a battery from a computer and insert another battery any number of times. The inserted battery can be a totally new battery or a battery from another computer. You may assume that the removing and inserting processes take no time.

Note that the batteries cannot be recharged.

Return _the maximum number of minutes you can run all the ```n``` computers simultaneously_.

![image](https://github.com/quananhle/Python/assets/35042430/bcc51552-39c4-4f50-8237-4017670837fa)

![image](https://github.com/quananhle/Python/assets/35042430/5ed1a48f-bd35-4098-9aea-72101422587f)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2022/01/06/example1-fit.png)
```
Input: n = 2, batteries = [3,3,3]
Output: 4
Explanation: 
Initially, insert battery 0 into the first computer and battery 1 into the second computer.
After two minutes, remove battery 1 from the second computer and insert battery 2 instead. Note that battery 1 can still run for one minute.
At the end of the third minute, battery 0 is drained, and you need to remove it from the first computer and insert battery 1 instead.
By the end of the fourth minute, battery 1 is also drained, and the first computer is no longer running.
We can run the two computers simultaneously for at most 4 minutes, so we return 4.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2022/01/06/example2.png)

```
Input: n = 2, batteries = [1,1,1,1]
Output: 2
Explanation: 
Initially, insert battery 0 into the first computer and battery 2 into the second computer. 
After one minute, battery 0 and battery 2 are drained so you need to remove them and insert battery 1 into the first computer and battery 3 into the second computer. 
After another minute, battery 1 and battery 3 are also drained so the first and second computers are no longer running.
We can run the two computers simultaneously for at most 2 minutes, so we return 2.
```

__Constraints:__

- $1 \le n <= batteries.length \le 10^{5}$
- $1 <= batteries[i] <= 10^{9}$

---

### Greedy & Prefix Sum

![image](https://leetcode.com/problems/maximum-running-time-of-n-computers/Figures/2141/n5.png)

Let's say ```live``` is sorted. We try using some of our extra power to increase ```live[0]``` running time to ```live[1]```. In the process, ```extra -= live[1] - live[0]```

![image](https://leetcode.com/problems/maximum-running-time-of-n-computers/Figures/2141/n6.png)

Now, ```live[0] = live[1]```. Can we continue? We try increasing the running time to ```live[2]```. However, not only would we need to increase ```live[1]``` to ```live[2]```, we also need to increase ```live[0]``` to ```live[2]``` so it doesn't bottleneck the running time. We already spent some power to increase ```live[0]``` to ```live[1]```, so we just need to spend twice as much power as the difference ```live[2] - live[1]```.

![image](https://leetcode.com/problems/maximum-running-time-of-n-computers/Figures/2141/n70.png)

Now we have ```live[0] = live[1] = live[2]```. If we want to increase the running time to ```live[3]```, we need to spend three times as much power as the difference ```(live[3] - live[2])```.

![image](https://leetcode.com/problems/maximum-running-time-of-n-computers/Figures/2141/n71.png)

Oops, seems we are running out of ```extra``` power before reaching ```live[3]```, so the bottleneck is decided by ```live[2]```. We have some extra power remaining, so we do our best to increase the running time by evenly splitting the remaining power to the computers (```extra / 3```).

What if we have an example where extra is large enough to support all batteries in live becoming equal to ```live[n - 1]```. Any remaining power in extra should similarly be evenly split across all the computers to increase the final running time. The final running time is determined by ```live[n - 1]``` plus the extra running time we can make using extra power, which is ```extra / n```.

![image](https://leetcode.com/problems/maximum-running-time-of-n-computers/Figures/2141/n8.png)

If a battery ```batteries[i]``` has more power than the total running time, there is no way we can use its excess power to further increase the running time. Therefore, once we have picked the largest ```n``` batteries and assign them to ```n``` computers, these batteries are tied to their computer and swapping them does not bring any longer running time.

__Algorithm__

1. Sort ```batteries```.
2. Find the largest ```n``` batteries and assign them to ```n``` computers, these ```n``` batteries are exclusively used by each computer and cannot be shared with other computers. Create an array ```live``` that contains the largest ```n``` batteries in sorted order, which represents the ```n``` computers.
3. Sum up the power of the remaining batteries as ```extra```.
4. Iterate over ```live``` from ```0``` to ```n - 2```, for each index ```i```:
    - If ```extra``` power can increase the running time of the first ```i``` computers from ```live[i]``` to ```live[i + 1]```, then we subtract the required power from ```extra``` and move on to the next index.
    - Otherwise, we have to stop at this point and return ```live[i] + extra / (i + 1)```.
5. If there is still power left after the iteration, it means we can further increase the total running time of ```n``` computers from ```live[n - 1]``` by ```extra / n```. Therefore, return ```live[n - 1] + extra / n```.

```Python
class Solution:
    def maxRunTime(self, n: int, batteries: List[int]) -> int:
        batteries.sort()
        extra = sum(batteries[:-n])

        live = batteries[-n:]

        for i in range(n - 1):
            if extra // (i + 1) < live[i + 1] - live[i]:
                return live[i] + extra // (i + 1)
            
            extra -= (i + 1) * (live[i + 1] - live[i])

        return live[-1] + extra // n
```

### Binary Search

Alternatively, we can first set a target running time, ```target```, then try to reach this running time using all batteries.

![image](https://leetcode.com/problems/maximum-running-time-of-n-computers/Figures/2141/b1.png)

Here we still take advantage of the conclusion we reached at the end of the previous approach (Please refer to the previous approach):

    - If the power of a battery is smaller than ```target```, we can use all of its power.
    - If the power of a battery is larger than ```target```, we can only use ```target``` power from it.

![image](https://leetcode.com/problems/maximum-running-time-of-n-computers/Figures/2141/b2.png)

Instead of trying every ```target``` from ```1``` until finding the largest possible running time, we can take advantage of binary search to locate the largest ```target``` faster than linear search.

![image](https://leetcode.com/problems/maximum-running-time-of-n-computers/Figures/2141/b3.png)

```Python
class Solution:
    def maxRunTime(self, n: int, batteries: List[int]) -> int:
        left, right = 1, sum(batteries) // n
        
        while left < right:
            target = right - (right - left) // 2
            
            extra = 0
            for power in batteries:
                extra += min(power, target)
            
            if extra // n >= target:
                left = target
            else:
                right = target - 1
        
        return left
```
