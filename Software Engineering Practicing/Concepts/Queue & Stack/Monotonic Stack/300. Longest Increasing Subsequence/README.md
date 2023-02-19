## 300. Longest Increasing Subsequence

```Tag```: ```Monotonic Stack```

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
