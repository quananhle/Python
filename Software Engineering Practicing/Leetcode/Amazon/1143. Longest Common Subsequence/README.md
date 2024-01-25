## [1143. Longest Common Subsequence](https://leetcode.com/problems/longest-common-subsequence)

```Tag:``` [```Dynamic Programming```](https://github.com/quananhle/Python/blob/main/Software%20Engineering%20Practicing/Concepts/Dynamic%20Programming/README.md) ```Recursion```

#### Difficulty: Medium

Given two strings ```text1``` and ```text2```, return _the length of their __longest common subsequence___. If there is no __common subsequence__, return ```0```.

A __subsequence__ of a string is a new string generated from the original string with some characters (can be none) deleted without changing the relative order of the remaining characters.

- For example, ```"ace"``` is a subsequence of ```"abcde"```.

A __common subsequence__ of two strings is a subsequence that is common to both strings.

![image](https://github.com/quananhle/Python/assets/35042430/bd70f2ca-1c68-4293-84c3-2513b8468813)

---

__Example 1:__

```
Input: text1 = "abcde", text2 = "ace" 
Output: 3  
Explanation: The longest common subsequence is "ace" and its length is 3.
```

__Example 2:__

```
Input: text1 = "abc", text2 = "abc"
Output: 3
Explanation: The longest common subsequence is "abc" and its length is 3.
```

__Example 3:__

```
Input: text1 = "abc", text2 = "def"
Output: 0
Explanation: There is no such common subsequence, so the result is 0.
```

__Constraints:__

- $1 \le text1.length, text2.length \le 1000$
- ```text1``` and ```text2``` consist of only lowercase English characters.

---

### Brute Force

#### Recursion (Time Limit Exceeded)

```Python
class Solution:
    def longestCommonSubsequence(self, text1: str, text2: str) -> int:
        m, n = len(text1), len(text2)

        def LCS(p, q):
            # Base case
            if p == m or q == n:
                return 0
            
            if text1[p] == text2[q]:
                return 1 + LCS(p + 1, q + 1)
            
            return max(LCS(p + 1, q), LCS(p, q + 1))

        return LCS(0, 0)
```

---

### The Framework

__Algorithm__

From what we've explored in the intuition section, we can create a top-down recursive algorithm that looks like this in pseudocode:

```JavaScript
define function LCS(text1, text2):
    // If either string is empty there, can be no common subsequence.
    if length of text1 or text2 is 0:
        return 0

    letter1 = the first letter in text1
    firstOccurence = first position of letter1 in text2

    // The case where the line *is not* part of the optimal solution
    case1 = LCS(text1.substring(1), text2)

    // The case where the line *is* part of the optimal solution
    case2 = 1 + LCS(text1.substring(1), text2.substring(firstOccurence + 1))
   
    return maximum of case1 and case2
```

You might notice from the pseudocode that there's one case we haven't handled: if letter1 isn't part of text2, then we can't solve the first subproblem. However, in this case, we can simply ignore the first subproblem as the line doesn't exist. This leaves us with:

```JavaScript
define function LCS(text1, text2):
    // If either string is empty there can be no common subsequence
    if length of text1 or text2 is 0:
        return 0

    letter1 = the first letter in text1

    // The case where the line *is not* part of the optimal solution
    case1 = LCS(text1.substring(1), text2)

    case2 = 0
    if letter1 is in text2:
        firstOccurence = first position of letter1 in text2
        // The case where the line *is* part of the optimal solution
        case2 = 1 + LCS(text1.substring(1), text2.substring(firstOccurence + 1))

    return maximum of case1 and case2
```

#### Top-Down Dynamic Programming (Recursive)

```Python
class Solution:
    def longestCommonSubsequence(self, text1: str, text2: str) -> int:
        m, n = len(text1), len(text2)
        memo = collections.defaultdict(int)

        def dp(p1, p2):
            # Base case
            if p1 == m or p2 == n:
                return 0

            if (p1, p2) in memo:
                return memo[(p1, p2)]

            # Recurrence relation: matched, add to counter and move both pointers on. Not matched, move either pointer on.

            # Matched
            if text1[p1] == text2[p2]:
                lcs = dp(p1 + 1, p2 + 1) + 1
            # Not matched
            else:
                lcs = max(dp(p1 + 1, p2), dp(p1, p2 + 1))

            memo[(p1, p2)] = lcs

            return lcs

        return dp(0, 0)
```

```Python
class Solution:
    def longestCommonSubsequence(self, text1: str, text2: str) -> int:
        m, n = len(text1), len(text2)

        @functools.lru_cache(maxsize=None)
        def dp(p1, p2):
            # Base case
            if p1 == m or p2 == n:
                return 0

            # Recurrence relation: matched, add to counter and move both pointers on. Not matched, move either pointer on.
            matched = not_matched = 0

            # Matched
            if text1[p1] == text2[p2]:
                matched = dp(p1 + 1, p2 + 1) + 1
            # Not matched
            else:
                not_matched = max(dp(p1 + 1, p2), dp(p1, p2 + 1))
            
            return max(matched, not_matched)
        
        return dp(0, 0)
```

```Python
class Solution:
    def longestCommonSubsequence(self, text1: str, text2: str) -> int:
        m, n = len(text1), len(text2)

        @lru_cache(maxsize=None)
        def dp(p1, p2):
            # Base case
            if p1 == m or p2 == n:
                return 0

            # Recurrence relation: matched, add to counter and move both pointers on. Not matched, move either pointer on.

            # Matched
            if text1[p1] == text2[p2]:
                return dp(p1 + 1, p2 + 1) + 1

            # Not matched
            return max(dp(p1 + 1, p2), dp(p1, p2 + 1))
                    
        return dp(0, 0)
```

```Python
class Solution(object):
    def longestCommonSubsequence(self, text1, text2):
        """
        :type text1: str
        :type text2: str
        :rtype: int
        """
        # Top-Down Recursive
        #### Time Complexity: 0(M * N), traverse through the length of 2 input lists
        #### Space Complexity: O(M * N), recursively keep up to the size until base cases reached
        @lru_cache(maxsize=None)
        def dp(p1, p2):
            # Base cases:
            # Emtpy strings
            if p1 == len(text1) or p2 == len(text2):
                return 0
            # Recursive case 1
            # If matching character found
            if text1[p1] == text2[p2]:
                # Move to next character in both strings and add 1 to the count
                return 1 + dp(p1 + 1, p2 + 1)
            # Recursive case 2
            # If no matching character found
            else:
                # Find next matching characters in 2 possible cases and keep the maximum count
                return max(dp(p1 + 1, p2), dp(p1, p2 + 1))
        return dp(0, 0)
```

### Bottom-Up Dynamic Programming (Iterative)

![image](https://user-images.githubusercontent.com/35042430/208011171-794c5f80-5eb6-45ca-8965-6fdca7342480.png)

![image](https://user-images.githubusercontent.com/35042430/208011232-3b018ed9-1771-4254-b359-670dc95126cd.png)

![image](https://user-images.githubusercontent.com/35042430/208011263-0295a76d-c516-4a97-bbee-d5119743b3e1.png)

![image](https://user-images.githubusercontent.com/35042430/208011302-7d743aee-1b29-4bbb-af51-4b41225c2314.png)

#### 2D Tabulation

```Python
class Solution:
    def longestCommonSubsequence(self, text1: str, text2: str) -> int:
        m, n = len(text1), len(text2)
        dp = [[0] * (n + 1) for _ in range(m + 1)]

        for col in range(n - 1, -1, -1):
            for row in range(m - 1, -1, -1):
                if text1[row] == text2[col]:
                    dp[row][col] = 1 + dp[row + 1][col + 1]
                else:
                    dp[row][col] = max(dp[row + 1][col], dp[row][col + 1])
                
        return dp[0][0]
```

```Python
class Solution:
    def longestCommonSubsequence(self, text1: str, text2: str) -> int:
        lcs = collections.defaultdict(int)
        m, n = len(text1), len(text2)

        for i in range(m - 1, -1, -1):
            for j in range(n - 1, -1, -1):
                if text1[i] == text2[j]:
                    lcs[(i, j)] = 1 + lcs[(i + 1, j + 1)]
                else:
                    lcs[(i, j)] = max(lcs[(i + 1, j)], lcs[(i, j + 1)])

        return lcs[(0, 0)]
```

```Python
class Solution(object):
    def longestCommonSubsequence(self, text1, text2):
        """
        :type text1: str
        :type text2: str
        :rtype: int
        """
        # Bottom-Up Dynamic Programming with 2D Tabulation
        #### Time Complexity: 0(M * N), traverse through the length of 2 input lists
        #### Space Complexity: O(M * N), recursively keep up to the size until base cases reached
        '''
        # Make a grid of 0's with len(text2) + 1 columns and len(text1) + 1 rows.        
        memo = [[0] * (len(text2)+1) for _ in range(len(text1)+1)]
        # Iterate up each column, starting from the last one.
        for row in reversed(range(len(text1))):
            for col in reversed(range(len(text2))):
                # If the corresponding characters for this cell are the same
                if text1[row] == text2[col]:
                    memo[row][col] = 1 + memo[row+1][col+1]
                else:
                    # Otherwise they must be different
                    memo[row][col] = max(memo[row+1][col], memo[row][col+1])
        # The original problem's answer is in dp_grid[0][0]. Return it.
        return memo[0][0]
        '''
        memo = [[0] * (len(text2)+1) for _ in range(len(text1)+1)]
        for col in reversed(range(len(text2))):
            for row in reversed(range(len(text1))):
                if text2[col] == text1[row]:
                    memo[row][col] = 1 + memo[row+1][col+1]
                else:
                    memo[row][col] = max(memo[row+1][col], memo[row][col+1])
        return memo[0][0]
```

#### 1D Tabulation

```Python
class Solution:
    def longestCommonSubsequence(self, text1: str, text2: str) -> int:
        if len(text2) < len(text1):
            text1, text2 = text2, text1

        m, n = len(text1), len(text2)

        prev = [0] * (m + 1)

        for col in range(n - 1, -1, -1):
            curr = [0] * (m + 1)
            for row in range(m - 1, -1, -1):
                if text1[row] == text2[col]:
                    curr[row] = 1 + prev[row + 1]
                else:
                    curr[row] = max(prev[row], curr[row + 1])
            prev = curr
                
        return prev[0]
```

```Python
class Solution(object):
    def longestCommonSubsequence(self, text1, text2):
        """
        :type text1: str
        :type text2: str
        :rtype: int
        """
        # Bottom-Up Dynamic Programming with 1D Tabulation
        #### Time Complexity: 0(M * N), traverse through the length of 2 input lists
        #### Space Complexity: O(min(M, N)), recursively keep up to the size of shorter string
        """
        # If text1 doesn't reference the shortest string, swap them.
        if len(text1) < len(text2):
            text1, text2 = text2, text1
        previous = [0] * (len(text1) + 1)
        for col in reversed(range(len(text2))):
            current = [0] * (len(text1) + 1)
            for row in reversed(range(len(text1))):
                if text2[col] == text1[row]:
                    current[row] = 1 + previous[row+1]
                else:
                    current[row] = max(previous[row], current[row+1])
            previous = current
        return previous[0]
        """
        if len(text1) < len(text2):
            text1, text2 = text2, text1
        previous = [0] * (len(text1) + 1)
        for row in reversed(range(len(text1))):
            current = [0] * (len(text2) + 1)
            for col in reversed(range(len(text2))):
                if text2[col] == text1[row]:
                    current[col] = 1 + previous[col+1]
                else:
                    current[col] = max(previous[col], current[col+1])
            previous = current
        return previous[0]   
```
