## [907. Sum of Subarray Minimums](https://leetcode.com/problems/sum-of-subarray-minimums)

```Tag```: ```Monotonic Stack``` ```Dynamic Programming```

#### Difficulty: Medium

Given an array of integers ```arr```, find the sum of ```min(b)```, where ```b``` ranges over every (contiguous) subarray of ```arr```. Since the answer may be large, return the answer modulo $10^9 + 7$.

![image](https://github.com/quananhle/Python/assets/35042430/b34d62f7-5d0d-424f-b65d-f758c3b212a0)

---

__Example 1:__
```
Input: arr = [3,1,2,4]
Output: 17
Explanation: 
Subarrays are [3], [1], [2], [4], [3,1], [1,2], [2,4], [3,1,2], [1,2,4], [3,1,2,4]. 
Minimums are 3, 1, 2, 4, 1, 1, 2, 1, 1, 1.
Sum is 17.
```

__Example 2:__
```
Input: arr = [11,81,94,43,3]
Output: 444
```

__Constraints:__

- $1 \le arr.length \le 3 * 10^4$
- $1 \le arr[i] \le 3 * 10^4$

---

You can think of the problem as a three-step process:

1. Consider all subarrays of the given array.
2. For each of the subarrays, calculate the minimum.
3. Add all the minimums calculated above.

Brute Force

```Python
        ans = 0
        n = len(arr)
        MOD = 10 ** 9 + 7

        for i in range(n):
            curr_min = math.inf
            running_sum = 0
            for curr in range(i, n):
                curr_min = min(curr_min, arr[curr])
                running_sum += curr_min
            ans += running_sum
        return ans % MOD
```

### Monotonic Stack

```Python
class Solution:
    def sumSubarrayMins(self, arr: List[int]) -> int:
        ans = 0
        n = len(arr)
        monotonic_stack = list()
        MOD = 10 ** 9 + 7

        for i in range(n + 1):
            while monotonic_stack and (i == n or arr[i] <= arr[monotonic_stack[-1]]):
                pivot = monotonic_stack.pop()
                left_boundary = -1 if not monotonic_stack else monotonic_stack[-1]
                right_boundary = i

                count = (pivot - left_boundary) * (right_boundary - pivot)
                ans += (count * arr[pivot])
            monotonic_stack.append(i)

        return ans % MOD
```