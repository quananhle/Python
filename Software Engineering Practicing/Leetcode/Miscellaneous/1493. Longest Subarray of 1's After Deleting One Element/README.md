## [1493. Longest Subarray of 1's After Deleting One Element](https://leetcode.com/problems/longest-subarray-of-1s-after-deleting-one-element)

```Tag```: ```Two Pointers``` ```Sliding Window```

#### Difficulty: Medium

Given a binary array ```nums```, you should delete __one__ element from it.

Return _the size of the longest non-empty subarray containing only ```1```'s in the resulting array_. Return _```0``` if there is no such subarray_.

![image](https://github.com/quananhle/Python/assets/35042430/ae965b2f-1887-472f-859a-6abfe3f06ac7)

---

__Example 1:__
```
Input: nums = [1,1,0,1]
Output: 3
Explanation: After deleting the number in position 2, [1,1,1] contains 3 numbers with value of 1's.
```

__Example 2:__
```
Input: nums = [0,1,1,1,0,1,1,0,1]
Output: 5
Explanation: After deleting the number in position 4, [0,1,1,1,1,1,0,1] longest subarray with value of 1's is [1,1,1,1,1].
```

__Example 3:__
```
Input: nums = [1,1,1]
Output: 2
Explanation: You must delete one element.
```

__Constraints:__

- ```1 <= nums.length <= 10^5```
- ```nums[i]``` is either ```0``` or ```1```.

---

![image](https://leetcode.com/problems/longest-subarray-of-1s-after-deleting-one-element/Figures/1493/1493A.png)

### Sliding Window

- Time Complexity: ```O(N)```
- Space Complexity: ```O(1)```

```Python
class Solution:
    def longestSubarray(self, nums: List[int]) -> int:
        ans = 0
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

```Python
class Solution:
    def longestSubarray(self, nums: List[int]) -> int:
        n = len(nums)
        start = 0
        k = 1
        for end in range(n):
            k -= 1 - nums[end]
            '''
            if nums[end] == 0:
                k -= 1
            '''
            if k < 0:
                k += 1 - nums[start]
                '''
                if nums[start] == 0:
                    k += 1
                '''
                start += 1
        return end - start
```
