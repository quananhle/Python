## Longest Substring

### [3. Longest Substring Without Repeating Characters](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Study%20Plan/Algorithm/Algorithm%20I/Day%2006%20-%20Sliding%20Window/3.%20Longest%20Substring%20Without%20Repeating%20Characters)

Given a string ```s```, return _the length of the longest substring without repeating characters_.

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

### [159. Longest Substring with At Most Two Distinct Characters](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Leetcode/Bloomberg/159.%20Longest%20Substring%20with%20At%20Most%20Two%20Distinct%20Characters)

Given a string ```s```, return _the length of the longest substring that contains at most two distinct characters_.

```Python
class Solution:
    def lengthOfLongestSubstringTwoDistinct(self, s: str) -> int:
        n = len(s)
        memo = collections.defaultdict(int)
        start = 0
        ans = 0

        if n < 3:
            return n
        
        for end in range(n):
            right = s[end]
            memo[right] = 1 + memo.get(right, 0)

            while len(memo) > 2:
                left = s[start]
                memo[left] -= 1

                if memo[left] == 0:
                    del memo[left]

                start += 1
            
            ans = max(ans, end - start + 1)
        
        return ans
```

---

### [340. Longest Substring with At Most K Distinct Characters](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Concepts/Array%20and%20String/Sliding%20Window/340.%20Longest%20Substring%20with%20At%20Most%20K%20Distinct%20Characters)

Given a string ```s``` and an integer ```k```, return _the length of the longest substring of ```s``` that contains at most ```k``` distinct characters_.

```Python

```


