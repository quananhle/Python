## 131. Palindrome Partitioning

```Tag```: ```Backtracking```

#### Difficulty: Medium

Given a string ```s```, partition s such that every __substring__ of the partition is a __palindrome__. Return _all possible palindrome partitioning of ```s```_.

![image](https://user-images.githubusercontent.com/35042430/214000686-2c886141-dfe8-441b-8a51-bdf66cdc0668.png)

---

__Example 1:__
```
Input: s = "aab"
Output: [["a","a","b"],["aa","b"]]
```

__Example 2:__
```
Input: s = "a"
Output: [["a"]]
```

__Constraints:__
```
1 <= s.length <= 16
s contains only lowercase English letters.
```

---

### Depth-First Search

#### Time Complexity: O(N * 2<sup>N</sup>), N is the size of input string, and while traversing the input, creating up to 2<sup>N</sup> possible substring
#### Space Complexity: O(N), ouput rray has up to size N when all substrings are palindrome


![image](https://leetcode.com/problems/palindrome-partitioning/solutions/857510/Figures/131/time_complexity.png)

```Python
class Solution:
    def partition(self, s: str) -> List[List[str]]:
        # Depth-First Search
        res = list()

        def is_palindrome(s, low, high):
            while low < high:
                if s[low] != s[high]:
                    return False
                low += 1
                high -= 1
            return True

        def dfs(left, stack):
            if left >= len(s):
                res.append(list(stack))
            for right in range(left, len(s)):
                # Add current substring into the current list
                if is_palindrome(s, left, right):
                    stack.append(s[left : right+1])
                    dfs(right + 1, stack)
                    # Backtrack and remove the current substring from the current list
                    stack.pop()

        dfs(0, list())
        return res
```

### Backtracking

```Python
class Solution:
    def partition(self, s: str) -> List[List[str]]:
        # Backtracking
        partitions = set()
        
        def backtrack(s, combo, partitions):
            tmp = list(combo)
            if is_palindrome(s):
                if not tuple(tmp + [s]) in partitions:
                    partitions.add(tuple(tmp + [s]))
            for i in range(1, len(s)):
                if is_palindrome(s[:i]):
                    backtrack(s[i:], tuple(tmp + [s[:i]]), partitions)

        def is_palindrome(s):
            left, right = 0, len(s) - 1
            while left <= right:
                if s[left] != s[right]:
                    return False
                left += 1
                right -= 1
            return True

        backtrack(s, tuple(), partitions)
        res = list()
        for partition in partitions:
            res.append(list(partition))
        return res
```

```Python
class Solution:
    def partition(self, s: str) -> List[List[str]]:
        # Backtracking
        if not s:
            return [[]]
        res = list()
        for i in range(1, len(s)+1):
            if s[:i] == s[:i][::-1]:
                for sub in self.partition(s[i:]):
                    res.append([s[:i]] + sub)
        return res
```
