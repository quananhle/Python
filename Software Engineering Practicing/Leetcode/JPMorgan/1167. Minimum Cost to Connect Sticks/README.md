## [1167. Minimum Cost to Connect Sticks](https://leetcode.com/problems/minimum-cost-to-connect-sticks)

```Tag```: ```Heap``` ```Greedy Algorithm```

You have some number of sticks with positive integer lengths. These lengths are given as an array ```sticks```, where ```sticks[i]``` is the length of the i<sup>th</sup> stick.

You can connect any two sticks of lengths ```x``` and ```y``` into one stick by paying a cost of ```x + y```. You must connect all the sticks until there is only one stick remaining.

Return _the minimum cost of connecting all the given sticks into one stick in this way_.

![image](https://github.com/quananhle/Python/assets/35042430/5a2ca7c4-552e-4cf9-9af2-8d603f2b72cd)

---

__Example 1:__
```
Input: sticks = [2,4,3]
Output: 14
Explanation: You start with sticks = [2,4,3].
1. Combine sticks 2 and 3 for a cost of 2 + 3 = 5. Now you have sticks = [5,4].
2. Combine sticks 5 and 4 for a cost of 5 + 4 = 9. Now you have sticks = [9].
There is only one stick left, so you are done. The total cost is 5 + 9 = 14.
```

__Example 2:__
```
Input: sticks = [1,8,3,5]
Output: 30
Explanation: You start with sticks = [1,8,3,5].
1. Combine sticks 1 and 3 for a cost of 1 + 3 = 4. Now you have sticks = [4,8,5].
2. Combine sticks 4 and 5 for a cost of 4 + 5 = 9. Now you have sticks = [9,8].
3. Combine sticks 9 and 8 for a cost of 9 + 8 = 17. Now you have sticks = [17].
There is only one stick left, so you are done. The total cost is 4 + 9 + 17 = 30.
```

__Example 3:__
```
Input: sticks = [5]
Output: 0
Explanation: There is only one stick, so you don't need to do anything. The total cost is 0.
```

__Constraints:__

- $1 \le sticks.length \le 10^4$
- $1 \le sticks[i] \le 10^4$


---

### Greedy

```Python

```

### Heap

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N\log{N})$
- __Space Complexity__: $\mathcal{O}(N)$

```Python
class Solution:
    def connectSticks(self, sticks: List[int]) -> int:
        # Heap
        #### Time Complexity: O(NlogN), traverse through the size N of input array take O(N), add and remove heap node take O(logN) time
        #### Space Complexity: O(N), extra space required to build a priority queue of N nodes

        min_cost = 0
        heapq.heapify(sticks)
        while len(sticks) > 1:
            num1 = heapq.heappop(sticks)
            num2 = heapq.heappop(sticks)
            cost = num1 + num2
            heapq.heappush(sticks, cost)
            min_cost += cost
        return min_cost
```

```Python
class Solution:
    def connectSticks(self, sticks: List[int]) -> int:
        ans = 0
        n = len(sticks)
        heapq.heapify(sticks)

        if n == 1:
            return 0

        while sticks:
            stick_1 = heapq.heappop(sticks)
            stick_2 = heapq.heappop(sticks)
            cost = stick_1 + stick_2
            heapq.heappush(sticks, cost)
            ans += cost
            if len(sticks) == 1:
                break

        return ans
```
