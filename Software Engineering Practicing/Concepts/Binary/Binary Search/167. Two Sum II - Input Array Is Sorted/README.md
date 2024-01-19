## [167. Two Sum II - Input Array Is Sorted](https://leetcode.com/problems/two-sum-ii-input-array-is-sorted)

```Tag```: ```Two Pointer``` ```Hash Table``` ```Binary Search```

#### Difficulty: Medium

Given a __1-indexed__ array of integers ```numbers``` that is already sorted in __non-decreasing order__, find two numbers such that they add up to a specific ```target``` number. Let these two numbers be ```numbers[index1]``` and ```numbers[index2]``` where ```1 <= index1 < index2 <= numbers.length```.

Return _the indices of the two numbers, ```index1``` and ```index2```, __added by one__ as an integer array ```[index1, index2]``` of length 2_.

The tests are generated such that there is __exactly one solution__. You may not use the same element twice.

Your solution must use only __constant extra space__.

![image](https://github.com/quananhle/Python/assets/35042430/96493cfa-6731-449b-a725-fd9048a313a5)

---

__Example 1:__
```
Input: numbers = [2,7,11,15], target = 9
Output: [1,2]
Explanation: The sum of 2 and 7 is 9. Therefore, index1 = 1, index2 = 2. We return [1, 2].
```

__Example 2:__
```
Input: numbers = [2,3,4], target = 6
Output: [1,3]
Explanation: The sum of 2 and 4 is 6. Therefore index1 = 1, index2 = 3. We return [1, 3].
```

__Example 3:__
```
Input: numbers = [-1,0], target = -1
Output: [1,2]
Explanation: The sum of -1 and 0 is -1. Therefore index1 = 1, index2 = 2. We return [1, 2].
```

__Constraints:__

- $2 \le numbers.length \le 3 * 10^4$
- $-1000 \le numbers[i] \le 1000$
- ```numbers``` is sorted in non-decreasing order.
- $-1000 \le target \le 1000$
- The tests are generated such that there is exactly one solution.

---

### Hash Table

```Python
class Solution:
    def twoSum(self, numbers: List[int], target: int) -> List[int]:
        # Computational Memo
        #### Time Complexity: O(N), iterarte through input list
        #### Space Complexity: O(N), extra space required to build memo
        memo = collections.defaultdict(int)
        for idx, num in enumerate(numbers):
            complement = target - num
            if complement in memo:
                return [memo[complement], idx + 1]
            else:
                memo[num] = idx + 1
```
 
### Binary Search
 
```Python
class Solution:
    def twoSum(self, numbers: List[int], target: int) -> List[int]:
        # Binary Search
        #### Time Complexity: O(NlogN), binary search costs logN time while iterate through the input size N
        #### Space Complexity: O(1), constant memory space for pointers
        def binary_search(left, right, target):
            while left <= right:
                # Initialize a mid pointer
                mid = left + (right - left) // 2
                # If target not in the left half, update left pointer
                if numbers[mid] < target:
                    left = mid + 1
                # If target not in the right half, update right pointer
                elif numbers[mid] > target:
                    right = mid - 1
                # If target found, return index
                else:
                    return mid
            return -1
        for left, num in enumerate(numbers):
            # Start searching for complement from the rest of the input
            right = binary_search(left + 1, len(numbers)-1, target - num)
            if right != -1:
                return [left + 1, right + 1]
```
 
### Binary Search and Two Pointers
 
```Python
class Solution:
    def twoSum(self, numbers: List[int], target: int) -> List[int]:
        n = len(numbers)
        lo, hi = 0, n - 1

        while lo <= hi:
            mi = lo + (hi - lo) // 2

            lower, upper = numbers[lo], numbers[hi]
            pivot = numbers[mi]
            total = lower + upper

            # Check if total is smaller than target
            if total < target:
                # Check if pivot and right boundary is smaller than target, shrink the left
                if pivot + upper < target:
                    lo = mi + 1
                # Otherwise, target is in the left of pivot, slowly shrink the left
                else:
                    lo += 1
            # Check if total is bigger than target
            elif total > target:
                # CHeck if target is in the right of pivot, slowly shrink the right
                if lower + pivot <= target:
                    hi -= 1
                # Otherwise, shrink the right
                else:
                    hi = mi - 1
            else:
                return [lo + 1, hi + 1]

'''
numbers = [1,2,7,9,11,15], target = 9
           | | | |  |  |
           0 1 2 3  4  5

- Step 1:

lo, hi = 0, 5
mi = 0 + (5 - 0) // 2 = 2

lower, upper = 1, 15
pivot = 7
total = 16

total > target:
    lower + pivot <= target:
        lo += 1

- Step 2:

lo, hi = 1, 5
mi = 1 + (5 - 1) // 2 = 3

lower, upper = 2, 15
pivot = 9
total = 17

total > target:
    lower + pivot > target:
        hi = mi - 1

- Step 3:

lo, hi = 1, 2
mi = 1 + (2 - 1) // 2 = 1

lower, upper = 2, 7
pivot = 2
total = 9

return [lo + 1, hi + 1]
'''
```
 
### Two Pointers
 
```Python
 class Solution:
    def twoSum(self, numbers: List[int], target: int) -> List[int]:
        # Two Pointers
        #### Time Complexity: O(N), iterate through the input size N
        #### Space Complexity: O(1), constant memory space for pointers
        left, right = 0, len(numbers) - 1
        while left < right:
            total = numbers[left] + numbers[right]
            if total < target:
                left += 1
            elif total > target:
                right -= 1
            else:
                return [left + 1, right + 1]
```
