## 974. Subarray Sums Divisible by K

```Tag```: ```Dynamic Programming``` ```Prefix Sum```

#### Difficulty: Medium

Given an integer array ```nums``` and an integer ```k```, return _the number of non-empty __subarrays__ that have a sum divisible by ```k```_.

A __subarray__ is a __contiguous__ part of an array.

![image](https://user-images.githubusercontent.com/35042430/213331466-39537e58-e6bc-441c-b675-55be47155d21.png)

---

__Example 1:__
```
Input: nums = [4,5,0,-2,-3,1], k = 5
Output: 7
Explanation: There are 7 subarrays with a sum divisible by k = 5:
[4, 5, 0, -2, -3, 1], [5], [5, 0], [5, 0, -2, -3], [0], [0, -2, -3], [-2, -3]
```

__Example 2:__
```
Input: nums = [5], k = 9
Output: 0
```

__Constraints:__
```
1 <= nums.length <= 3 * 104
-104 <= nums[i] <= 104
2 <= k <= 104
```

---

### Brute Force

```Python
class Solution:
    def subarraysDivByK(self, nums: List[int], k: int) -> int:
        # Brute Force
        #### Time Complexity : O(N^2), nested loops
        #### Space Complexity: O(1), constant memory space for pointers
        count = 0
        for i in range(len(nums)):
            curr_subarray = 0
            for j in range(i, len(nums)):
                curr_subarray += nums[j]
                if curr_subarray % k == 0:
                    count += 1
        return count
```

### Dynamic Programming

### Prefix Sums and Frequency Table

```Python
class Solution:
    def subarraysDivByK(self, nums: List[int], k: int) -> int:
        # Prefix Sum
        #### Time Complexity : O(N), traverse through the input array
        #### Space Complexity: O(N), extra memory space needed to build frequency table
        # Frequency table to store the Frequency of the remainder
        memo = collections.defaultdict(int)
        # Empty subarray have a sum of zero and remainder of 0; hence, the frequency starts at 1
        memo[0] = 1
        res = prefix_sum = 0
        for num in nums:
            # Add current num to the prefix sum
            prefix_sum += num
            remainder = prefix_sum % k
            # Get the frequency of previous prefix sum up to the current num and add to the final answer
            res += memo[remainder]
            print (prefix_sum, remainder, memo[remainder])
            # Update the frequency of the remainder
            memo[remainder] += 1
        return res
```

### Prefix Sums and Counting

#### Algorithm

1. Initialize an integer ```prefixMod = 0``` to store the remainder when the sum of the elements of a array till the current index when divided by ```k```, and the answer variable ```result = 0``` to store the number of subarrays divisible by ```k```.
2. Initialize an array, ```modGroups[k]``` where ```modGroup[R]``` stores the number of subarrays encountered with the sum of elements having a remainder ```R``` when divided by ```k```. Set ```modGroups[0] = 1```.
3. Iterate over all the elements of ```num```.
    - For each index ```i```, compute the prefix modulo as ```prefixMod = (prefixMod + num[i] % k + k) % k```. We take modulo twice in ```(prefixMod + num[i] % k + k) % k``` to remove negative numbers since ```num[i]``` can be a negative number and the sum ```prefixMod + nums[i] % k``` can turn out to be negative. To remove the negative number we add ```k``` to make it positive and then takes its modulo again with ```k```.
    - Add the number of subarrays encountered till now that have the same remainder to the result: ```result = result + modGroups[prefixMod]```.
    - In the end, we include the remainder of the subarray in the modGroups, i.e., ```modGroups[prefixMod] = modGroups[prefixMod] + 1``` for future matches.
4. Return ```result```.

```Python
class Solution:
    def subarraysDivByK(self, nums: List[int], k: int) -> int:
        # Prefix Sum
        #### Time Complexity : O(N + k)
        #### Space Complexity: O(k)
        n = len(nums)
        res = prefix_mod = 0
        dp = [0] * k
        dp[0] = 1
        for num in nums:
            # Take modulo twice to avoid negative remainder
            prefix_mod = (prefix_mod + num % k + k) % k
            # Add the count of subarrays that have the same remainder as the current one to cancel out the remainder
            res += dp[prefix_mod]
            dp[prefix_mod] += 1
        return res    
```
