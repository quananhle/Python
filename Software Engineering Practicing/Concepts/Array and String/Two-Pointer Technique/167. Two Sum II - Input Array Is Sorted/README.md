## 167. Two Sum II - Input Array Is Sorted

```Tag```: ```Two Pointer``` ```Hash Table```

#### Difficulty: Medium

Given a __1-indexed__ array of integers ```numbers``` that is already sorted in __non-decreasing order__, find two numbers such that they add up to a specific ```target``` number. Let these two numbers be ```numbers[index1]``` and ```numbers[index2]``` where ```1 <= index1 < index2 <= numbers.length```.

Return _the indices of the two numbers, ```index1``` and ```index2```, __added by one__ as an integer array ```[index1, index2]``` of length 2_.

The tests are generated such that there is __exactly one solution__. You may not use the same element twice.

Your solution must use only __constant extra space__.

![image](https://user-images.githubusercontent.com/35042430/209867460-fea452f2-d20c-4c79-9c6a-b90722630225.png)

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
```
2 <= numbers.length <= 3 * 104
-1000 <= numbers[i] <= 1000
numbers is sorted in non-decreasing order.
-1000 <= target <= 1000
The tests are generated such that there is exactly one solution.
```

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
 
### Two Pointers
 
```Python
 
 
 ```
