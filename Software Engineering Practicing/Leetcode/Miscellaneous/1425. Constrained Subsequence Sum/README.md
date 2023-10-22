## [1425. Constrained Subsequence Sum](https://leetcode.com/problems/constrained-subsequence-sum)

```Tag```: ```Priority Queue``` ```Dynamic Programming``` ```Kadane's Algorithm``` ```Monotonic Queue```

#### Difficulty: Hard

Given an integer array ```nums``` and an integer ```k```, return _the maximum sum of a non-empty subsequence of that array such that for every two consecutive integers in the subsequence, ```nums[i]``` and ```nums[j]```, where ```i < j```, the condition ```j - i <= k``` is satisfied_.

A subsequence of an array is obtained by deleting some number of elements (can be zero) from the array, leaving the remaining elements in their original order.

---

__Example 1:__
```
Input: nums = [10,2,-10,5,20], k = 2
Output: 37
Explanation: The subsequence is [10, 2, 5, 20].
```

__Example 2:__
```
Input: nums = [-1,-2,-3], k = 1
Output: -1
Explanation: The subsequence must be non-empty, so we choose the largest number.
```

__Example 3:__
```
Input: nums = [10,-2,-10,-5,20], k = 2
Output: 23
Explanation: The subsequence is [10, -2, -5, 20].
```

__Constraints:__

- $1 \le k \le nums.length \le 10^5$
- $-10^4 \le nums[i] \le 10^4$

---

### Heap/Priority Queue

We need to maximize the sum of a subsequence. We can take as many integers as we want, but the primary constraint is that we cannot have a gap of ```k``` or more in our subsequence.

You may immediately notice that in an array of positive integers, we should always take the entire array. The tricky part comes in when we have negative integers. Of course, we would prefer to avoid negative integers since they will decrease our sum. However, it may be worth taking a negative integer as a sort of "bridge". Take a look at the following example:

![image](https://leetcode.com/problems/constrained-subsequence-sum/Figures/1425/1.png)

![image](https://leetcode.com/problems/constrained-subsequence-sum/Figures/1425/2.png)

Anytime we have a positive net gain, we should consider taking this element because it can contribute to a positive sum and potentially increase the sum of subsequent subsequences.

#### Alogirthm

1. Initialize a max heap ```h``` with ```(nums[0], 0)```. Also initialize the answer ```ans = nums[0]```.
2. Iterate ```i``` over the indices of ```nums```, starting from ```i = 1```:
  - While ```i``` minus the index (second element) at the top of heap ```h``` is greater than ```k```, pop from heap ```h```.
  - Set ```curr``` to the value (first element) at the top of heap, plus ```nums[i]```. Note that if the value at the top of heap is negative, we should take ```0``` instead.
  - Update ```ans``` with ```curr``` if it is larger.
  - Push ```(curr, i)``` to heap.
3. Return ```ans```.

> Implementation note: Python's ```heapq``` module only implements min heaps, so we will make the values in the heap negative to simulate a max heap.

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(n \cdot \log{}n)$
- __Space Complexity__:  $\mathcal{O}(n)$

```Python
class Solution:
    def constrainedSubsetSum(self, nums: List[int], k: int) -> int:
        # Initialize a priority queue with element and index at start of array
        h  = [(-nums[0], 0)]
        ans = nums[0]
        n = len(nums)
        
        for i in range(1, n):
            # Ensure element in the heap is not more than k away from current index
            while i - h[0][1] > k:
                heapq.heappop(h)
            
            curr = max(0, -h[0][0]) + nums[i]
            ans = max(ans, curr)
            heapq.heappush(h, (-curr, i))
        
        return ans
```

### ```sortedcontainers.SortedList``` or ```TreeMap``` Data Structure

```Python
from sortedcontainers import SortedList

class Solution:
    def constrainedSubsetSum(self, nums: List[int], k: int) -> int:
        window = SortedList([0])
        n = len(nums)
        dp = [0] * n

        for i in range(n):
            dp[i] = nums[i] + window[-1]
            window.add(dp[i])
            if i >= k:
                window.remove(dp[i - k])
        
        return max(dp)
```

### Monotonic Queue

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(n)$. We iterate over each index once. At each iteration, we have a while loop. This while loop runs in $\mathcal{O}(1)$ amortized. Each element in ```nums``` can only be pushed and popped from queue at most once. Thus, this while loop will not run more than ```n``` times across all ```n``` iterations. Everything else in each iteration runs in $\mathcal{O}(1)$. Thus, each iteration costs $\mathcal{O}(1)$ amortized.
- __Space Complexity__:  $\mathcal{O}(n)$

```Python
class Solution:
    def constrainedSubsetSum(self, nums: List[int], k: int) -> int:
        queue = collections.deque()
        n = len(nums)
        dp = [0] * n

        for i in range(n):
            # Ensure element in the queue is not more than k away from current index
            while queue and i - queue[0] > k:
                queue.popleft()
            
            dp[i] = (dp[queue[0]] if queue else 0) + nums[i]
            while queue and dp[queue[-1]] < dp[i]:
                queue.pop()
            
            if dp[i] > 0:
                queue.append(i)
        
        return max(dp)
```
