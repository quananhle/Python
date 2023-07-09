## Substring

### 3. Longest Substring Without Repeating Characters

Given a string ```s```, find the length of the longest substring without repeating characters.

__Example:__
```
Input: s = "abcabcbb"
Output: 3
Explanation: The answer is "abc", with the length of 3.
```

```Python
class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        n = len(s)
        memo = collections.defaultdict(int)
        start = 0
        ans = 0

        if n == 1:
            return n

        for end in range(n):
            right = s[end]
            memo[right] = 1 + memo.get(right, 0)

            while memo[right] > 1:
                left = s[start]
                memo[left] -= 1
                
                if memo[left] == 0:
                    del memo[left]

                start += 1
            
            ans = max(ans, end - start + 1)
        
        return ans
```

---

### 159. Longest Substring with At Most Two Distinct Characters

---

### 340. Longest Substring with At Most K Distinct Characters

---

