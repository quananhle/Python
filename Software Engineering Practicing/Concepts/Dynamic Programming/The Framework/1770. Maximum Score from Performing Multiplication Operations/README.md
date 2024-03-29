## 1770. Maximum Score from Performing Multiplication Operations

```Tag```: ```Dynamic Programming``` ```Recursion```

#### Difficulty: Hard

You are given two __0-indexed__ integer arrays ```nums``` and ```multipliers``` of size ```n``` and ```m``` respectively, where ```n >= m```.

You begin with a score of ```0```. You want to perform exactly ```m``` operations. On the i<sup>th</sup> operation (__0-indexed__) you will:

- Choose one integer ```x``` from either the start or the end of the array ```nums```.

- Add ```multipliers[i] * x``` to your score.

    - Note that ```multipliers[0]``` corresponds to the first operation, ```multipliers[1]``` to the second operation, and so on.
    
- Remove ```x``` from ```nums```.

Return _the __maximum__ score after performing ```m``` operations_.

![image](https://user-images.githubusercontent.com/35042430/218869595-12357163-00cc-4238-b252-37c27ebc3009.png)

---

__Example 1:__
```
Input: nums = [1,2,3], multipliers = [3,2,1]
Output: 14
Explanation: An optimal solution is as follows:
- Choose from the end, [1,2,3], adding 3 * 3 = 9 to the score.
- Choose from the end, [1,2], adding 2 * 2 = 4 to the score.
- Choose from the end, [1], adding 1 * 1 = 1 to the score.
The total score is 9 + 4 + 1 = 14.
```

__Example 2:__
```
Input: nums = [-5,-3,-3,-2,7,1], multipliers = [-10,-5,3,4,6]
Output: 102
Explanation: An optimal solution is as follows:
- Choose from the start, [-5,-3,-3,-2,7,1], adding -5 * -10 = 50 to the score.
- Choose from the start, [-3,-3,-2,7,1], adding -3 * -5 = 15 to the score.
- Choose from the start, [-3,-2,7,1], adding -3 * 3 = -9 to the score.
- Choose from the end, [-2,7,1], adding 1 * 4 = 4 to the score.
- Choose from the end, [-2,7], adding 7 * 6 = 42 to the score. 
The total score is 50 + 15 - 9 + 4 + 42 = 102.
```

__Constraints:__

- ```n == nums.length```
- ```m == multipliers.length```
- ```1 <= m <= 300```
- ```m <= n <= 10^5```
- ```-1000 <= nums[i], multipliers[i] <= 1000```

---

### The Framework

#### Top-Down DP (Recursion)

![image](https://leetcode.com/problems/maximum-score-from-performing-multiplication-operations/solutions/2414564/Documents/1770/1770_Recursion_Tree.svg)

```Python
class Solution:
    def maximumScore(self, nums: List[int], multipliers: List[int]) -> int:
        # Top-Down DP (Recursion)
        n, m = len(nums), len(multipliers)

        memo = collections.defaultdict(int)

        def dp(left, curr):
            # Base cases
            if curr == m:
                return 0
            
            if (left, curr) in memo:
                return memo[(left, curr)]
            
            right = n - 1 - (curr - left)
            current_multiplier = multipliers[curr]

            # Recurrence relation
            memo[(left, curr)] = max(nums[left] * current_multiplier + dp(left + 1, curr + 1), \
                                  nums[right] * current_multiplier + dp(left, curr + 1))
                
            return memo[(left, curr)]

        return dp(0, 0)
```

#### Top-Down DP (Recursion) with Built-in LRU Cache

```Python
class Solution:
    def maximumScore(self, nums: List[int], multipliers: List[int]) -> int:
        # Top-Down DP (Recursion)
        n, m = len(nums), len(multipliers)

        '''
        @lru_cache(2000)
        def dp(curr, left, right):
            # Base case:
            if curr == m:
                return 0

            current_multiplier = multipliers[curr]    
            # Recurrence relation
            return max(nums[left] * current_multiplier + dp(curr + 1, left + 1, right), \
                      nums[right] * current_multiplier + dp(curr + 1, left, right - 1))

        return dp(0, 0, n - 1)
        '''
        
        @lru_cache(2000)
        def dp(curr, left):
            # Base case:
            if curr == m:
                return 0

            # Get the right pointer from the left and current index pointers
            right = n - 1 - (curr - left)

            current_multiplier = multipliers[curr]    
            # Recurrence relation
            return max(nums[left] * current_multiplier + dp(curr + 1, left + 1), \
                      nums[right] * current_multiplier + dp(curr + 1, left))

        return dp(0,0)
```

#### Bottom-Up Dynamic Programming (Tabulation)

![image](https://leetcode.com/problems/maximum-score-from-performing-multiplication-operations/solutions/2414564/Documents/1770/1770_Lower_Half_Triangle.svg)

```Python
class Solution:
    def maximumScore(self, nums: List[int], multipliers: List[int]) -> int:
        # Bottom-Up DP (Tabulation)
        n, m = len(nums), len(multipliers)
        # Add one extra space to avoid out of bound at the first iteration of the outer loop
        dp = [[0] * (m + 1) for _ in range(m + 1)]

        # Iterate backward from m since the base case happens when curr equals m
        for curr in range(m - 1, -1, -1):
            for left in range(curr, -1, -1):
                right = n - 1 - (curr - left)
                current_multiplier = multipliers[curr]

                # Recurrence relation
                dp[curr][left] = max(nums[left] * current_multiplier + dp[curr + 1][left + 1], \
                                    nums[right] * current_multiplier + dp[curr + 1][left])

        return dp[0][0]
```

#### Space Optimized Bottom-Up DP (Iteration)

![image](https://user-images.githubusercontent.com/35042430/218959085-75ceb22e-e802-41ab-a9f8-08bc29738110.png)

```Python
class Solution:
    def maximumScore(self, nums: List[int], multipliers: List[int]) -> int:
        # Space Optimized Bottom-Up DP (Iteration)
        dp = collections.defaultdict(int)
        n, m = len(nums), len(multipliers)

        for curr in range(m - 1, -1, -1):
            for left in range(curr + 1):
                right = n - 1 - (curr - left)
                current_multiplier = multipliers[curr]

                dp[left] = max(nums[left] * current_multiplier + dp[left + 1], \
                              nums[right] * current_multiplier + dp[left])
        
        return dp[0]
```
