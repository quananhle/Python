## [2966. Divide Array Into Arrays With Max Difference](https://leetcode.com/problems/divide-array-into-arrays-with-max-difference)

```Tag```: ```Sorting```

#### Difficulty: Medium

You are given an integer array ```nums``` of size ```n``` and a positive integer ```k```.

Divide the array into one or more arrays of size ```3``` satisfying the following conditions:

- Each element of ```nums``` should be in exactly one array.
- The difference between any two elements in one array is less than or equal to ```k```.

Return _a 2D array containing all the arrays_. If it is impossible to satisfy the conditions, return _an empty array_. And if there are multiple answers, return _any of them_.

---

__Example 1:__
```
Input: nums = [1,3,4,8,7,9,3,5,1], k = 2
Output: [[1,1,3],[3,4,5],[7,8,9]]
Explanation: We can divide the array into the following arrays: [1,1,3], [3,4,5] and [7,8,9].
The difference between any two elements in each array is less than or equal to 2.
Note that the order of elements is not important.
```

__Example 2:__
```
Input: nums = [1,3,3,2,7,3], k = 3
Output: []
Explanation: It is not possible to divide the array satisfying all the conditions.
```

__Constraints:__

- $n == nums.length$
- $1 \le n \le 10^5$
- ```n``` is a multiple of ```3```.
- $1 \le nums[i] \le 10^5$
- $1 \le k \le 10^5$

---

### Sorting

```Python
class Solution:
    def divideArray(self, nums: List[int], k: int) -> List[List[int]]:
        res = list()
        n = len(nums)
        nums.sort()

        for i in range(0, n, 3):
            if nums[i] + k < nums[i + 2]:
                return []
            res.append([nums[i], nums[i + 1], nums[i + 2]])
        
        return res
```