## [159. Longest Substring with At Most Two Distinct Characters](https://leetcode.com/problems/longest-substring-with-at-most-two-distinct-characters/)

```Tag```: ```Sliding Window``` ```Hash Map``` ```Two Pointers```

#### Difficulty: Medium

Given a string ```s```, return _the length of the longest substring that contains at most two distinct characters_.

![image](https://github.com/quananhle/Python/assets/35042430/75f89194-a48b-4590-91d7-4a6c426ca6ac)

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

![image](https://leetcode.com/problems/longest-substring-with-at-most-two-distinct-characters/Figures/159/sliding.png)

![image](https://leetcode.com/problems/longest-substring-with-at-most-two-distinct-characters/Figures/159/move_left.png)

#### Longest Substring Template

- Time Complexity : $\mathcal{O}(N)$ where ```N``` is a number of characters in the input string.
- Space Complexity : $\mathcal{O}(1)$ since additional space is used only for a hashmap with at most ```3``` elements.

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

---

__Algorithm__

1. Return ```N``` if the string length ```N``` is smaller than ```3```.
2. Set both set pointers in the beginning of the string ```start = 0``` and ```end = 0``` and init max substring length ```ans = 2```.
3. While ```end``` pointer is less than ```N```:
    - If hashmap ```memo``` contains less than 3 distinct characters,
        - add the current character ```s[end]``` in the hashmap
        - and move ```end``` pointer to the right.
    - If hashmap ```memo``` contains 3 distinct characters,
        - remove the leftmost character from the hashmap
        - and move the ```start``` pointer so that sliding window contains again 2 distinct characters only.
4. Update ```ans```.
5. Return ```ans```.

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

---

### Sliding Window II

```Python
class Solution:
    def lengthOfLongestSubstringTwoDistinct(self, s: str) -> int:
        n = len(s)
        counter = collections.Counter()
        ans = 0

        for end in range(n):
            right = s[end]
            counter[right] += 1

            if len(counter) <= 2:
                ans += 1
            else:
                left = s[end - ans]
                counter[left] -= 1
                if counter[left] == 0:
                    del counter[left]
            
        return ans
```
