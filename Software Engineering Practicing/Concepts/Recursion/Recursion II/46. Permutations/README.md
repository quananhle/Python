## 46. Permutations

```Tag```: ```Backtracking```

#### Difficulty: Medium

Given an array ```nums``` of distinct integers, return _all the possible permutations_. You can return the answer in any order.

![image](https://user-images.githubusercontent.com/35042430/218036882-4dd5a1c7-cee9-4717-89b2-1b8501a6eb77.png)

---

__Example 1:__
```
Input: nums = [1,2,3]
Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
```

__Example 2:__
```
Input: nums = [0,1]
Output: [[0,1],[1,0]]
```

__Example 3:__
```
Input: nums = [1]
Output: [[1]]
```

__Constraints:__

- ```1 <= nums.length <= 6```
- ```-10 <= nums[i] <= 10```
- All the integers of nums are unique.

---

### Backtracking

![image](https://user-images.githubusercontent.com/35042430/218038353-82608c41-73d5-43f3-934f-1a4c2c40bfd1.png)

#### Algorithm

1. If the first integer to consider has index ```n``` that means that the current permutation is done.
2. Iterate over the integers from index ```first``` to index ```n - 1```.
3. Place i-th integer first in the permutation, i.e. ```swap(nums[first], nums[i])```.
4. Proceed to create all permutations which starts from i-th integer : ```backtrack(first + 1)```.
5. Now backtrack, i.e. ```swap(nums[first], nums[i])``` back.

```Python
class Solution:
    def permute(self, nums: List[int]) -> List[List[int]]:
        res = list()
        n = len(nums)

        def backtrack(start):
            # Base case
            # Check if all possible permutations have been computed
            if start == n:
                res.append(nums[:])
                return

            for i in range(start, n):
                nums[start], nums[i] = nums[i], nums[start]

                # Move on to the next integer in the permutation
                backtrack(start + 1)

                # Backtrack
                nums[start], nums[i] = nums[i], nums[start]

        backtrack(0)

        return res
```
