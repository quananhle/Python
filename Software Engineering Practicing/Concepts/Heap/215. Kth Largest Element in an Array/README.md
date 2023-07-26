## [215. Kth Largest Element in an Array](https://leetcode.com/problems/kth-largest-element-in-an-array)

```Tag```: ```Priority Queue``` ```Sorting```

#### Difficulty: Medium

Given an integer array ```nums``` and an integer ```k```, return _the ```k```<sup>th</sup> largest element in the array_.

Note that it is the ```k```<sup>th</sup> largest element in the sorted order, not the ```k```<sup>th</sup> distinct element.

Can you solve it without sorting?

![image](https://github.com/quananhle/Python/assets/35042430/6122472b-cc6f-4033-bc1c-6dbf54054b93)

---

__Example 1:__
```
Input: nums = [3,2,1,5,6,4], k = 2
Output: 5
```

__Example 2:__
```
Input: nums = [3,2,3,1,2,4,5,5,6], k = 4
Output: 4
```

__Constraints:__

- $1 \le k \le nums.length \le 10^{5}$
- $-10^{4} \le nums[i] \le 10^{4}$

---

### Sorting

```Python
class Solution:
    def findKthLargest(self, nums: List[int], k: int) -> int:
        return sorted(nums)[len(nums) - k]
```

### Priority Queue

#### Min Heap

__Complexity Analysis__

Given ```n``` as the length of ```nums```,

- __Time Complexity__: $ \mathcal{O}(n \cdot \log k)$
- __Space Complexity__: $ \mathcal{O}(k)$


```Python
class Solution:
    def findKthLargest(self, nums: List[int], k: int) -> int:
        ans = 0
        h = list()

        for num in nums:
            heapq.heappush(h, -num)
        
        while k:
            ans = -heapq.heappop(h)
            k -= 1
        
        return ans
```
