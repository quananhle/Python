## [977. Squares of a Sorted Array](https://leetcode.com/problems/squares-of-a-sorted-array)

```Tag```: ```Sort``` ```Two Pointers``` ```Priority Queue```

#### Difficulty: Easy

Given an integer array nums sorted in non-decreasing order, return an array of the squares of each number sorted in non-decreasing order.

![image](https://github.com/quananhle/Python/assets/35042430/973fd563-d67d-44c1-a84a-d935d69a6955)

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

---

### Sort

```Python
class Solution:
    def sortedSquares(self, nums: List[int]) -> List[int]:
        # Sorting
        #### Time Complexity : O(NlogN), sort operations take NlogN time
        #### Space Complexity: O(N), required extra memory space to build copy of the array
        return sorted([num**2 for num in nums])
```

### Priority Queue

```Python
class Solution:
    def sortedSquares(self, nums: List[int]) -> List[int]:
        # Priority Queue
        #### Time Complexity : O(NlogN), heappush() or heappop() takes logN time while traverse through input array size N
        #### Space Complexity: O(N), build priority queue size N
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

__Follow up:__ Squaring each element and sorting the new array is very trivial, could you find an O(n) solution using a different approach?

### Two Pointers

```Python
class Solution:
    def sortedSquares(self, nums: List[int]) -> List[int]:
        # Two Pointers
        #### Time Complexity : O(N), traverse through the input array
        #### Space Complexity: O(N), extra memory space for output array
        n = len(nums)
        res = [0] * n
        left, right = 0, n - 1
        for i in range(n-1, -1, -1):
            if abs(nums[left]) < abs(nums[right]):
                square = nums[right]
                right -= 1
            else:
                square = nums[left]
                left += 1
            res[i] = square ** 2
        return res
```
