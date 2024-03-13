## [2485. Find the Pivot Integer](https://leetcode.com/problems/find-the-pivot-integer)

```Tag```: ```Prefix Sum``` ```Dynamic Programming``` ```Binary Search```

#### Difficulty: Easy

Given a positive integer ```n```, find the __pivot integer__ ```x``` such that:

- The sum of all elements between ```1``` and ```x``` inclusively equals the sum of all elements between ```x``` and ```n``` inclusively.

Return _the __pivot integer__ ```x```_. If no such integer exists, return ```-1```. It is guaranteed that there will be at most one pivot index for the given input.

![image](https://github.com/quananhle/Python/assets/35042430/86e8d8a7-7e47-4f2b-bb9f-74d70f9fe355)

---

__Example 1:__
```
Input: n = 8
Output: 6
Explanation: 6 is the pivot integer since: 1 + 2 + 3 + 4 + 5 + 6 = 6 + 7 + 8 = 21.
```

__Example 2:__
```
Input: n = 1
Output: 1
Explanation: 1 is the pivot integer since: 1 = 1.
```

__Example 3:__
```
Input: n = 4
Output: -1
Explanation: It can be proved that no such integer exist.
```

__Constraints:__

- $1 \le n \le 1000$

---

### Prefix Sum

```Python
class Solution:
    def pivotInteger(self, n: int) -> int:
        total = 0
        prefix_sum = list()
        for num in range(n + 1):
            total += num
            prefix_sum.append(total)
        return (max(set([idx if num * 2 == total + idx else -1 for idx, num in enumerate(prefix_sum)])))
```

```Python
class Solution:
    def pivotInteger(self, n: int) -> int:
        '''
        left_sum = right_sum
        left_sum + right_sum = total_sum + pivot
        '''
        total = 0
        for num in range(1, n+1):
            total += num
        left_sum = 0

        for num in range(1, n+1):
            left_sum += num
            if left_sum * 2 - num == total:
                return num
        return -1
```

```Python
class Solution:
    def pivotInteger(self, n: int) -> int:
        total = 0
        prefix = list()
        for num in range(n + 1):
            total += num
            prefix.append(total)
        
        for idx, num in enumerate(prefix):
            if num * 2 - idx == prefix[-1]:
                return idx
        return -1
```

```Python
class Solution:
    def pivotInteger(self, n: int) -> int:
        nums = [num for num in range(1, n + 1)]
        memo = [sum(nums[:i]) for i in range(len(nums) + 1)]
        for idx, num in enumerate(memo):
            if num * 2 - idx == memo[-1]:
                return idx
        return -1  
```

#### Precomputed Prefix Sum

```Python
class PrefixSum:                                                                    # O(n)
    def __init__(self, n: int) -> None:
        self.memo = collections.defaultdict(int)
        left_sum = 0
        total = sum([i for i in range(1, n + 1)])
        for pivot in range(1, n + 1):
            left_sum += pivot
            self.memo[(pivot, 'left')] = left_sum
            self.memo[(pivot, 'right')] = total - left_sum + pivot

    def find(self, pair: tuple) -> int:
        return self.memo[pair]

class Solution:
    def pivotInteger(self, n: int) -> int:
        # Precomputed the running sums of all pivot index
        prefix_sum = PrefixSum(n)
        
        lo, hi = 1, n

        while lo <= hi:                                                                # O(log n)
            mi = hi - (hi - lo) // 2
            if prefix_sum.find((mi, 'left')) == prefix_sum.find((mi, 'right')):        # O(1)
                return mi
            elif prefix_sum.find((mi, 'left')) < prefix_sum.find((mi, 'right')):       # O(1)
                lo = mi + 1
            else:
                hi = mi - 1
            
        return -1
```

### Binary Search

```Python
class Solution:
    def pivotInteger(self, n: int) -> int:
        lo, hi = 1, n

        while lo <= hi:
            mi = hi - (hi - lo) // 2
            if sum([i for i in range(mi + 1)]) == sum([i for i in range(mi, n + 1)]):
                return mi
            elif sum([i for i in range(mi + 1)]) < sum([i for i in range(mi, n + 1)]):
                lo = mi + 1
            else:
                hi = mi - 1
            
        return -1
```

