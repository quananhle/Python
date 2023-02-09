## 77. Combinations

```Tag```: ```Backtracking```

#### Difficulty: Medium

Given two integers ```n``` and ```k```, return _all possible combinations of ```k``` numbers chosen from the range ```[1, n]```_.

You may return the answer in any order.

![image](https://user-images.githubusercontent.com/35042430/217675739-5967864c-92e5-4c66-b22c-0122a87a71dc.png)

---

__Example 1:__
```
Input: n = 4, k = 2
Output: [[1,2],[1,3],[1,4],[2,3],[2,4],[3,4]]
Explanation: There are 4 choose 2 = 6 total combinations.
Note that combinations are unordered, i.e., [1,2] and [2,1] are considered to be the same combination.
```

__Example 2:__
```
Input: n = 1, k = 1
Output: [[1]]
Explanation: There is 1 choose 1 = 1 total combination.
```

__Constraints:__

- 1 <= n <= 20
- 1 <= k <= n

---

```Python
class Solution:
    def combine(self, n: int, k: int) -> List[List[int]]:
        res = list()

        def backtrack(start, combinations):
            # Base case: check if the combination is complete
            if len(combinations) == k:
                res.append(combinations[:])
            
            for i in range(start, n + 1):
                # Add i to the current combinations
                combinations.append(i)
                # Move to the next integer in the range
                backtrack(i + 1, combinations)
                # Backtracking
                combinations.pop()

        backtrack(1, [])

        return res
```
