## 300. Longest Increasing Subsequence

```Tag```: ```Dynamic Programming``` ```Binary Search```

#### Difficulty: Medium

Given an integer array ```nums```, return _the length of the longest __strictly increasing subsequence___.

![image](https://user-images.githubusercontent.com/35042430/216241611-86eed9b4-d633-4e73-84b8-4801e08500e4.png)

--- 

__Example 1:__
```
Input: nums = [10,9,2,5,3,7,101,18]
Output: 4
Explanation: The longest increasing subsequence is [2,3,7,101], therefore the length is 4.
```

__Example 2:__
```
Input: nums = [0,1,0,3,2,3]
Output: 4
```

__Example 3:__
```
Input: nums = [7,7,7,7,7,7,7]
Output: 1
```

__Constraints:__

- ```1 <= nums.length <= 2500```
- -10<sup>4</sup> <= ```nums[i]``` <= 10<sup>4</sup>

---

### Dynamic Programming

#### Realizing a Dynamic Programming Problem

This problem has two important attributes that let us know it should be solved by dynamic programming:

1. The question is asking for the __maximum__ or __minimum__ of something
2. We have to make decisions that may depend on previously made decisions, which is very typical of a problem involving subsequences.

As we go through the input, each "decision" we must make is simple: is it worth it to consider this number? If we use a number, it may contribute towards an increasing subsequence, but it may also eliminate larger elements that came before it. For example, let's say we have ```nums = [5, 6, 7, 8, 1, 2, 3]```. It isn't worth using the 1, 2, or 3, since using any of them would eliminate 5, 6, 7, and 8, which form the longest increasing subsequence. We can use dynamic programming to determine whether an element is worth using or not.

#### A Framework to Solve Dynamic Programming Problems

Typically, dynamic programming problems can be solved with three main components. If you're new to dynamic programming, this might be hard to understand but is extremely valuable to learn since __most dynamic programming problems can be solved this way__.

First, we need some function or array that represents the answer to the problem from a given state. For many solutions on LeetCode, you will see this function/array named __"dp"__. For this problem, let's say that we have an array ```dp```. As just stated, this array needs to represent the answer to the problem for a given state, so let's say that ```dp[i]``` represents the length of the longest increasing subsequence that __ends with the i<sup>th</sup> element__. The "state" is one-dimensional since it can be represented with only one variable - the index ```i```.

Second, we need a way to transition between states, such as ```dp[5]``` and ```dp[7]```. This is called a __recurrence relation__ and can sometimes be tricky to figure out. Let's say we know ```dp[0]```, ```dp[1]```, and ```dp[2]```. How can we find ```dp[3]``` given this information? Well, since ```dp[2]``` represents the length of the longest increasing subsequence that ends with ```nums[2]```, if ```nums[3] > nums[2]```, then we can simply take the subsequence ending at ```i = 2``` and append ```nums[3]``` to it, increasing the length by ```1```. The same can be said for ```nums[0]``` and ```nums[1]``` if ```nums[3]``` is larger. Of course, we should try to maximize ```dp[3]```, so we need to check all 3. Formally, the recurrence relation is: ```dp[i] = max(dp[j] + 1)``` for all ```j``` where ```nums[j] < nums[i]``` and ```j < i```.

The third component is the simplest: we need a base case. For this problem, we can initialize every element of dp to 1, since every element on its own is technically an increasing subsequence.

### The Framework

#### Top-Down Dynamic Programming (Recursion)

```Python
class Solution:
    def lengthOfLIS(self, nums: List[int]) -> int:
        # Top-Down DP (Recursion)
        n = len(nums)
        memo = [-1] * (n + 1)

        def dp(prev, curr):
            # Base case
            if curr == len(nums):
                return 0
            if memo[prev + 1] != -1:
                return memo[prev + 1]
            
            # Recurrence relation
            to_take_next_element = 0

            if prev == -1 or nums[prev] < nums[curr]:
                to_take_next_element = 1 + dp(curr, curr + 1)
            
            not_to_take_next_element = dp(prev, curr + 1)

            memo[prev + 1] = max(to_take_next_element, not_to_take_next_element)

            return memo[prev + 1]

        return dp(-1, 0)
```

#### Bottom-Up Dynamic Programming (Tabulation)

```Python

```

#### Optimized Space Bottom-Up Dynamic Programming (1D Array)

#### Algorithm

1. Initialize an array ```dp``` with length ```nums.length``` and all elements equal to 1. ```dp[i]``` represents the length of the longest increasing subsequence that ends with the element at index ```i```.

2. Iterate from ```i = 1``` to ```i = nums.length - 1```. At each iteration, use a second for loop to iterate from ```j = 0``` to ```j = i - 1``` (all the elements before ```i```). For each element before ```i```, check if that element is smaller than ```nums[i]```. If so, set ```dp[i] = max(dp[i], dp[j] + 1)```.

3. Return the ```max``` value from ```dp```.

__Time Complexity__: ```O(N^2)```, nested loop through the entire input array in the worst case

__Space Complexity__: ```O(N)```, subarray can be as large in size as the input array if every element in input array is strictly increasing

```Python
class Solution:
    def lengthOfLIS(self, nums: List[int]) -> int:
        # Dynamic Programming
        n = len(nums)
        dp = [1] * n
        for i in range(1, len(nums)):
            for j in range(i):
                if nums[i] > nums[j]:
                    dp[i] = max(dp[i], dp[j] + 1)
        return max(dp)
```

---

### Build Longest Increasing Subsequence

It appears the best way to build an increasing subsequence is: for each element ```num```, if ```num``` is greater than the largest element in our ```subsequence```, then add it to the ```subsequence```. Otherwise, perform a linear scan through the ```subsequence``` starting from the smallest element and replace the __first element that is greater than or equal to__ ```num``` with ```num```. This opens the door for elements that are greater than ```num``` but less than the element replaced to be included in the sequence.

One thing to add: this algorithm __does not__ always generate a valid subsequence of the input, but the length of the ```subsequence``` will always __equal__ the length of the longest increasing subsequence. For example, with the input ```[3, 4, 5, 1]```, at the end we will have ```longest_increasing_subsequence = [1, 4, 5]```, which isn't a subsequence, but the length is still correct. The length remains correct because the length only changes when a new element is larger than any element in the subsequence. In that case, the element is appended to the subsequence instead of replacing an existing element.

__Time Complexity__: ```O(N^2)```, nested loop through the entire input array in the worst case

__Space Complexity__: ```O(N)```, subarray can be as large in size as the input array if every element in input array is strictly increasing

```Python
class Solution:
    def lengthOfLIS(self, nums: List[int]) -> int:
        pivot = nums[0]
        longest_increasing_subsequence = list()
        longest_increasing_subsequence.append(pivot)

        for num in nums[1:]:
            idx = 0
            # Check if the consequence is not increasing with the current numbe
            if num <= longest_increasing_subsequence[-1]:
                # Search for the candidate to keep in the subsequence
                while longest_increasing_subsequence[idx] < num:
                    idx += 1
                longest_increasing_subsequence[idx] = num
            # Check if the subsequence is increasing, or the next number is bigger than the newest number in the subsequence
            else:
                longest_increasing_subsequence.append(num)
        return len(longest_increasing_subsequence)
```
