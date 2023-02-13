## 47. Permutations II

```Tag```: ```Backtracking``` ```Counter```

#### Difficulty: Medium

Given a collection of numbers, ```nums```, that might contain duplicates, return _all possible unique permutations in any order_.

![image](https://user-images.githubusercontent.com/35042430/218553835-163f7428-a850-4659-854e-92ceb20f3e43.png)

---

__Example 1:__
```
Input: nums = [1,1,2]
Output:
[[1,1,2],
 [1,2,1],
 [2,1,1]]
 ```
 
__Example 2:__
```
Input: nums = [1,2,3]
Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
```

__Constraints:__

- ```1 <= nums.length <= 8```
- ```-10 <= nums[i] <= 10```

---

### Backtracking

```Python
class Solution:
    def permuteUnique(self, nums: List[int]) -> List[List[int]]:
        res = list()

        def backtrack(curr):
            # Base case
            if curr == len(nums) and not nums in res:
                res.append(nums[:])
                return
            
            for i in range(curr, len(nums)):
                nums[i], nums[curr] = nums[curr], nums[i]
                backtrack(curr + 1)
                nums[i], nums[curr] = nums[curr], nums[i]

        backtrack(0)
        return res
```

```Python
class Solution:
    def permuteUnique(self, nums: List[int]) -> List[List[int]]:
        res = list()

        def backtrack(permutations, counter):
            # Base case
            if len(permutations) == len(nums):
                '''
                res.append(permutations[:])
                '''
                res.append(list(permutations))
                return
            
            for num in counter:
                # To avoid the duplicate permutations 
                if counter[num] > 0:
                    permutations.append(num)
                    # Update the frequency of num
                    counter[num] -= 1

                    # Move on to the next element in nums to add into permutations
                    backtrack(permutations, counter)

                    # Backtrack
                    permutations.pop()
                    counter[num] += 1

        backtrack([], collections.Counter(nums))
        return res
```

