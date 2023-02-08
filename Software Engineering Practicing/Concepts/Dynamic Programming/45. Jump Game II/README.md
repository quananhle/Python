## 45. Jump Game II

```Tag```: ```Dynamic Programming``` ```Greedy Algorithm``` ```Backtracking```

#### Difficulty: Medium

You are given a __0-indexed__ array of integers ```nums``` of length ```n```. You are initially positioned at ```nums[0]```.

Each element ```nums[i]``` represents the maximum length of a forward jump from index ```i```. In other words, if you are at ```nums[i]```, you can jump to any ```nums[i + j]``` where:

- ```0 <= j <= nums[i]``` and
- ```i + j < n```

Return _the __minimum number__ of jumps to reach ```nums[n - 1]```_. The test cases are generated such that you can reach ```nums[n - 1]```.

![image](https://user-images.githubusercontent.com/35042430/217458978-65ad5247-2d73-4f55-823d-aa5a790887f0.png)

---

__Example 1__:
```
Input: nums = [2,3,1,1,4]
Output: 2
Explanation: The minimum number of jumps to reach the last index is 2. Jump 1 step from index 0 to 1, then 3 steps to the last index.
```

__Example 2:__
```
Input: nums = [2,3,0,1,4]
Output: 2
```

__Constraints:__

- 1 <= ```nums.length``` <= 10<sup>4</sup>
- ```0 <= nums[i] <= 1000```

---

### Greedy Algorithm

![image](https://leetcode.com/problems/jump-game-ii/solutions/3076867/Figures/45_re/3h.png)

![image](https://leetcode.com/problems/jump-game-ii/solutions/3076867/Figures/45_re/4.png)

![image](https://leetcode.com/problems/jump-game-ii/solutions/3076867/Figures/45_re/e.png)

```Python
class Solution:
    def jump(self, nums: List[int]) -> int:
        # Dynamic Programming and Greedy Algorithm
        ### To keep the jumps at minimum, must get maximum distance after each jump
        n = len(nums)

        curr_dist = next_dist = 0
        ans = 0

        for curr in range(n):
            # If jump, update the number of jumps and move to the starting range of the next jump
            if curr > curr_dist:
                ans += 1
                curr_dist = next_dist
            # Get the farthest distance reachable index from the current position
            next_dist = max(next_dist, curr + nums[curr])
                
        return ans
```

### Backtracking

The most intuitive way is to, at each index, check every index you can go to. Then, consider every index you can go to from there. At the end, the candidate with the least indices is our answer. We can make an optimization by discarding any candidates of length greater than what we've already found to be the best, but this algorithm is still exponential.

```Python
class Solution:
    def jump(self, nums: List[int]) -> int:
        # Backtracking
        self.ans = sys.maxsize

        def backtrack(jump, last):
            # Check every possible jump from current index
            for curr in range(last-1, -1, -1):
                if nums[curr] + curr >= last:
                    # Update the jump and the new position after the jump
                    backtrack(jump + 1, curr)
            # If need more jumps than necessary, backtrack
            if jump >= self.ans:
                return
            # If reached the end, get the number of jumps
            if last <= 0:
                self.ans = jump

        backtrack(0, len(nums)-1)
        return self.ans
```

### Top-Down Dynamic Programming

Clearly there is a lot of repeated work in the above algorithm. It calculates ```backtrack(candidate + i, i)``` for identical values of ```candidate``` and ```i``` repeatedly. By memoizing every result, we can bring the time complexity down to polynomial time, as the maximum number of iterations will be ```candidate``` (```O(M)```) times ```i``` (```O(N)```).

```Python
class Solution:
    def jump(self, nums: List[int]) -> int:
        # Backtracking
        self.ans = sys.maxsize
        memo = collections.defaultdict(tuple)

        def dp(jumps, last):
            if (jumps, last) in memo:
                return memo[(jumps, last)]
            if jumps >= self.ans:
                return
            if last <= 0:
                self.ans = jumps
            for curr in range(last-1, -1, -1):
                if nums[curr] + curr >= last:
                    dp(jumps + 1, curr)

            memo[(jumps, last)] = self.ans
            return memo[(jumps, last)]
        
        dp(0, len(nums)-1)

        return self.ans
```

### Bottom-Up Dynamic Programming

Let's make an observation about the top-down DP: we are memoizing values that do not need to be memoized. The key intuition here is that if we have a score for index_start and index_end, we need not recompute values in the middle. Why? Well, if we can get to a certain ending index, then we can necessarily get to every index before that too.

At each jump, jump to the index that gives us the farthest possible next jump. This works because even if the optimal next jump isn't the farthest, it will be contained in range(farthest). Optimal jump will always be at an index less than or equal to the farthest possible jump

    dp[i+1] = max_i(nums[j]+j for j in range(dp[i]+1))

```Python
class Solution:
    def jump(self, nums: List[int]) -> int:
        if len(nums) == 1:
            return 0
        # Start at index 0
        dp = [0]
        for curr in range(len(nums)):
            '''
            dp.append(max((nums[j] + j) for j in range(dp[curr]+1)))
            '''
            farthest = 0
            # Find the farthest jump from all indices which are within jump from the current index
            for next in range(dp[curr] + 1):
                farthest = max(farthest, nums[next] + next)
            dp.append(farthest)
            # Check if already jumped to the last index, break out of the loop
            if dp[curr + 1] >= len(nums) - 1:
                break
        # Return the total number of jumps exclude the start position
        return len(dp) - 1
```

### Greedy

Finally, we can get rid of trivial repeated work in order to optimize to linear time and constant space.

Why loop from 0 each time? Just loop from the last farthest index, which is the end of the last jump. And why store all values of dp? We only need two at a time.

```Python
class Solution:
    def jump(self, nums: List[int]) -> int:
        if len(nums) == 1:
            return 0
        last = farthest = 0
        count = 1
        for _ in range(len(nums)):
            tmp = farthest
            for next in range(last, farthest + 1):
                farthest = max(farthest, nums[next] + next)
            if farthest >= len(nums) - 1:
                break
            count += 1
            last = tmp
        return count
```
