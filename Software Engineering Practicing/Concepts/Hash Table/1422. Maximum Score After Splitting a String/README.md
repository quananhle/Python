## [1422. Maximum Score After Splitting a String](https://leetcode.com/problems/maximum-score-after-splitting-a-string)

```Tag```: ```Array & String``` ```Hash Map```

#### Difficulty: Easy

Given a string ```s``` of zeros and ones, return _the maximum score after splitting the string into two __non-empty__ substrings_ (i.e. __left substring__ and __right substring__).

The score after splitting a string is the number of zeros in the left substring plus the number of ones in the right substring.

---

__Example 1:__
```
Input: s = "011101"
Output: 5 
Explanation: 
All possible ways of splitting s into two non-empty substrings are:
left = "0" and right = "11101", score = 1 + 4 = 5 
left = "01" and right = "1101", score = 1 + 3 = 4 
left = "011" and right = "101", score = 1 + 2 = 3 
left = "0111" and right = "01", score = 1 + 1 = 2 
left = "01110" and right = "1", score = 2 + 1 = 3
```

__Example 2:__
```
Input: s = "00111"
Output: 5
Explanation: When left = "00" and right = "111", we get the maximum score = 2 + 3 = 5
```

__Example 3:__
```
Input: s = "1111"
Output: 3
```

__Constraints:__

- $2 \le s.length \le 500$
- The string ```s``` consists of characters ```'0'``` and ```'1'``` only.

---

__Observation:__ Note that we cannot iterate until the final index, but rather the second last index. If we were to iterate to the final index, the right part would be empty, which is not allowed by the problem.

### Brute Force

```Python

```

### Hash Map

```Python
class Solution:
    def maxScore(self, s: str) -> int:
        counter = collections.defaultdict(int)
        for c in s:
            counter[c] += 1
        
        ans = zeros = ones = 0
        n = len(s)
        for i in range(n):
            if s[i] == '0':
                # Edge case: right substring is empty
                if i == n - 1:
                    continue
                zeros += 1
            else:
                ones += 1

            ans = max(ans, zeros + counter['1'] - ones)
        
        return ans
```

