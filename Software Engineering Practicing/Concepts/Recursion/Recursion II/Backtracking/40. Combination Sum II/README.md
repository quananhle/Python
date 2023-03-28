## [40. Combination Sum II](https://leetcode.com/problems/combination-sum-ii/)

```Tag```: ```Backtracking```

#### Difficulty: Medium

Given a collection of candidate numbers (```candidates```) and a target number (```target```), find all unique combinations in ```candidates``` where the candidate numbers sum to ```target```.

Each number in ```candidates``` may only be used once in the combination.

Note: The solution set must not contain duplicate combinations.

![image](https://user-images.githubusercontent.com/35042430/218571187-87c66f30-da2f-4895-9451-862808d31c92.png)

---

__Example 1:__
```
Input: candidates = [10,1,2,7,6,1,5], target = 8
Output: 
[
[1,1,6],
[1,2,5],
[1,7],
[2,6]
]
```

__Example 2:__
```
Input: candidates = [2,5,2,1,2], target = 5
Output: 
[
[1,2,2],
[5]
]
```

__Constraints:__

- ```1 <= candidates.length <= 100```
- ```1 <= candidates[i] <= 50```
- ```1 <= target <= 30```

---

### Backtracking

#### Sorting

```Python
class Solution:
    def combinationSum2(self, candidates: List[int], target: int) -> List[List[int]]:
        # Time Limit Exceeded
        res = list()
        candidates.sort()

        def backtrack(combination, remaining, counter, curr):
            # Base case
            if remaining == 0 and not combination in res:
                res.append(combination[:])
                return
            elif remaining < 0:
                return
  
            for i in range(curr, len(candidates)):
                if counter[candidates[i]] > 0:
                    combination.append(candidates[i])
                    counter[candidates[i]] -= 1

                    backtrack(combination, remaining - candidates[i], counter, i + 1)

                    combination.pop()
                    counter[candidates[i]] += 1
            
        backtrack([], target, collections.Counter(candidates), 0)
        return res
```

__Time Complexity__: O(2<sup>N</sup>), The number of combination for an array of size ```N``` would be 2<sup>N</sup>, each number is either included or excluded in a combination

__Space Complexity__: O(N), size of combinations, counter, and recursion stack.

```Python
class Solution:
    def combinationSum2(self, candidates: List[int], target: int) -> List[List[int]]:
        res = list()
        candidates.sort()

        def backtrack(combination, remaining, curr):
            # Base case
            if remaining == 0:
                res.append(combination[:])
                return
            elif remaining < 0:
                return

            for i in range(curr, len(candidates)):
                # Check combination is empty and two elements standing next to each other in a sorted array are the same
                if i > curr and candidates[i] == candidates[i - 1]:
                    continue
                combination.append(candidates[i])
                # Move on to the next element
                backtrack(combination, remaining - candidates[i], i + 1)
                # Backtracking
                combination.pop()

            
        backtrack([], target, 0)
        return res
```

### Counter

__Time Complexity__: O(2<sup>N</sup>), The number of combination for an array of size ```N``` would be 2<sup>N</sup>, each number is either included or excluded in a combination

__Space Complexity__: O(N), size of combinations, counter, and recursion stack.

```Python
class Solution:
    def combinationSum2(self, candidates: List[int], target: int) -> List[List[int]]:
        res = list()

        def backtrack(combination, remaining, counter, curr):
            # Base case
            if remaining == 0:
                res.append(combination[:])
                return
            elif remaining < 0:
                return

            for next in range(curr, len(counter)):
                candidate, frequency = counter[next]
                if frequency > 0:
                    combination.append(candidate)
                    counter[next] = (candidate, frequency - 1)

                    backtrack(combination, remaining - candidate, counter, next)

                    combination.pop()
                    counter[next] = (candidate, frequency)     


        counter = collections.Counter(candidates)
        counter = [(key, counter[key]) for key in counter]

        backtrack([], target, counter, 0)
        return res
```



