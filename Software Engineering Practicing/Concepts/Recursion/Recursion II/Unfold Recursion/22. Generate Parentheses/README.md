## 22. Generate Parentheses

```Tag```: ```Recursion``` ```Depth-First Search``` ```Backtracking```

#### Difficulty: Medium

Given ```n``` pairs of parentheses, write a function to generate all combinations of well-formed parentheses.

![image](https://user-images.githubusercontent.com/35042430/217887723-0d8d10db-0caa-4a4b-a470-a66bcdb30702.png)

---

__Example 1:__
```
Input: n = 3
Output: ["((()))","(()())","(())()","()(())","()()()"]
```

__Example 2:__
```
Input: n = 1
Output: ["()"]
```

__Constraints:__
```
1 <= n <= 8
```

---

### Backtracking

![image](https://user-images.githubusercontent.com/35042430/217897080-a2ef56df-755e-417b-83b9-d37659a6444d.png)

```Python
class Solution:
    def generateParenthesis(self, n: int) -> List[str]:
        res = list()

        def backtrack(open_bracket, closed_bracket, parentheses):
            if len(parentheses) == n * 2:
                res.append("".join(parentheses))
                return

            if open_bracket < n:
                parentheses.append("(")
                backtrack(open_bracket + 1, closed_bracket, parentheses)
                parentheses.pop()
            
            if closed_bracket < open_bracket:
                parentheses.append(")")
                backtrack(open_bracket, closed_bracket + 1, parentheses)
                parentheses.pop()

        backtrack(0, 0, [])

        return res
```

### Depth-First Search

#### Recursive Approach

For n = 2, the recursion tree will be like this,

![image](https://user-images.githubusercontent.com/35042430/217900413-39b4f66f-81e5-4cf8-a484-1963743dbfc1.png)

```Python
class Solution:
    def generateParenthesis(self, n: int) -> List[str]:
        res = list()

        def dfs(open_bracket, closed_bracket, parentheses):
            if len(parentheses) == 2 * n:
                res.append(parentheses)
                return
            
            if open_bracket < n:
                dfs(open_bracket + 1, closed_bracket, parentheses + "(")
            
            if closed_bracket < open_bracket:
                dfs(open_bracket, closed_bracket + 1, parentheses + ")")

        dfs(0, 0, "")

        return res
```

#### Iterative Approach

```Python
class Solution:
    def generateParenthesis(self, n: int) -> List[str]:
        res = list()

        stack = [(0, 0, "")]

        while stack:
            open_bracket, closed_bracket, parentheses = stack.pop()
            
            if len(parentheses) == n * 2:
                res.append(parentheses)
                
            if open_bracket < n:
                stack.append( (open_bracket + 1, closed_bracket, parentheses + "(") )
            if closed_bracket < open_bracket:
                stack.append( (open_bracket, closed_bracket + 1, parentheses + ")") )

        return res
```
