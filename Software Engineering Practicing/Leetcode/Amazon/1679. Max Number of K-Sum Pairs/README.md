## [1679. Max Number of K-Sum Pairs](https://leetcode.com/problems/max-number-of-k-sum-pairs)

```Tag```: ```Hash Map``` ```Two Pointers``` ```Sorting```

#### Difficulty: Medium

You are given an integer array ```nums``` and an integer ```k```.

In one operation, you can pick two numbers from the array whose sum equals ```k``` and remove them from the array.

Return _the maximum number of operations you can perform on the array_.

![image](https://github.com/quananhle/Python/assets/35042430/6200e116-f17f-41ed-bc4d-9ec6738d8b77)

---

Example 1:
```
Input: nums = [1,2,3,4], k = 5
Output: 2
Explanation: Starting with nums = [1,2,3,4]:
- Remove numbers 1 and 4, then nums = [2,3]
- Remove numbers 2 and 3, then nums = []
There are no more pairs that sum up to 5, hence a total of 2 operations.
```

Example 2:
```
Input: nums = [3,1,3,4,3], k = 6
Output: 1
Explanation: Starting with nums = [3,1,3,4,3]:
- Remove the first two 3's, then nums = [1,4,3]
There are no more pairs that sum up to 6, hence a total of 1 operation.
```

__Constraints__:

- ```1 <= nums.length <= 10^5```
- ```1 <= nums[i] <= 10^9```
- ```1 <= k <= 10^9```

---

### Brute Force

```Python

```

### Counter

```Python
class Solution:
    def maxOperations(self, nums: List[int], k: int) -> int:
        count = 0
        complements = collections.defaultdict(int)

        for num in nums:
            complements[num] = 1 + complements.get(num, 0)

        for num in nums:
            curr = num
            comp = k - curr
            if complements[curr] > 0 and complements[comp] > 0:
                if curr == comp and complements[curr] < 2:
                    continue
                complements[curr] -= 1
                complements[comp] -= 1
                count += 1

        return count
```

```Python
class Solution:
    def maxOperations(self, nums: List[int], k: int) -> int:
        count = 0
        complements = collections.defaultdict(int)

        for num in nums:
            complements[num] = 1 + complements.get(num, 0)

        for num in nums:
            curr = num
            comp = k - curr
            if curr in complements and comp in complements:
                if curr == comp and complements[curr] < 2:
                    continue

                complements[curr] -= 1
                complements[comp] -= 1
                if complements[curr] == 0:
                    del complements[curr]
                if complements[comp] == 0:
                    del complements[comp]

                count += 1

        return count
```

```Python

```

### Two Pointers + Sorting

```Python
class Solution:
    def maxOperations(self, nums: List[int], k: int) -> int:
        nums.sort()
        count = 0
        n = len(nums)
        i, j = 0, n - 1

        while i < j:
            if nums[i] + nums[j] < k:
                i += 1
            elif nums[i] + nums[j] > k:
                j -= 1
            else:
                count += 1
                i += 1
                j -= 1
            
        return count
```
