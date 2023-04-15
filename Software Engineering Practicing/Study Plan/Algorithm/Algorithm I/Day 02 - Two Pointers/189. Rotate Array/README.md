## [189. Rotate Array](https://leetcode.com/problems/rotate-array)

```Tag```: ```Two Pointers``` ```Stack``` ```Splicing```

#### Difficulty: Medium

Given an array, rotate the array to the right by ```k``` steps, where ```k``` is non-negative.

![image](https://user-images.githubusercontent.com/35042430/210019065-ea0ee90a-dc60-4509-8f6e-eccdba3ef0fb.png)

---

__Example 1:__
```
Input: nums = [1,2,3,4,5,6,7], k = 3
Output: [5,6,7,1,2,3,4]
Explanation:
rotate 1 steps to the right: [7,1,2,3,4,5,6]
rotate 2 steps to the right: [6,7,1,2,3,4,5]
rotate 3 steps to the right: [5,6,7,1,2,3,4]
```

__Example 2:__
```
Input: nums = [-1,-100,3,99], k = 2
Output: [3,99,-1,-100]
Explanation: 
rotate 1 steps to the right: [99,-1,-100,3]
rotate 2 steps to the right: [3,99,-1,-100]
```

__Constraints:__
```
1 <= nums.length <= 105
-231 <= nums[i] <= 231 - 1
0 <= k <= 105
```

---

__Follow up__:

- Try to come up with as many solutions as you can. There are at least three different ways to solve this problem.
- Could you do it in-place with ```O(1)``` extra space?

### Brute Force

```Python
class Solution:
    def rotate(self, nums: List[int], k: int) -> None:
        """
        Do not return anything, modify nums in-place instead.
        """
        # Brute Force with Nested Loop
        ### Time Limit Exceeded
        #### Time Complexity: O(N * k), nested loop traverse the input size N in k times
        #### Space Complexity: O(1), constant memory space
        '''
        k %= len(nums)
        for _ in range(k):
            previous = nums[-1]
            for j in range(len(nums)):
                previous, nums[j] = nums[j], previous
        '''
        # Base Cases
        # If k == n, rotate a complete round similar to k == 0
        n = len(nums)
        k = k - (k // n) * n
        left, right = 0, len(nums) - 1
        while k:
            tail = nums[right]   
            for i in range(len(nums) - 1, -1, -1):
                nums[i] = nums[i-1]
            nums[0] = tail
            k -= 1
```

### Splicing

```Python
class Solution:
    def rotate(self, nums: List[int], k: int) -> None:
        """
        Do not return anything, modify nums in-place instead.
        """
        #### Time Complexity: O(N), splicing cost N time to copy all element to a new array
        #### Space Complexity: O(N), extra memory space to create a copy of the input array        
        k %= len(nums)
        res = [None] * len(nums)
        for i in range(len(nums)):
            res[(i + k) % len(nums)] = nums[i]
        nums[:] = res
```

### Pop() and Prepend (insert(0, n))

```Python
class Solution:
    def rotate(self, nums: List[int], k: int) -> None:
        """
        Do not return anything, modify nums in-place instead.
        """

        # Stack Pop() and Prepend
        #### Time Complexity: O(k), loop k time
        #### Space Complexity: O(1), constant memory space
        # Base Cases
        # If k == n, rotate a complete round similar to k == 0
        k %= len(nums)
        for _ in range(k):
            num = nums.pop()
            nums.insert(0, num)
```

### Reverse

```Python
class Solution:
    def __reverse__(self, nums: List[int], start: int, end: int) -> None:
        while start < end:    
            nums[start], nums[end] = nums[end], nums[start]
            start += 1
            end -= 1

    def rotate(self, nums: List[int], k: int) -> None:
        """
        Do not return anything, modify nums in-place instead.
        """
        #### Time Complexity: O(N), N element reversed 3 times
        #### Space Complexity: O(1), constant memory space
        
        n = len(nums)
        k %= n
        
        # [1,2,3,4,5,6,7]
        self.__reverse__(nums, 0, n-1)  # [7, 6, 5, 4, 3, 2, 1]
        self.__reverse__(nums, 0, k-1)  # [5, 6, 7, 4, 3, 2, 1]
        self.__reverse__(nums, k, n-1)  # [5, 6, 7, 1, 2, 3, 4]
```

```Python
class Solution:
    def rotate(self, nums: List[int], k: int) -> None:
        """
        Do not return anything, modify nums in-place instead.
        """
        #### Time Complexity: O(N), N element reversed 3 times
        #### Space Complexity: O(1), constant memory space        
        
        n = len(nums)
        k %= n
        def __reverse__(start, end):
            while start < end:    
                nums[start], nums[end] = nums[end], nums[start]
                start += 1
                end -= 1
        __reverse__(0, n-1)
        __reverse__(0, k-1)
        __reverse__(k, n-1)   
```
