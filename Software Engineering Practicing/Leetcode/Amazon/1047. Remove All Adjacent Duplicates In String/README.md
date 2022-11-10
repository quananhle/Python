## 1047. Remove All Adjacent Duplicates In String

#### Difficulty: Easy

```
You are given a string s consisting of lowercase English letters. A duplicate removal consists of choosing two adjacent and equal letters and removing them.

We repeatedly make duplicate removals on s until we no longer can.

Return the final string after all such duplicate removals have been made. It can be proven that the answer is unique.
```

#### Example 1:
```
Input: s = "abbaca"
Output: "ca"
Explanation: 
For example, in "abbaca" we could remove "bb" since the letters are adjacent and equal, and this is the only possible move.  The result of this move is that the string is "aaca", of which only "aa" is possible, so the final string is "ca".
```

#### Example 2:
```
Input: s = "azxxzy"
Output: "ay"
```

#### Constraints:
```
1 <= s.length <= 105
s consists of lowercase English letters.
```

```{Python}
class Solution(object):
    def removeDuplicates(self, s):
        """
        :type s: str
        :rtype: str
        """
        # Replace
        """
        while True:
            curr = len(s)
            for ch in string.ascii_lowercase:
                s = s.replace(2*ch, '')
            if curr == len(s):
                return s
        # Time complexity: O(26 * M), nested loop for every N-2, loop through 26 possible combinations in ascii
        # Space complexity: O(1), no extra space required
        """
        # Stack
        """
        stack = []
        for i in range(len(s)):
            if stack and stack[-1] == s[i]:
                stack.pop()
            else:
                stack.append(s[i])
        return ''.join(stack)
        # Time complexity: O(N), loop through the input list
        # Space complexity: O(N - D), where D is the total length of all duplicates      
        """
```
