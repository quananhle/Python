## 491. Non-decreasing Subsequences

```Tag```: ```Backtracking``` ```Hash Table```

#### Difficulty: Medium

Given an integer array ```nums```, return _all the different possible non-decreasing subsequences of the given array with at least two elements_. You may return the answer in __any order__.

![image](https://user-images.githubusercontent.com/35042430/213615961-a49f0a6b-2a9c-40ef-ac71-091f309be479.png)

---

__Example 1:__
```
Input: nums = [4,6,7,7]
Output: [[4,6],[4,6,7],[4,6,7,7],[4,7],[4,7,7],[6,7],[6,7,7],[7,7]]
```

__Example 2:__
```
Input: nums = [4,4,3,2,1]
Output: [[4,4]]
```

__Constraints:__
```
1 <= nums.length <= 15
-100 <= nums[i] <= 100
```

---

Whenever you have a problem where you need to check the __subsequences/combinations/permutations__ of some group of __letters/numbers__, the first thought you should have is ```backtracking```. ```Backtracking``` algorithms can often keep the space complexity __linear__ with the input size.

### Backtracking

```Python
class Solution:
    def findSubsequences(self, nums: List[int]) -> List[List[int]]:
        res = set()
        subsequence = list()
        def backtracking(i):
            # Check if subsequence has more than 1 element, add to the final answer
            if len(subsequence) > 1:
                res.add(tuple(subsequence))
            # Check if at the last index to avoid out of bound
            if i == len(nums):
                return
            # Check if the subsequence is empty or the last element in subsequence is smaller or equal the current number in the array
            if not subsequence or subsequence[-1] <= nums[i]:
                # Append the element to the subsequence
                subsequence.append(nums[i])
                # Check the next element in the array
                backtracking(i + 1)
                # Pop out the last index of the subsequence
                subsequence.pop()
            # If current index is not non-decreasing, increment the index to check the next num
            backtracking(i + 1)
        backtracking(0)
        return res
```

```Python
class Solution:
    def findSubsequences(self, nums: List[int]) -> List[List[int]]:
        res = set()
        def backtracking(i, subsequence):
            if len(subsequence) > 1:
                res.add(tuple(subsequence))
            if i == len(nums):
                return
            if not subsequence or subsequence[-1] <= nums[i]:
                backtracking(i+1, subsequence + [nums[i]])
            backtracking(i+1, subsequence)
        backtracking(0, [])
        return res
```
