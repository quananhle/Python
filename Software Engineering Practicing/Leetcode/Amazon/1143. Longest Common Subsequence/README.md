## 1143. Longest Common Subsequence

#### Difficulty: Medium

```Tag:``` [```Dynamic Programming```](https://github.com/quananhle/Python/blob/main/Software%20Engineering%20Practicing/Concepts/Dynamic%20Programming/README.md)

Given two strings ```text1``` and ```text2```, return _the length of their __longest common subsequence___. If there is no __common subsequence__, return ```0```.

A __subsequence__ of a string is a new string generated from the original string with some characters (can be none) deleted without changing the relative order of the remaining characters.

- For example, ```"ace"``` is a subsequence of ```"abcde"```.

A __common subsequence__ of two strings is a subsequence that is common to both strings.

![image](https://user-images.githubusercontent.com/35042430/208002321-3291acc0-dfa9-4f85-9298-bf4432120093.png)

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

```
1 <= text1.length, text2.length <= 1000
text1 and text2 consist of only lowercase English characters.
```

---

#### Top-Down Recursive

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

### Bottom-Up Dynamic Programming with 2D Tabulation

![image](https://user-images.githubusercontent.com/35042430/208011171-794c5f80-5eb6-45ca-8965-6fdca7342480.png)

![image](https://user-images.githubusercontent.com/35042430/208011232-3b018ed9-1771-4254-b359-670dc95126cd.png)

![image](https://user-images.githubusercontent.com/35042430/208011263-0295a76d-c516-4a97-bbee-d5119743b3e1.png)

![image](https://user-images.githubusercontent.com/35042430/208011302-7d743aee-1b29-4bbb-af51-4b41225c2314.png)

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

### Bottom-Up Dynamic Programming with 1D Tabulation

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
