## [1464. Maximum Product of Two Elements in an Array](https://leetcode.com/problems/maximum-product-of-two-elements-in-an-array)

```Tag```: ```Array & String``` ```Priority Queue``` ```Sorting```

#### Difficulty: Easy

Given the array of integers ```nums```, you will choose two different indices ```i``` and ```j``` of that array. Return _the maximum value of ```(nums[i]-1) * (nums[j]-1)```_.

![image](https://github.com/quananhle/Python/assets/35042430/fe8fd904-0cf9-4fce-ad97-1247d18dfc03)

---

__Example 1:__
```
Input: nums = [3,4,5,2]
Output: 12 
Explanation: If you choose the indices i=1 and j=2 (indexed from 0), you will get the maximum value, that is, (nums[1]-1)*(nums[2]-1) = (4-1)*(5-1) = 3*4 = 12.
```

__Example 2:__
```
Input: nums = [1,5,4,5]
Output: 16
Explanation: Choosing the indices i=1 and j=3 (indexed from 0), you will get the maximum value of (5-1)*(5-1) = 16.
```

__Example 3:__
```
Input: nums = [3,7]
Output: 12
```

__Constraints:__

- $2 \le nums.length \le 500$
- $1 \le nums[i] \le 10^3$

---

### Array & String

### Brute Force

```Python
class Solution:
    def maxProduct(self, nums: List[int]) -> int:
        ans = 0
        n = len(nums)
        for i in range(n):
            for j in range(i + 1, n):
                ans = max(ans, (nums[i] - 1) * (nums[j] - 1))

        return ans
```

#### Two Passes (To Track Second Biggest)

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(n)$
- __Space Complexity__: $\mathcal{O}(1)$

```Python
class Solution:
    def maxProduct(self, nums: List[int]) -> int:
        candidate_1 = candidate_2 = 0
        i = 0

        for idx, num in enumerate(nums):
            if candidate_1 < num:
                i = idx
                candidate_1 = num

        for idx, num in enumerate(nums):
            if candidate_2 < num and idx != i:
                candidate_2 = num

        return (candidate_1 - 1) * (candidate_2 - 1)
```

#### One Pass (To Track Second Biggest)

```Python
class Solution:
    def maxProduct(self, nums: List[int]) -> int:
        biggest = second_biggest = 0
        for num in nums:
            if biggest < num:
                second_biggest = biggest
                biggest = num
            else:
                second_biggest = max(second_biggest, num)
        
        return (biggest - 1) * (second_biggest - 1)
```

---

### Sort

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(n \log n)$
- __Space Complexity__: $\mathcal{O}(\log n)$ or $\mathcal{O}(n)$.
> The space complexity of the sorting algorithm depends on the implementation of each programming language:

>>- In Java, ```Arrays.sort()``` for primitives is implemented using a variant of the Quick Sort algorithm, which has a space complexity of $\mathcal{O}(\log n)$
>>- In C++, the ```sort()``` function provided by STL uses a hybrid of Quick Sort, Heap Sort and Insertion Sort, with a worst case space complexity of $\mathcal{O}(\log n)$
>>- In Python, the ```sort()``` function is implemented using the Timsort algorithm, which has a worst-case space complexity of $\mathcal{O}(n)$.

```Python
class Solution:
    def maxProduct(self, nums: List[int]) -> int:
        nums.sort()
        return (nums[-1] - 1) * (nums[-2] - 1)
```

### Priority Queue

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(n \log n)$
- __Space Complexity__: $\mathcal{O}(\log n)$ or $\mathcal{O}(n)$

```Python
class Solution:
    def maxProduct(self, nums: List[int]) -> int:
        h = list()
        for num in nums:
            heapq.heappush(h, -num)

        return (heapq.heappop(h) + 1) * (heapq.heappop(h) + 1)
```
