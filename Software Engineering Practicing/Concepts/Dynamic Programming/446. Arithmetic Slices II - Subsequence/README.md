## [446. Arithmetic Slices II - Subsequence](https://leetcode.com/problems/arithmetic-slices-ii-subsequence)

```Tag```: ```Dynamic Programming``` ```Backtracking```

#### Difficulty: Hard

Given an integer array ```nums```, return _the number of all the __arithmetic subsequences__ of ```nums```_.

A sequence of numbers is called arithmetic if it consists of __at least three elements__ and if the difference between any two consecutive elements is the same.

- For example, ```[1, 3, 5, 7, 9]```, ```[7, 7, 7, 7]```, and ```[3, -1, -5, -9]``` are arithmetic sequences.
- For example, ```[1, 1, 2, 5, 7]``` is not an arithmetic sequence.

A subsequence of an array is a sequence that can be formed by removing some elements (possibly none) of the array.

- For example, ```[2,5,10]``` is a subsequence of ```[1,2,1,2,4,1,5,10]```.

The test cases are generated so that the answer fits in __32-bit__ integer.

![image](https://github.com/quananhle/Python/assets/35042430/5fa51195-59d3-45ba-83e8-d8fb3256470e)

---

__Example 1:__
```
Input: nums = [2,4,6,8,10]
Output: 7
Explanation: All arithmetic subsequence slices are:
[2,4,6]
[4,6,8]
[6,8,10]
[2,4,6,8]
[4,6,8,10]
[2,4,6,8,10]
[2,6,10]
```

__Example 2:__
```
Input: nums = [7,7,7,7,7]
Output: 16
Explanation: Any subsequence of this array is arithmetic.
```

__Constraints:__

- $1 \le nums.length \le 1000$
- $-2^{31} \le nums[i] \le 2^{31} - 1$

---

### Build All Arithmetic Subsequences

#### Backtracking (Time Limit Exceeded)

```Python
class Solution:
    def numberOfArithmeticSlices(self, nums: List[int]) -> int:
        n = len(nums)
        res = list()

        def backtrack(curr, combination):
            # Base case
            if len(combination) >= 3:
                res.append(combination[:])
            
            for next in range(curr, n):
                if len(combination) < 2:
                    combination.append(nums[next])
                    backtrack(next + 1, combination)
                    combination.pop()
                else:
                    diff = combination[1] - combination[0]
                    if nums[next] - combination[-1] == diff:
                        combination.append(nums[next])
                        backtrack(next + 1, combination)
                        combination.pop()
            
        backtrack(0, [])
        return len(res)
```

```Python
class Solution:
    def numberOfArithmeticSlices(self, nums: List[int]) -> int:
        n = len(nums)
        res = list()
        ans = 0

        def dfs(curr, combination):
            nonlocal ans
            # Base case
            if curr == n:
                if len(combination) < 3:
                    return
                
                diff = combination[1] - combination[0]
                for next in range(1, len(combination)):
                    if combination[next] - combination[next - 1] != diff:
                        return
                
                res.append(combination[:])
                ans += 1
                return

            dfs(curr + 1, combination)
            combination.append(nums[curr])
            dfs(curr + 1, combination)
            combination.pop()
        
        dfs(0, [])
        return ans
```

### Dynamic Programming

```Python
class Solution:
    def numberOfArithmeticSlices(self, nums: List[int]) -> int:
        n = len(nums)
        ans = 0
        counter = [collections.defaultdict(int) for _ in range(n)]

        for i in range(1, n):
            for j in range(i):
                diff = nums[i] - nums[j]
                cnt = 0

                if diff in counter[j]:
                    cnt = counter[j][diff]
                
                counter[i][diff] += cnt + 1
                ans += cnt
            
        return ans
```
