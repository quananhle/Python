## 209. Minimum Size Subarray Sum

```Tag```:

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
```
1 <= target <= 109
1 <= nums.length <= 105
1 <= nums[i] <= 104
```

---

__Follow up:__ If you have figured out the ```O(n)``` solution, try coding another solution of which the time complexity is ```O(n log(n))```.

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

### Two Pointers

#### Algorithm

- Initialize ```left``` pointer to 0 and ```total``` to 0
- Iterate over the ```nums```:
    - Add ```nums[i]``` to ```sum```
    - While ```total``` is greater than or equal to ```target```:
        - Update ```ans = min⁡(ans, i+1−left)```, where ```i+1−left``` is the size of current subarray
        - It means that the first index can safely be incremented, since, the minimum subarray starting with this index with ```total ≥ s``` has been achieved
        - Subtract ```nums[left]``` from ```sum``` and increment ```left```

```Python
class Solution:
    def minSubArrayLen(self, target: int, nums: List[int]) -> int:
        # Two Pointers
        #### Time Complexity:
        #### Space Complexity:
        res = sys.maxsize
        left, total = 0, 0
        for i in range(len(nums)):
            total += nums[i]
            while total >= target:
                res = min(res, i + 1 - left)
                total -= nums[left]
                left += 1
        return res if res != sys.maxsize else 0
```

__Time complexity__: ```O(n)```, single iteration of ```O(n)```.
    - Each element can be visited atmost twice, once by the right pointer(i) and (atmost) once by the ```left``` pointer.
__Space complexity__: ```O(1)```, constant space required for ```left```, ```total```, ```res``` and ```i```.
