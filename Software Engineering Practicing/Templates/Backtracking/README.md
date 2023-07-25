## Backtracking

### [39. Combination Sum](https://github.com/quananhle/Python/tree/a6aacb2f6379f9effd90e43b7617408b63c67263/Software%20Engineering%20Practicing/Concepts/Recursion/Recursion%20II/Backtracking/39.%20Combination%20Sum)

```
Example 1:

Input: candidates = [2,3,6,7], target = 7
Output: [[2,2,3],[7]]
Explanation:
2 and 3 are candidates, and 2 + 2 + 3 = 7. Note that 2 can be used multiple times.
7 is a candidate, and 7 = 7.
These are the only two combinations.
```

```Python
class Solution:
    def combinationSum(self, candidates: List[int], target: int) -> List[List[int]]:
        res = list()
        n = len(candidates)

        def backtrack(curr, combination, remaining):
            # 1. Target not met: keep looking at the current candidate
            # 2. Target met: add the valid combination into the final output
            # 3. Target exceeded: wrong path, invalid combination, backtrack

            if remaining == 0:
                res.append(combination[:])
                return
            elif curr >= n or remaining < 0:
                return
            else:
                for i in range(curr, n):
                    # Add a candidate into the current combination
                    combination.append(candidates[i])
                    # Stay in the current candidate until base case reached
                    backtrack(i, combination, remaining - candidates[i])
                    # Backtracking
                    combination.pop()

        backtrack(0, list(), target)

        return res
```

### [40. Combination Sum II](https://github.com/quananhle/Python/tree/9be61514143afebc507bb297ec59680010df8087/Software%20Engineering%20Practicing/Concepts/Recursion/Recursion%20II/Backtracking/40.%20Combination%20Sum%20II)

```
Example 1:

Input: candidates = [10,1,2,7,6,1,5], target = 8
Output: [[1,1,6], [1,2,5], [1,7], [2,6]]
```

```Python
class Solution:
    def combinationSum2(self, candidates: List[int], target: int) -> List[List[int]]:
        candidates.sort()
        res = list()
        n = len(candidates)

        def backtrack(curr, combination, remaining):
            # 1. Target not met: remaining > 0 => keep looking for the right candidate
            # 2. Target met: remaining == 0 => record the combination into the final output
            # 3. Target exceeded: remaining < 0 => wrong path, backtrack

            if remaining == 0:
                res.append(combination[:])
                return
            elif curr >= n or remaining < 0:
                return
            else:
                for next in range(curr, n):
                    #  Check the next element to avoid same element using twice in a combination
                    if curr < next and candidates[next] == candidates[next - 1]:
                        continue

                    # Pick the candidate and check if it is a valid candidate
                    candidate = candidates[next]
                    '''
                    if remaining - candidate >= 0:
                        combination.append(candidate)
                    # Otherwise, invalid candidate, break
                    else:
                        break
                    '''
                    if remaining - candidate < 0:
                        break
                    
                    combination.append(candidate)
                    # Jump to the next element and update remaining
                    backtrack(next + 1, combination, remaining - candidate)
                    # Backtracking
                    combination.pop()

        backtrack(0, list(), target)
        
        return res
```

### [216. Combination Sum III](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Leetcode/Microsoft/216.%20Combination%20Sum%20III)

```
Example 1:

Input: candidates = [10,1,2,7,6,1,5], target = 8
Output: [[1,1,6], [1,2,5], [1,7], [2,6]]
```

```Python
class Solution:
    def combinationSum2(self, candidates: List[int], target: int) -> List[List[int]]:
        candidates.sort()
        res = list()
        n = len(candidates)

        def backtrack(curr, combination, remaining):
            # 1. Target not met: remaining > 0 => keep looking for the right candidate
            # 2. Target met: remaining == 0 => record the combination into the final output
            # 3. Target exceeded: remaining < 0 => wrong path, backtrack

            if remaining == 0:
                res.append(combination[:])
                return
            elif curr >= n or remaining < 0:
                return
            else:
                for next in range(curr, n):
                    #  Check the next element to avoid same element using twice in a combination
                    if curr < next and candidates[next] == candidates[next - 1]:
                        continue

                    # Pick the candidate and check if it is a valid candidate
                    candidate = candidates[next]
                    '''
                    if remaining - candidate >= 0:
                        combination.append(candidate)
                    # Otherwise, invalid candidate, break
                    else:
                        break
                    '''
                    if remaining - candidate < 0:
                        break
                    
                    combination.append(candidate)
                    # Jump to the next element and update remaining
                    backtrack(next + 1, combination, remaining - candidate)
                    # Backtracking
                    combination.pop()

        backtrack(0, list(), target)
        
        return res
```
