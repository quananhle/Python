# Recursion

## Principle of Recursion

```Recursion is an approach to solving problems using a function that calls itself as a subroutine.```

The trick is that each time a recursive function calls itself, it reduces the given problem into __subproblems__. The recursion call continues until it reaches a point where the subproblem can be solved without further recursion.

A recursive function should have the following properties so that it does not result in an infinite loop:

  1. A simple __base case__ (or cases) — a terminating scenario that does not use recursion to produce an answer.
  2. A set of rules, also known as __recurrence relation__ that reduces all other cases towards the base case.

---

### Reverse String

Write a function that reverses a string. The input string is given as an array of characters ```s```.

__Example 1:__
```
Input: s = ["h","e","l","l","o"]
Output: ["o","l","l","e","h"]
```

__Example 2:__
```
Input: s = ["H","a","n","n","a","h"]
Output: ["h","a","n","n","a","H"]
```

```Python
class Solution:
    def reverseString(self, s: List[str]) -> None:
        """
        Do not return anything, modify s in-place instead.
        """
        def helper(left, right):
            if left >= right:
                return
            s[left], s[right] = s[right], s[left]
            helper(left+1, right-1)
        
        helper(0, len(s)-1)
```
