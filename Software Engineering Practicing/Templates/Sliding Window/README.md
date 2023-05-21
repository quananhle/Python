## Sliding Window

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
