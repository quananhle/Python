## [3005. Count Elements With Maximum Frequency](https://leetcode.com/problems/count-elements-with-maximum-frequency)

```Tag```: ```Array & String```

#### Difficulty: Easy

You are given an array ```nums``` consisting of positive integers.

Return _the total frequencies of elements in ```nums``` such that those elements all have the maximum frequency_.

The frequency of an element is the number of occurrences of that element in the array.

---

__Example 1:__
```
Input: nums = [1,2,2,3,1,4]
Output: 4
Explanation: The elements 1 and 2 have a frequency of 2 which is the maximum frequency in the array.
So the number of elements in the array with maximum frequency is 4.
```

__Example 2:__
```
Input: nums = [1,2,3,4,5]
Output: 5
Explanation: All elements of the array have a frequency of 1 which is the maximum.
So the number of elements in the array with maximum frequency is 5.
```
 
__Constraints:__

- $1 \le nums.length \le 100$
- $1 \le nums[i] \le 100$

---

### Array

```Python
class Solution:
    def maxFrequencyElements(self, nums: List[int]) -> int:
        n = len(nums)
        freq = [0] * (max(nums) + 1)

        for num in nums:
            freq[num] += 1
        
        ans = 0
        for _, f in enumerate(freq):
            if f == max(freq):
                ans += f
        
        return ans
```

### Hash Map

```Python
class Solution:
    def maxFrequencyElements(self, nums: List[int]) -> int:
        counter = collections.Counter(nums)
        max_frequency = 0
        for freq in counter.values():
            max_frequency = max(max_frequency, freq)
        
        frequency_of_max_frequency = 0
        for freq in counter.values():
            if freq == max_frequency:
                frequency_of_max_frequency += 1
            
        return frequency_of_max_frequency * max_frequency
```
