## [1493. Longest Subarray of 1's After Deleting One Element](https://leetcode.com/problems/longest-subarray-of-1s-after-deleting-one-element)

```Tag```: ```Two Pointers``` ```Sliding Window```

#### Difficulty: Medium

Given a binary array ```nums```, you should delete __one__ element from it.

Return _the size of the longest non-empty subarray containing only ```1```'s in the resulting array_. Return _```0``` if there is no such subarray_.

![image](https://github.com/quananhle/Python/assets/35042430/12cf41a1-1426-4946-b1e2-474a9cf2f7e7)

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

```Python
class Solution:
    def longestSubarray(self, nums: List[int]) -> int:
        n = len(nums)
        start = count = window = 0

        for end in range(n):
            # Expand window to the right, increment count if encountering an element to delete
            count += 1 if nums[end] == 0 else 0
            # Pick up from current start pointer, increment to the right until encountering the element to delete
            while count > 1:
                # Decrement count once encountering the element to delete
                count -= 1 if nums[start] == 0 else 0
                # Increment start pointer
                start += 1
            window = max(window, end - start)
        
        return window
```
