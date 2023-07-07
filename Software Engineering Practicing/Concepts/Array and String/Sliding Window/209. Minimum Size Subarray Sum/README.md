## [209. Minimum Size Subarray Sum](https://leetcode.com/problems/minimum-size-subarray-sum/)

```Tag```: ```Two Pointers``` ```Sliding Window```

#### Difficulty: Medium

Given an array of positive integers ```nums``` and a positive integer ```target```, return _the __minimal length__ of a subarray whose sum is greater than or equal to ```target```_. If there is no such subarray, return ```0``` instead.

![image](https://user-images.githubusercontent.com/35042430/209982455-57daa1fc-d043-4b35-8304-51ab96d0bbf2.png)

---

__Example 1:__
```
Input: target = 7, nums = [2,3,1,2,4,3]
Output: 2
Explanation: The subarray [4,3] has the minimal length under the problem constraint.
```

__Example 2:__
```
Input: target = 4, nums = [1,4,4]
Output: 1
```

__Example 3:__
```
Input: target = 11, nums = [1,1,1,1,1,1,1,1]
Output: 0
```

__Constraints:__

- $1 <=$ ```target``` $<= 10^{9}$
- $1 <=$ ```nums.length``` $<= 10^{5}$
- $1 <=$ ```nums[i]``` $<= 10^4$

---

__Follow up:__ If you have figured out the ```O(n)``` solution, try coding another solution of which the time complexity is ```O(n log(n))```.

### Brute Force with Nested Loops

```Python
class Solution:
    def minSubArrayLen(self, target: int, nums: List[int]) -> int:
        # Brute Force with Nested Loops
        ### Time Limit Exceeded
        #### Time Complexity: O(N^2)
        #### Space Complexity: O(1)
        
        res = sys.maxsize
        if not nums:
            return 0
        for i in range(len(nums)):
            total = 0
            for j in range(i, len(nums)):
                total += nums[j]
                if total >= target:
                    res = min(res, j - i + 1)
                    break
            if res == sys.maxsize and total < target and i == len(nums) - 1:
                return 0
        return res if res != sys.maxsize else 0
```

### Two Pointers (Sliding Window)

#### Algorithm

- Initialize ```ans``` to a large integer value
- Initialize ```left``` pointer to 0 and ```total``` to 0
- Iterate over the ```nums```:
    - Add ```nums[end]``` to ```total```
    - While ```total``` is greater than or equal to ```target```:
        - Update ```ans = min⁡(ans, end + 1 − left)```, where ```end + 1 − left``` is the size of current subarray
        - It means that the first index can safely be incremented, since, the minimum subarray starting with this index with ```total ≥ s``` has been achieved
        - Subtract ```nums[start]``` from ```total``` and increment ```start```

```Python
class Solution:
    def minSubArrayLen(self, target: int, nums: List[int]) -> int:
        # Two Pointers
        #### Time Complexity: O(N), traverse through the length of input array
        #### Space Complexity: O(1), constant pointers required only 
        ans = float('inf')
        n = len(nums)
        start = total = 0

        for end in range(n):
            total += nums[end]
            while total >= target:
                ans = min(ans, end - start + 1)
                total -= nums[start]
                start += 1

        return ans if ans != float('inf') else 0
```

```Python
class Solution:
    def minSubArrayLen(self, target: int, nums: List[int]) -> int:
        # Two Pointers
        #### Time Complexity: O(N), traverse through the length of input array
        #### Space Complexity: O(1), constant pointers required only 
        n = len(nums)
        start = 0
        ans = float('inf')

        for end in range(n):
            target -= nums[end]
            while target <= 0:
                target += nums[start]
                ans = min(ans, end - start + 1)
                start += 1
            
        return ans if ans != float('inf') else 0
```

__Time complexity__: ```O(n)```, single iteration of ```O(n)```.

- Each element can be visited atmost twice, once by the right pointer(i) and (atmost) once by the ```left``` pointer.
- You may be thinking: there is an inner while loop inside another for loop, isn't the time complexity $O(n^2)$. The reason it is still $O(n)$ is because the right pointer ```end``` can move $n$ times and the left pointer ```start``` can move also $n$ times in total. The inner loop is not running $n$ times for each iteration of the outer loop. A sliding window guarantees a maximum of $2n$ window iterations. This is what is referred to as __amortized analysis__ - even though the worst case for an iteration inside the for loop is $O(n)$, it averages out to $O(1)$ when you consider the entire runtime of the algorithm.
    
__Space complexity__: ```O(1)```, constant space required for ```left```, ```total```, ```res``` and ```i```.
