## [784. Letter Case Permutation](https://leetcode.com/problems/letter-case-permutation)

```Tag```: ```Backtracking``` ```Recursion``` ```Bitwise Manipulation```

#### Difficulty: Medium

Given a string ```s```, you can transform every letter individually to be lowercase or uppercase to create another string.

Return _a list of all possible strings we could create_. Return the output __in any order__.

![image](https://user-images.githubusercontent.com/35042430/234120808-fb6f3e3c-f7f7-405f-aea2-57f737e2b556.png)

---

__Example 1:__
```
Input: s = "a1b2"
Output: ["a1b2","a1B2","A1b2","A1B2"]
```

__Example 2:__
```
Input: s = "3z4"
Output: ["3z4","3Z4"]
```

__Constraints:__

- ```1 <= s.length <= 12```
- ```s``` consists of lowercase English letters, uppercase English letters, and digits.

---

### Brute Force

```Python
class Solution:
    def letterCasePermutation(self, s: str) -> List[str]:
        res = [[]]

        for c in s:
            n = len(res)
            if c.isalpha():
                for i in range(n):
                    res.append(res[i][:])
                    res[i].append(c.lower())
                    res[n+i].append(c.upper())
            else:
                for i in range(n):
                    res[i].append(c)

        return map("".join, res)
```

### ✅ Backtracking

```Python
class Solution:
    def letterCasePermutation(self, s: str) -> List[str]:
        res = list()
        n = len(s)
        s = s.lower()

        def backtrack(curr, combination):
            # Base case
            if curr == n:
                res.append("".join(combination))
                return
            
            if s[curr].isdigit():
                combination.append(s[curr])
                # Recursion
                backtrack(curr + 1, combination)
                # Backtracking
                combination.pop()
            else:
                formats = [s[curr], s[curr].upper()]
                for letter in formats:
                    combination.append(letter)
                    # Recursion
                    backtrack(curr + 1, combination)
                    # Backtracking
                    combination.pop()

        backtrack(0, [])
        return res
```

### Recursion

```Python
class Solution:
    def letterCasePermutation(self, s: str) -> List[str]:
        res = []
        n = len(s)

        def backtrack(start, combination):
            if len(combination) == n:
                res.append(combination[:])
                return

            for curr in range(start, n):
                if s[curr].isdigit():
                    backtrack(curr + 1, combination + s[curr])
                else:
                    lower_subset = combination + s[curr].lower()
                    backtrack(curr + 1, lower_subset)
                    upper_subset = combination + s[curr].upper()
                    backtrack(curr + 1, upper_subset)

        backtrack(0, "")
        return res
```

### Bitwise Manipulation

```Python
class Solution:
    def letterCasePermutation(self, s: str) -> List[str]:
        B = sum(letter.isalpha() for letter in s)
        res = list()

        for bits in range(1 << B):
            bit = 0
            combination = list()
            for letter in s:
                if letter.isalpha():
                    if (bits >> bit) & 1:
                        combination.append(letter.lower())
                    else:
                        combination.append(letter.upper())
                    bit += 1
                else:
                    combination.append(letter)
            
            res.append("".join(combination))
        
        return res
```

### Built-in Itertool()

```Python
class Solution:
    def letterCasePermutation(self, s: str) -> List[str]:
        f = lambda x: (x.lower(), x.upper()) if x.isalpha() else x
        return map("".join, itertools.product(*map(f, s)))
```
