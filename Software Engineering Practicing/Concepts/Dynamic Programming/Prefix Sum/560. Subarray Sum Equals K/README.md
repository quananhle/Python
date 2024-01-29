## [560. Subarray Sum Equals K](https://leetcode.com/problems/subarray-sum-equals-k/) (Number of Continuous Subarrays that Sum to Target)

```Tag``` ```Prefix Sum``` ```Dynamic Programming```

#### Difficulty: Medium

Given an array of integers ```nums``` and an integer ```k```, return _the total number of subarrays whose sum equals to ```k```_.

A subarray is a contiguous __non-empty__ sequence of elements within an array.

![image](https://github.com/quananhle/Python/assets/35042430/7a7c64eb-5b2d-4274-a0e2-09e92761ff8a)

---

__Example 1:__
```
Input: nums = [1,1,1], k = 2
Output: 2
```

__Example 2:__
```
Input: nums = [1,2,3], k = 3
Output: 2
```

__Constraints:__

- 1 <= ```nums.length``` <= 2 * 10<sup>4</sup>
- ```-1000 <= nums[i] <= 1000```
- -10<sup>7</sup> <= ```k``` <= 10<sup>7</sup>

---

### Brute Force

- __Time complexity__: O(n<sup>3</sup>)
- __Space complexity__: O(1)

```Python
class Solution:
    def subarraySum(self, nums: List[int], k: int) -> int:
        ### Time Limit Exceeded
        count = 0
        n = len(nums)
        for end in range(n + 1):
            for start in range(end):
                curr_sum = 0
                for i in range(start, end):
                    curr_sum += nums[i]
                if curr_sum == k:
                    count += 1
        return count
```

```Python
class Solution:
    def subarraySum(self, nums: List[int], k: int) -> int:
        ### Time Limit Exceeded
        count = 0
        n = len(nums)
        for start in range(n):
            for end in range(start + 1, n + 1):
                curr_sum = 0
                for i in range(start, end):
                    curr_sum += nums[i]
                if curr_sum == k:
                    count += 1 
        return count
```

- __Time complexity__: O(n<sup>2</sup>)
- __Space complexity__: O(1)

```Python
class Solution:
    def subarraySum(self, nums: List[int], k: int) -> int:
        ### Time Limit Exceeded
        count = 0
        n = len(nums)
        for start in range(n):
            curr_sum = 0
            for end in range(start, n):
                curr_sum += nums[end]
                if curr_sum == k:
                    count += 1
        
        return count
```

### Cumulative Sum

```Python
class Solution:
    def subarraySum(self, nums: List[int], k: int) -> int:
        ### Time Limit Exceeded
        ans = 0
        n = len(nums)
        prefix_sums = [0 for _ in range(n + 1)]

        # Pre-calculate cumulative sum
        for i in range(1, n + 1):
            prefix_sums[i] = prefix_sums[i - 1] + nums[i - 1]

        for end in range(1, n + 1):
            for start in range(end):
                if prefix_sums[end] - prefix_sums[start] == k:
                    ans += 1
                    
        return ans
```

```Python
class Solution:
    def subarraySum(self, nums: List[int], k: int) -> int:
        ### Time Limit Exceeded
        ans = 0
        n = len(nums)
        prefix_sums = [0] * (n + 1)

        for i in range(1, n + 1):
            prefix_sums[i] = prefix_sums[i - 1] + nums[i - 1]
        
        for start in range(n):
            for end in range(start + 1, n + 1):
                if prefix_sums[end] - prefix_sums[start] == k:
                    ans += 1
                
        return ans
```

### Prefix Sum

![image](https://leetcode.com/problems/path-sum-iii/Figures/437/array1.png)

![image](https://leetcode.com/problems/path-sum-iii/Figures/437/situation11.png)
![image](https://leetcode.com/problems/path-sum-iii/Figures/437/situation24.png)

- __Time complexity__: ```O(n)```, the entire ```nums``` array is traversed only once.
- __Space complexity__: ```O(n)```, hashmap mapmapmap can contain up to ```n``` distinct entries in the worst case.

```Python
class Solution:
    def subarraySum(self, nums: List[int], k: int) -> int:
        count = 0
        curr_sum = 0
        freq = collections.defaultdict(int)

        for num in nums:
            # Get the current running prefix sum
            curr_sum += num

            # Situation 1: continuous subarray starts from the beginning of the array
            if curr_sum == k:
                count += 1

            # Situation 2: the subarray starts somewhere in the middle.
            count += freq[curr_sum - k]

            freq[curr_sum] += 1


        return count
```
