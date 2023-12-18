## [215. K<sup>th</sup> Largest Element in an Array](https://leetcode.com/problems/kth-largest-element-in-an-array)

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

__Complexity Analysis__

Given ```n``` as the length of ```nums```,

- __Time Complexity__: $\mathcal{O}(n \cdot \log k)$
- __Space Complexity__: $\mathcal{O}(k)$

#### Min Heap

![image](https://leetcode.com/problems/kth-largest-element-in-an-array/Figures/215/1.png)

```Python
class Solution:
    def findKthLargest(self, nums: List[int], k: int) -> int:
        h = list()

        for num in nums:
            heapq.heappush(h, num)
            if len(h) > k:
                heapq.heappop(h)
        
        return h[0]
```

#### Max Heap

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

### Quickselect

Quickselect, also known as __Hoare's selection algorithm__, is an algorithm for finding the $k^{th}$ smallest element in an unordered list. It is significant because it has an average runtime of $\mathcal{O}(n)$.

![image](https://leetcode.com/problems/kth-largest-element-in-an-array/Figures/215/2.png)

![image](https://leetcode.com/problems/kth-largest-element-in-an-array/Figures/215/3.png)

![image](https://leetcode.com/problems/kth-largest-element-in-an-array/Figures/215/4.png)

![image](https://github.com/quananhle/Python/assets/35042430/209ecf9e-86ce-46c1-91dd-ac66b4e7f843)

```Python
class Solution:
    def findKthLargest(self, nums: List[int], k: int) -> int:
        def quick_select(nums, k):
            pivot = random.choice(nums)
            left, mid, right = list(), list(), list()

            for num in nums:
                if num > pivot:
                    left.append(num)
                elif num < pivot:
                    right.append(num)
                else:
                    mid.append(num)
            
            if k <= len(left):
                return quick_select(left, k)
            
            if len(left) + len(mid) < k:
                return quick_select(right, k - len(left) - len(mid))
            
            return pivot
        
        return quick_select(nums, k)
```

### Counting Sort

- __Time Complexity__: $\mathcal{O}(n + m)$
- __Space Complexity__: $\mathcal{O}(m)$

```Python
class Solution:
    def findKthLargest(self, nums: List[int], k: int) -> int:
        min_value, max_value = min(nums), max(nums)
        count = [0] * (max_value - min_value + 1)

        for num in nums:
            count[num - min_value] += 1
        
        print (count)

        remain = k
        for num in range(len(count) - 1, -1, -1):
            remain -= count[num]
            if remain <= 0:
                return num + min_value
        
        return -1
```

