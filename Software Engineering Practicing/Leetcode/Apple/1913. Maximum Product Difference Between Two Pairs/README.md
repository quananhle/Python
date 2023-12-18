## [1913. Maximum Product Difference Between Two Pairs](https://leetcode.com/problems/maximum-product-difference-between-two-pairs)

```Tag```: ```Array & String``` ```Sort``` ```Priority Queue```

#### Difficulty: Easy

The product difference between two pairs ```(a, b)``` and ```(c, d)``` is defined as ```(a * b) - (c * d)```.

- For example, the product difference between ```(5, 6)``` and ```(2, 7)``` is ```(5 * 6) - (2 * 7) = 16```.

Given an integer array ```nums```, choose four distinct indices ```w```, ```x```, ```y```, and ```z``` such that the product difference between pairs ```(nums[w], nums[x])``` and ```(nums[y], nums[z])``` is __maximized__.

Return _the __maximum__ such product difference_.

![image](https://github.com/quananhle/Python/assets/35042430/39f97aa7-4e9e-4b06-9562-7ddc82570502)

---

__Example 1:__
```
Input: nums = [5,6,2,7,4]
Output: 34
Explanation: We can choose indices 1 and 3 for the first pair (6, 7) and indices 2 and 4 for the second pair (2, 4).
The product difference is (6 * 7) - (2 * 4) = 34.
```

__Example 2:__
```
Input: nums = [4,2,5,9,7,4,8]
Output: 64
Explanation: We can choose indices 3 and 6 for the first pair (9, 8) and indices 1 and 5 for the second pair (2, 4).
The product difference is (9 * 8) - (2 * 4) = 64.
```

__Constraints:__

- $4 \le nums.length \le 10^4$
- $1 \le nums[i] \le 10^4$

---

### Sort

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(n \cdot \log{} n)$
- __Space Complexity__: $\mathcal{O}(n)$ or $\mathcal{O}(\log n)$

```Python
class Solution:
    def maxProductDifference(self, nums: List[int]) -> int:
        nums.sort()
        return (nums[-1] * nums[-2]) - (nums[0] * nums[1])
```

### Find Two Biggest and Two Smallest

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(n)$
- __Space Complexity__: $\mathcal{O}(1)$

```Python
class Solution:
    def maxProductDifference(self, nums: List[int]) -> int:
        biggest = second_biggest = -math.inf
        smallest = second_smallest = math.inf

        for num in nums:
            if biggest < num:
                second_biggest = biggest
                biggest = num
            else:
                second_biggest = max(second_biggest, num)

            if smallest > num:
                second_smallest = smallest
                smallest = num
            else:
                second_smallest = min(second_smallest, num)

        return biggest * second_biggest - smallest * second_smallest
```

```Python
class Solution:
    def maxProductDifference(self, nums: List[int]) -> int:
        biggest = second_biggest = -math.inf
        smallest = second_smallest = math.inf

        for num in nums:
            if biggest < num:
                second_biggest = biggest
                biggest = num
            elif second_biggest < num:
                second_biggest = num

            if smallest > num:
                second_smallest = smallest
                smallest = num
            elif second_smallest > num:
                second_smallest = num

        return biggest * second_biggest - smallest * second_smallest
```

### Priority Queue

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(n \cdot \log{} n)$
- __Space Complexity__: $\mathcal{O}(1)$. Heap sort is an in-place algorithm; it doesn't require any extra space

```Python
class Solution:
    def maxProductDifference(self, nums: List[int]) -> int:    # O(n * log n)
        biggest, smallest = list(), list()
        for num in nums:                            # O(n)
            heapq.heappush(biggest, -num)           # O(log n)
            heapq.heappush(smallest, num)           # O(log n)
        
        return heapq.heappop(biggest) * heapq.heappop(biggest) - heapq.heappop(smallest) * heapq.heappop(smallest)
```

#### One Liner

```Python
class Solution:
    def maxProductDifference(self, nums: List[int]) -> int:
        return mul(*nlargest(2, nums)) - mul(*nsmallest(2, nums))
```
