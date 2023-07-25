## [216. Combination Sum III](https://leetcode.com/problems/combination-sum-iii)

```Tag```: ```Backtracking```

#### Difficulty: Medium

Find all valid combinations of ```k``` numbers that sum up to ```n``` such that the following conditions are true:

- Only numbers ```1``` through ```9``` are used.
- Each number is used at most once.

Return _a list of all possible valid combinations_. The list must not contain the same combination twice, and the combinations may be returned in any order.

![image](https://github.com/quananhle/Python/assets/35042430/d96d9cfa-3516-43c5-93ba-48b401498399)

---

__Example 1:__
```
Input: k = 3, n = 7
Output: [[1,2,4]]
Explanation:
1 + 2 + 4 = 7
There are no other valid combinations.
```

__Example 2:__
```
Input: k = 3, n = 9
Output: [[1,2,6],[1,3,5],[2,3,4]]
Explanation:
1 + 2 + 6 = 9
1 + 3 + 5 = 9
2 + 3 + 4 = 9
There are no other valid combinations.
```

__Example 3:__
```
Input: k = 4, n = 1
Output: []
Explanation: There are no valid combinations.
Using 4 different numbers in the range [1,9], the smallest sum we can get is 1+2+3+4 = 10 and since 10 > 1, there are no valid combination.
```

__Constraints:__

- $2 \le k \le 9$
- $1 \le n \le 60$

---

### Backtracking

![image](https://leetcode.com/problems/combination-sum-iii/Figures/216/216_backtrack.png)

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(\frac{9! \cdot K}{(9-K)!})$
![image](https://github.com/quananhle/Python/assets/35042430/46a8bd41-bfa6-4b17-9468-4ef9609bf059)
- __Space Complexity__: $\mathcal{O}(K)$
![image](https://github.com/quananhle/Python/assets/35042430/e8ab8cb2-3b20-4240-8922-90ba8da3744d)

```Python
class Solution:
    def combinationSum3(self, k: int, n: int) -> List[List[int]]:
        res = list()

        def backtrack(curr, remaining, combination):
            # Base cases:
            # Combination has k numbers that sum up to n
            if len(combination) == k and remaining == 0:
                res.append(combination[:])
                return
            # Combination has k numbers but not sum up to n
            elif len(combination) == k and remaining != 0:
                return
            # Combination has fewer than k numbers
            else:
                # Iterate through the reduced list of candidates
                for num in range(curr, 10):
                    combination.append(num)

                    # Recursive search for next candidate, update remaining less the candidate num
                    backtrack(num + 1, remaining - num, combination)
                
                    # Backtracking
                    combination.pop()
        
        backtrack(1, n, [])
        return res
```
