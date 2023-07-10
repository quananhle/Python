## [340. Longest Substring with At Most K Distinct Characters](https://leetcode.com/problems/longest-substring-with-at-most-k-distinct-characters/)

```Tag```: ```Sliding Window``` ```Binary Search```

#### Difficulty: Medium

Given a string ```s``` and an integer ```k```, return _the length of the longest substring of ```s``` that contains at most ```k``` distinct characters_.

![image](https://github.com/quananhle/Python/assets/35042430/bd30afd0-3af4-4690-8831-d430fa301b01)

---

__Example 1:__
```
Input: s = "eceba", k = 2
Output: 3
Explanation: The substring is "ece" with length 3.
```

__Example 2:__
```
Input: s = "aa", k = 1
Output: 2
Explanation: The substring is "aa" with length 2.
```

__Constraints:__

- $1 <= s.length <= 5 * 10^{4}$
- $0 <= k <= 50$

---

### Sliding Window

#### Longest Substring Template

```Python
class Solution:
    def lengthOfLongestSubstringKDistinct(self, s: str, k: int) -> int:
        n = len(s)
        memo = collections.defaultdict(int)
        start = 0
        ans = 0

        if n < k:
            return n
        
        for end in range(n):
            right = s[end]
            memo[right] = 1 + memo.get(right, 0)

            while len(memo) > k:
                left = s[start]
                memo[left] -= 1

                if memo[left] == 0:
                    del memo[left]

                start += 1
            
            ans = max(ans, end - start + 1)
        
        return ans
```
