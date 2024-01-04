## [2870. Minimum Number of Operations to Make Array Empty](https://leetcode.com/problems/minimum-number-of-operations-to-make-array-empty)

```Tag```: ```Array & String``` ```Hash Map```

#### Difficulty: Medium

You are given a __0-indexed__ array ```nums``` consisting of positive integers.

There are two types of operations that you can apply on the array any number of times:

- Choose __two elements__ with equal values and delete them from the array.
- Choose __three elements__ with equal values and delete them from the array.

Return _the minimum number of operations required to make the array empty_, or _```-1``` if it is not possible_.

![image](https://github.com/quananhle/Python/assets/35042430/af0aa3da-77c5-4c93-9882-22dc14973309)

---

__Example 1:__
```
Input: nums = [2,3,3,2,2,4,2,3,4]
Output: 4
Explanation: We can apply the following operations to make the array empty:
- Apply the first operation on the elements at indices 0 and 3. The resulting array is nums = [3,3,2,4,2,3,4].
- Apply the first operation on the elements at indices 2 and 4. The resulting array is nums = [3,3,4,3,4].
- Apply the second operation on the elements at indices 0, 1, and 3. The resulting array is nums = [4,4].
- Apply the first operation on the elements at indices 0 and 1. The resulting array is nums = [].
It can be shown that we cannot make the array empty in less than 4 operations.
```

__Example 2:__
```
Input: nums = [2,1,2,2,3,3]
Output: -1
Explanation: It is impossible to empty the array.
```

__Constraints:__

- $2 \le nums.length \le 10^5$
- $1 \le nums[i] \le 10^6$

---

### Frequency Counter

__The count of an element is a multiple of 3.__

__Example: 3, 6, 9, 12,...__

```JavaScript
* count = 3
    3 - 3 = 0
    operations required = 1
* count = 6
    6 - 3 - 3  = 0
    operations required = 2
* count = 9
    9 - 3 - 3 - 3  = 0
    operations required = 3
* count = 12
    12 - 3 - 3 - 3 - 3  = 0
    operations required = 4
```

__The count of an element is one more than a multiple of 3.__

__Example: 4, 7, 10, 13,...__

In such instances, we can eliminate two pairs, thereby making the count divisible by 3. Following this adjustment, we can proceed to remove the remaining numbers in triplets.

```JavaScript
* count = 4
    4 - 2 - 2 = 0 -> eliminate two pairs
    operations required = 2
* count = 7
    7 - 2 - 2 = 3 -> eliminate two pairs
    3 - 3 = 0 -> eliminate remaining triplets
    operations required = 3
* count = 10
    10 - 2 - 2 = 6 -> eliminate two pairs
    6 - 3 - 3 = 0 -> eliminate remaining triplets
    operations required = 4
* count = 13
    13 - 2 - 2 = 9 -> eliminate two pairs
    9 - 3 - 3 - 3 = 0 -> eliminate remaining triplets
    operations required = 5
```

__The count of an element is two more than a multiple of 3.__

__Example: 5, 8, 11, 14,...__

In such instances, we can eliminate one pair, thereby making the count divisible by 3. Following this adjustment, we can proceed to remove the remaining numbers in triplets.

```JavaScript
* count = 5
    5 - 2 = 3 -> eliminate one pair
    3 - 3 = 0 -> eliminate remaining triplets
    operations required = 2
* count = 8
    8 - 2 = 6 -> eliminate one pair
    6 - 3 - 3 = 0 -> eliminate remaining triplets
    operations required = 3
* count = 11
    11 - 2 = 9 -> eliminate one pair
    9 - 3 - 3 - 3 = 0 -> eliminate remaining triplets
    operations required = 4
* count = 14
    14 - 2 = 12 -> eliminate one pair
    12 - 3 - 3 - 3 - 3 = 0 -> eliminate remaining triplets
    operations required = 5
```

#### Hash Map

```Python
class Solution:
    def minOperations(self, nums: List[int]) -> int:
        counter = collections.defaultdict(int)
        for num in nums:
            counter[num] = 1 + counter.get(num, 0)
        
        ans = 0
        for num, freq in counter.items():
            if freq < 2:
                return -1
                
            ans += math.ceil(freq / 3)
        
        return ans
```

#### ```collections.Counter```

```Python

```

#### Array

```Python
class Solution:
    def minOperations(self, nums: List[int]) -> int:
        # 1                 --> not possible, return -1
        # 2                 --> 1 operation minimum
        # 3, 6, 9, 12, 15   --> (n // 3) operations 
        # 4, 7, 10, 13, 16  --> 1 + (n - 1) // 3 operations
        # 5, 8, 11, 14, 17  --> 1 + (n - 2) // 3 operations
        frequency = [None] * (max(nums) + 1)
        for num in nums:
            if frequency[num]:
                frequency[num] += 1
            else:
                frequency[num] = 1
        
        ans = 0
        for num, freq in enumerate(frequency):
            if freq:
                if freq < 2:
                    return -1
                
                ans += math.ceil(freq / 3)
        
        return ans
```
