## [1814. Count Nice Pairs in an Array](https://leetcode.com/problems/count-nice-pairs-in-an-array)

```Tag```: ```Array & String``` ```Hash Map``` ```Math```

#### Difficulty: Medium

You are given an array ```nums``` that consists of non-negative integers. Let us define ```rev(x)``` as the reverse of the non-negative integer ```x```. For example, ```rev(123) = 321```, and ```rev(120) = 21```. A pair of indices ```(i, j)``` is nice if it satisfies all of the following conditions:

- $0 <= i \lt j \lt nums.length$
- $nums[i] + rev(nums[j]) == nums[j] + rev(nums[i])$

Return _the number of nice pairs of indices_. Since that number can be too large, return it modulo $10^9 + 7$.

---

__Example 1:__
```
Input: nums = [42,11,1,97]
Output: 2
Explanation: The two pairs are:
 - (0,3) : 42 + rev(97) = 42 + 79 = 121, 97 + rev(42) = 97 + 24 = 121.
 - (1,2) : 11 + rev(1) = 11 + 1 = 12, 1 + rev(11) = 1 + 11 = 12.
```

__Example 2:__
```
Input: nums = [13,10,35,24,76]
Output: 4
```

__Constraints:__

- $1 \le nums.length \le 10^5$
- $0 \le nums[i] \le 10^9$

---

### Brute Force (Time Limit Exceeded)

```Python
class Solution:
    def countNicePairs(self, nums: List[int]) -> int:
        MOD = 10**9 + 7

        def reverse(num):
            reversed_num = 0
            while num > 0:
                reversed_num = reversed_num * 10 + num % 10
                num //= 10
            return reversed_num

        ans = 0
        n = len(nums)
        for i in range(n - 1):
            for j in range(i + 1, n):
                if nums[i] + reverse(nums[j]) == nums[j] + reverse(nums[i]):
                    ans += 1
                    ans %= MOD

        return ans % MOD
```

```Python
class Solution:
    def countNicePairs(self, nums: List[int]) -> int:
        MOD = 10**9 + 7

        def reverse(num):
            reversed_num = 0
            while num > 0:
                reversed_num = reversed_num * 10 + num % 10
                num //= 10
            return reversed_num

        ans = 0
        n = len(nums)
        memo = collections.defaultdict(int)

        for i in range(n - 1):
            for j in range(i + 1, n):
                if (nums[i], nums[j]) in memo:                
                    if memo[(nums[i], nums[j])] == 1:
                        ans += 1
                        ans %= MOD
                    continue
                memo[(nums[i], nums[j])] = 0

                if nums[i] + reverse(nums[j]) == nums[j] + reverse(nums[i]):
                    memo[(nums[i], nums[j])] = 1
                    ans += 1
                    ans %= MOD

        return ans % MOD
```

### Math

#### Intuition

![image](https://github.com/quananhle/Python/assets/35042430/1c56d696-8717-4864-8648-72cdbc82338b)

![image](https://leetcode.com/problems/count-nice-pairs-in-an-array/Figures/1814/1.png)

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N)$
- __Space Complexity__: $\mathcal{O}(N)$

```Python
class Solution:
    def countNicePairs(self, nums: List[int]) -> int:
        MOD = 10**9 + 7

        def reverse(num):
            reversed_num = 0
            while num > 0:
                reversed_num = reversed_num * 10 + num % 10
                num //= 10
            return reversed_num

        arr = list()
        n = len(nums)
        for i in range(n):
            arr.append(nums[i] - reverse(nums[i]))

        ans = 0
        memo = collections.defaultdict(int)

        for num in arr:
            ans = (ans + memo[num]) % MOD
            memo[num] += 1

        return ans % MOD
```