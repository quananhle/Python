## Sliding Window

### [209. Minimum Size Subarray Sum](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Concepts/Array%20and%20String/Sliding%20Window/209.%20Minimum%20Size%20Subarray%20Sum)

Given an array of positive integers ```nums``` and a positive integer ```target```, return _the __minimal length__ of a subarray whose sum is greater than or equal to ```target```_. If there is no such subarray, return ```0``` instead.

__Example 1:__
```
Input: target = 7, nums = [2,3,1,2,4,3]
Output: 2
Explanation: The subarray [4,3] has the minimal length under the problem constraint.
```

```Python
class Solution:
    def minSubArrayLen(self, target: int, nums: List[int]) -> int:
        ans = float('inf')
        n = len(nums)
        start = total = 0

        for end in range(n):
            total += nums[end]
            while total >= target:
                ans = min(ans, end - start + 1)
                total -= nums[start]
                start += 1

        return 0 if ans == float('inf') else ans
```

### [643. Maximum Average Subarray I](https://github.com/quananhle/Python/blob/main/Software%20Engineering%20Practicing/Leetcode/Facebook/643.%20Maximum%20Average%20Subarray%20I)

You are given an integer array ```nums``` consisting of ```n``` elements, and an integer ```k```.

Find a contiguous subarray whose length is equal to ```k``` that has the maximum average value and return this value. Any answer with a calculation error less than 10<sup>-5</sup> will be accepted.

__Example 1:__
```
Input: nums = [1,12,-5,-6,50,3], k = 4
Output: 12.75000
Explanation: Maximum average is (12 - 5 - 6 + 50) / 4 = 51 / 4 = 12.75
```

```Python
class Solution:
    def findMaxAverage(self, nums: List[int], k: int) -> float:
        ans = curr = sum(nums[:k])
        n = len(nums)

        if n <= k:
            return sum(nums) / k

        for end in range(k, n):
            start = end - k
            curr += nums[end] - nums[start]
            ans = max(ans, curr)

        return ans / k
```

### [1456. Maximum Number of Vowels in a Substring of Given Length](https://github.com/quananhle/Python/blob/main/Software%20Engineering%20Practicing/Leetcode/Amazon/1456.%20Maximum%20Number%20of%20Vowels%20in%20a%20Substring%20of%20Given%20Length)

Given a string ```s``` and an integer ```k```, return _the maximum number of vowel letters in any substring of ```s``` with length ```k```_.

__Vowel letters__ in English are ```'a'```, ```'e'```, ```'i'```, ```'o'```, and ```'u'```.

__Example 1:__
```
Input: s = "abciiidef", k = 3
Output: 3
Explanation: The substring "iii" contains 3 vowel letters.
```

```Python
class Solution:
    def maxVowels(self, s: str, k: int) -> int:
        vowels = {'a' , 'e' , 'i' , 'o' , 'u'}
        substring = s[:k]
        curr = sum([1 for c in substring if c in vowels])
        n = len(s)
        ans = curr

        for end in range(k + 1, n + 1):
            start = end - k
            if substring[0] in vowels:
                curr -= 1
            substring = s[start:end]
            if substring[-1] in vowels:
                curr += 1
            ans = max(ans, curr)
        
        return ans
```

### [1004. Max Consecutive Ones III](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Leetcode/Google/1004.%20Max%20Consecutive%20Ones%20III)

Given a binary array ```nums``` and an integer ```k```, return _the maximum number of consecutive ```1```'s in the array if you can flip at most ```k``` ```0```'s_.

__Example 1:__
```
Input: nums = [1,1,1,0,0,0,1,1,1,1,0], k = 2
Output: 6
Explanation: [1,1,1,0,0,1,1,1,1,1,1]
Bolded numbers were flipped from 0 to 1. The longest subarray is underlined.
```

```Python
class Solution:
    def longestOnes(self, nums: List[int], k: int) -> int:
        start = 0 
        n = len(nums)

        for end in range(n):
            k -= 1 if not nums[end] else 0
            if k < 0:
                k += 1 if not nums[start] else 0
                start += 1
        
        return end - start + 1
```

### [1493. Longest Subarray of 1's After Deleting One Element](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Leetcode/Miscellaneous/1493.%20Longest%20Subarray%20of%201's%20After%20Deleting%20One%20Element)

Given a binary array ```nums```, you should delete __one__ element from it.

Return _the size of the longest non-empty subarray containing only ```1```'s in the resulting array_. Return _```0``` if there is no such subarray_.

__Example 1:__
```
Input: nums = [1,1,0,1]
Output: 3
Explanation: After deleting the number in position 2, [1,1,1] contains 3 numbers with value of 1's.
```

```Python
class Solution:
    def longestSubarray(self, nums: List[int]) -> int:
        n = len(nums)
        start = 0
        k = 1
        for end in range(n):
            if nums[end] == 0:
                k -= 1
            if k < 0:
                if nums[start] == 0:
                    k += 1
                start += 1
        return end - start
```

### 2024. Maximize the Confusion of an Exam

