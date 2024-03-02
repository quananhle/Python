## [977. Squares of a Sorted Array](https://leetcode.com/problems/squares-of-a-sorted-array)

```Tag```: ```Two Pointers``` ```Sorting``` ```Heap```

#### Difficulty: Easy

Given an integer array ```nums``` sorted in non-decreasing order, return _an array of the squares of each number sorted in non-decreasing order_.

![image](https://github.com/quananhle/Python/assets/35042430/db51e66d-9655-4059-97c5-93e416282dc8)

---

__Example 1:__
```
Input: nums = [-4,-1,0,3,10]
Output: [0,1,9,16,100]
Explanation: After squaring, the array becomes [16,1,0,9,100].
After sorting, it becomes [0,1,9,16,100].
```

__Example 2:__
```
Input: nums = [-7,-3,2,3,11]
Output: [4,9,9,49,121]
```

__Constraints:__

- 1 <= ```nums.length``` <= 10<sup>4</sup>
- -10<sup>4</sup> <= ```nums[i]``` <= 10<sup>4</sup>
- ```nums``` is sorted in non-decreasing order.

__Follow up:__ Squaring each element and sorting the new array is very trivial, could you find an O(n) solution using a different approach?

---

### Sorting

```Python
class Solution:
    def sortedSquares(self, nums: List[int]) -> List[int]:
        return sorted([num * num for num in nums])
```

### Heap

```Python
class Solution:
    def sortedSquares(self, nums: List[int]) -> List[int]:
        h = list()
        res = list()
        
        for num in nums:
            heapq.heappush(h, num * num)
        
        while h:
            res.append(heappop(h))
        
        return res
```

```Python
class Solution:
    def sortedSquares(self, nums: List[int]) -> List[int]:
        min_heap = list()
        for num in nums:
            if num < 0:
                heapq.heappush(min_heap, num)
            else:
                heapq.heappush(min_heap, -num)
        res = list()
        while min_heap:
            n = heapq.heappop(min_heap)
            res.append(n**2)
        return res[::-1]
```

### Two Pointers

Append number to the output from the maximum element down to the minimum element. Hence, check the leftmost and rightmost element to find out if its square could be the maximum element in the output array.

```Python
class Solution:
    def sortedSquares(self, nums: List[int]) -> List[int]:
        n = len(nums)
        res = [0] * n
        left, right = 0, n - 1

        for i in range(n - 1, -1, -1):
            if abs(nums[left]) < abs(nums[right]):
                square = nums[right]
                right -= 1
            else:
                square = nums[left]
                left += 1

            res[i] = square ** 2

        return res
```

```Python
class Solution:
    def sortedSquares(self, nums: List[int]) -> List[int]:
        queue = collections.deque()
        l, r = 0, len(nums) - 1

        while l <= r:
            left, right = abs(nums[l]), abs(nums[r])
            if left > right:
                queue.appendleft(left * left)
                l += 1
            else:
                queue.appendleft(right * right)
                r -= 1

        return queue
```
