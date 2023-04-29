## [719. Find K-th Smallest Pair Distance](https://leetcode.com/problems/find-k-th-smallest-pair-distance)

```Tag```: ```Binary Search``` ```Heap``` ```Prefix Sum``` ```Sliding Window```

#### Difficulty: Hard

The distance of a pair of integers ```a``` and ```b``` is defined as the absolute difference between ```a``` and ```b```.

Given an integer array ```nums``` and an integer ```k```, return _the k<sup>th</sup> smallest distance among all the pairs ```nums[i]``` and ```nums[j]``` where ```0 <= i < j < nums.length```_.

![image](https://user-images.githubusercontent.com/35042430/235253137-f74a1514-126b-407e-bc97-adc0f6cde8f4.png)

---

__Example 1:__
```
Input: nums = [1,3,1], k = 1
Output: 0
Explanation: Here are all the pairs:
(1,3) -> 2
(1,1) -> 0
(3,1) -> 2
Then the 1st smallest distance pair is (1,1), and its distance is 0.
```

__Example 2:__
```
Input: nums = [1,1,1], k = 2
Output: 0
```

__Example 3:__
```
Input: nums = [1,6,1], k = 3
Output: 5
```

__Constraints:__

- ```n == nums.length```
- 2 <= ```n``` <= 10<sup>4</sup>
- 0 <= ```nums[i]``` <= 10<sup>6</sup>
- ```1 <= k <= n * (n - 1) / 2```

---

### Heap

- __Time Complexity__: ```O((k + N) * log⁡N)```
- __Space Complexity__: ```O((k + N) * log⁡N)```

```Python
class Solution:
    def smallestDistancePair(self, nums: List[int], k: int) -> int:
        nums.sort()
        n = len(nums)
        h = [(nums[i + 1] - nums[i], i, i + 1) for i in range(n - 1)]
        heapq.heapify(h)

        for _ in range(k):
            distance, root, neighbor = heapq.heappop(h)
            if neighbor + 1 < n:
                heapq.heappush(h, (nums[neighbor + 1] - nums[root], root, neighbor + 1))
        
        return distance
```

### Binary Search & Prefix Sum

```Python
class Solution:
    def smallestDistancePair(self, nums: List[int], k: int) -> int:
        def possible(guess):
            return sum(prefix[min(x + guess, W)] - prefix[x] + multiplicity[i] for i, x in enumerate(nums)) >= k

        nums.sort()
        W = nums[-1]
        n = len(nums)

        multiplicity = [0] * n
        for idx, num in enumerate(nums):
            if idx and num == nums[idx - 1]:
                multiplicity[idx] = 1 + multiplicity[idx - 1]

        prefix = [0] * (W + 1)
        left = 0
        for i in range(len(prefix)):
            while left < n and nums[left] == i:
                left += 1
            prefix[i] = left

        lo, hi = 0, nums[-1] - nums[0]
        while lo < hi:
            mi = lo + (hi - lo) // 2
            if possible(mi):
                hi = mi
            else:
                lo = mi + 1

        return lo
```

### Binary Search & Sliding Window

```Python
class Solution:
    def smallestDistancePair(self, nums: List[int], k: int) -> int:
        def possible(guess):
            count = left = 0
            for right, x in enumerate(nums):
                while x - nums[left] > guess:
                    left += 1
                count += right - left
            return count >= k

        nums.sort()
        lo, hi = 0, nums[-1] - nums[0]
        while lo < hi:
            mi = lo + (hi - lo) // 2
            if possible(mi):
                hi = mi
            else:
                lo = mi + 1
            
        return lo
```
