## 454. 4Sum II

```Tag```: ```Hash Map``` ```Counter```

#### Difficulty: Medium

Given four integer arrays ```nums1```, ```nums2```, ```nums3```, and ```nums4``` all of length ```n```, return _the number of tuples ```(i, j, k, l)```_ such that:

- ```0 <= i, j, k, l < n```
- ```nums1[i] + nums2[j] + nums3[k] + nums4[l] == 0```

![image](https://user-images.githubusercontent.com/35042430/213903180-8326b7e2-ab7b-4669-b176-e2a5d91be864.png)

---

__Example 1:__
```
Input: nums1 = [1,2], nums2 = [-2,-1], nums3 = [-1,2], nums4 = [0,2]
Output: 2
Explanation:
The two tuples are:
1. (0, 0, 0, 1) -> nums1[0] + nums2[0] + nums3[0] + nums4[1] = 1 + (-2) + (-1) + 2 = 0
2. (1, 1, 0, 0) -> nums1[1] + nums2[1] + nums3[0] + nums4[0] = 2 + (-1) + (-1) + 0 = 0
```

__Example 2:__
```
Input: nums1 = [0], nums2 = [0], nums3 = [0], nums4 = [0]
Output: 1
```

__Constraints:__
```
n == nums1.length
n == nums2.length
n == nums3.length
n == nums4.length
1 <= n <= 200
```
-2<sup>28</sup> <= nums1[i], nums2[i], nums3[i], nums4[i] <= 2<sup>28</sup>

---

### Hash Map

```a + b + c + d = 0``` == ```a + b = -c - d``` == ```a + b = -(c + d)```

__Time Complexity__: O(N<sup>2</sup>), nested loops through 4 input arrays

__Space Complexity__:O(N<sup>2</sup>), extra memory space to build hash map


```Python
class Solution:
    def fourSumCount(self, nums1: List[int], nums2: List[int], nums3: List[int], nums4: List[int]) -> int:
        count = 0
        memo = collections.defaultdict(int)
        for i in nums1:
            for j in nums2: 
                memo[i+j] += 1
        for k in nums3:
            for l in nums4:                 
                count += memo[-(k+l)]
        return count
```

```Python
class Solution:
    def fourSumCount(self, nums1: List[int], nums2: List[int], nums3: List[int], nums4: List[int]) -> int:
        count = 0
        memo = collections.defaultdict(int)
        for i in nums1:
            for j in nums2: 
                memo[i+j] += 1
        for k in nums3:
            for l in nums4:                 
                count += memo[-k-l]
        return count
```

```Python
class Solution:
    def fourSumCount(self, nums1: List[int], nums2: List[int], nums3: List[int], nums4: List[int]) -> int:
        counter = collections.defaultdict(int)
        count = 0
        for i in nums1:
            for j in nums2:
                if not i + j in counter:
                    counter[i+j] = 1
                else:
                    counter[i+j] += 1                
        for k in nums3:
            for l in nums4:
                if -k-l in counter:
                    count += counter[-k-l]
        return count
```

### Follow Up: Develop a universal solution to handle k Sum 

### Counter

__Time Complexity__: O(N<sup>k/2</sup>), nested loops through k input arrays

__Space Complexity__:O(N<sup>k/2</sup>), extra memory space to build hash map

```Python
class Solution:
    def fourSumCount(self, nums1: List[int], nums2: List[int], nums3: List[int], nums4: List[int]) -> int:
        def sum_count(arrays):
            res = collections.defaultdict(int)
            res[0] = 1
            for arr in arrays:
                counter = collections.defaultdict(int)
                for c in arr:
                    for total in res:
                        counter[total + c] += res[total]
                res = counter
            return res
        
        arrays = [nums1, nums2, nums3, nums4]
        k = len(arrays)
        left, right = sum_count(arrays[:k//2]), sum_count(arrays[k//2:])
        return sum(left[n] * right[-n] for n in left)
```
