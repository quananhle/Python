## 91. Decode Ways

```Tag```: ```Dynamic Programming```

#### Difficulty: Medium

A message containing letters from ```A-Z``` can be __encoded__ into numbers using the following mapping:
```
'A' -> "1"
'B' -> "2"
...
'Z' -> "26"
```

To __decode__ an encoded message, all the digits must be grouped then mapped back into letters using the reverse of the mapping above (there may be multiple ways). For example, ```"11106"``` can be mapped into:

- ```"AAJF"``` with the grouping ```(1 1 10 6)```
- ```"KJF"``` with the grouping ```(11 10 6)```

Note that the grouping ```(1 11 06)``` is invalid because ```"06"``` cannot be mapped into ```'F'``` since ```"6"``` is different from ```"06"```.

Given a string ```s``` containing only digits, return _the __number of ways__ to decode it_.

The test cases are generated so that the answer fits in a __32-bit__ integer.

![image](https://user-images.githubusercontent.com/35042430/220204128-0d2c0ec9-a11a-4167-a24a-1a893bcc7b01.png)

---

__Example 1:__
```
Input: s = "12"
Output: 2
Explanation: "12" could be decoded as "AB" (1 2) or "L" (12).
```

__Example 2:__
```
Input: s = "226"
Output: 3
Explanation: "226" could be decoded as "BZ" (2 26), "VF" (22 6), or "BBF" (2 2 6).
```

__Example 3:__
```
Input: s = "06"
Output: 0
Explanation: "06" cannot be mapped to "F" because of the leading zero ("6" is different from "06").
```

__Constraints:__

- ```1 <= s.length <= 100```
- ```s``` contains only digits and may contain leading zero(s).

---

![image](https://leetcode.com/problems/decode-ways/solutions/525903/Figures/91/91_Decode_Ways_1.png)

### The Framework

#### Top-Down Dynamic Programming (Recursion)

The problem deals with finding number of ways of decoding a string. What helps to crack the problem is to think why there would be many ways to decode a string. The reason is simple since at any given point we either decode using ```two digits``` or ```single``` digit. This choice while decoding can lead to different combinations.

![image](https://leetcode.com/problems/decode-ways/solutions/525903/Figures/91/91_Decode_Ways_2.png)
![image](https://leetcode.com/problems/decode-ways/solutions/525903/Figures/91/91_Decode_Ways_3.png)
![image](https://leetcode.com/problems/decode-ways/solutions/525903/Figures/91/91_Decode_Ways_4.png)

```Python
class Solution:
    def numDecodings(self, s: str) -> int:
        # Time Limit Exceeded
        n = len(s)

        memo = collections.defaultdict(int)
        # Base case return 1 as this is counting dynamic programming, return 0 would reflect 0 itself instead of counting
        memo[n], memo[n - 1] = 1, 1
        # Check standalone '0' is invalid for single digit scan and leading '0' is invalid for double digit scan
        for i in range(len(s)):
            if s[i] == '0':
                # Could not count into the final answer
                memo[i] = 0

        def dfs(curr):
            # Base cases
            if curr in memo:
                return memo.get(curr)
            
            # Recurrence relation

            # Scan every digit individually
            ans = dfs(curr + 1)

            # Check if the next two digits are within 26
            if int(s[curr:curr + 2]) <= 26:
                # Add to the final answer
                ans += dfs(curr + 2)

            return ans

        return dfs(0)
```

```Python
class Solution:
    def numDecodings(self, s: str) -> int:    
        @lru_cache(None)
        def dfs(curr):
            # Base cases
            # Base case return 1 as this is counting dynamic programming, return 0 would reflect 0 itself instead of counting
            if curr == len(s):
                return 1
            # Check every 2 digits at once, so standalone '0' is invalid for single digit scan or leading '0' is invalid for double digit scan
            if s[curr] == '0':
                return 0
            # If there is only 1 digit left, can only scan single digit, number of way is 1
            if curr == len(s) - 1:
                return 1
            
            # Increment index by 1 for single digit character
            ans = dfs(curr + 1)

            # Check if the next two digits are within 26
            if int(s[curr:curr + 2]) <= 26:
                ans += dfs(curr + 2)
            
            return ans
            
        return dfs(0)
```

#### Bottom-Up Dynamic Programming (Tabulation)

```Python
class Solution:
    def numDecodings(self, s: str) -> int:
        if not s or s[0] == '0':
            return 0

        n = len(s)
        dp = [0] * (n + 1)
        # Only add to the final answer if every digit is decoded accurately until the end of the string
        dp[0] = dp[1] = 1

        for i in range(2, len(dp)):
            if s[i - 1] != '0':
                dp[i] = dp[i - 1]

            if 10 <= int(s[i - 2 : i]) <= 26:
                dp[i] += dp[i - 2]
        return dp[n]
```

#### Constant Space Bottom-Up Dynamic Programming

```Python
class Solution:
    def numDecodings(self, s: str) -> int:
        # Base case: check if there is a leading zero in the beginning of input array
        if not s or s[0] == '0':
            return 0
        
        n = len(s)
        two_back, one_back = 1, 1

        for i in range(1, n):
            current = 0
            if s[i] != '0':
                current = one_back
            if 10 <= int(s[i-1:i+1]) <= 26:
                current += two_back

            two_back = one_back
            one_back = current

        return one_back 
```
