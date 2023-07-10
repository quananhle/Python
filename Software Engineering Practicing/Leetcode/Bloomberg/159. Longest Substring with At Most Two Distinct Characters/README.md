## [159. Longest Substring with At Most Two Distinct Characters](https://leetcode.com/problems/longest-substring-with-at-most-two-distinct-characters/)

```Tag```: ```Sliding Window``` ```Hash Map```

#### Difficulty: Medium

Given a string ```s```, return _the length of the longest substring that contains at most two distinct characters_.

![image](https://github.com/quananhle/Python/assets/35042430/6e9c77b8-60a5-44fa-abee-3aa1e549fcd3)

---

__Example 1:__
```
Input: s = "eceba"
Output: 3
Explanation: The substring is "ece" which its length is 3.
```

__Example 2:__
```
Input: s = "ccaabbb"
Output: 5
Explanation: The substring is "aabbb" which its length is 5.
```

__Constraints:__

- $1 <= s.length <= 10^{5}$
- ```s``` consists of English letters.

---

### Sliding Window

```Python
class Solution:
    def lengthOfLongestSubstringTwoDistinct(self, s: str) -> int:
        n = len(s)
        start = 0
        memo = collections.defaultdict(int)
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

![image](https://leetcode.com/problems/longest-substring-with-at-most-two-distinct-characters/Figures/159/sliding.png)

- Time Complexity : $\mathcal{O}(N)$ where ```N``` is a number of characters in the input string.
- Space Complexity : $\mathcal{O}(1)$ since additional space is used only for a hashmap with at most ```3``` elements.

```Python
class Solution:
    def lengthOfLongestSubstringTwoDistinct(self, s: str) -> int:
        n = len(s)
        memo = collections.defaultdict(int)
        start = end = 0
        ans = 2

        if n < 3:
            return n
        
        while end < n:
            right = s[end]
            memo[right] = end
            end += 1

            if len(memo) > 2:
                to_del = min(memo.values())
                del memo[s[to_del]]
                start = to_del + 1
            
            ans = max(ans, end - start)
        
        return ans
```
