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

![image](https://leetcode.com/problems/longest-substring-with-at-most-k-distinct-characters/Figures/340/3.png)

__Algorithm__

1. Use a hash map ```memo``` to dynamically record the number of each character in the current window while scanning.
2. Set ```start = 0``` and ```ans = 0```, iterate ```end``` from ```0``` to ```n - 1```, at each step ```end```, increment ```s[end]``` by ```1```:
    - Increment ```memo[s[end]]``` by ```1```.
    - While ```len(memo) > k```:
        - Decrement ```memo[s[start]]``` by ```1```.
        - Delete ```s[start]``` from ```memo``` if ```memo[s[start] = 0```.
        - Increment ```start``` by ```1```.
    - Now the window is valid, update the maximum size of valid window as ```ans = max(ans, right - left + 1)```.
3. Return ```ans``` when the iteration ends.

- Time Complexity : $\mathcal{O}(N)$ where ```N``` is a number of characters in the input string.
- Space Complexity : $\mathcal{O}(k)$ since additional space is used only for a hashmap with at most ```k + 1``` elements.

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

### Advanced Sliding Window

![image](https://leetcode.com/problems/longest-substring-with-at-most-k-distinct-characters/Figures/340/s3.png)

![image](https://leetcode.com/problems/longest-substring-with-at-most-k-distinct-characters/Figures/340/s4.png)

- Time Complexity : $\mathcal{O}(N)$ where ```N``` is a number of characters in the input string.
- Space Complexity : $\mathcal{O}(N)$ since during the iteration, there might be at most ```O(n)``` unique characters in the window, which takes ```O(n)``` space.

```Python
class Solution:
    def lengthOfLongestSubstringKDistinct(self, s: str, k: int) -> int:
        n = len(s)
        counter = collections.Counter()
        ans = 0

        for end in range(n):
            right = s[end]
            counter[right] += 1

            if len(counter) <= k:
                ans += 1
            else:
                left = s[end - ans]
                counter[left] -= 1
                if counter[left] == 0:
                    del counter[left]
            
        return ans
```

---

### Binary Search & Fixed Size Sliding Window

![image](https://leetcode.com/problems/longest-substring-with-at-most-k-distinct-characters/Figures/340/1.png)

![image](https://leetcode.com/problems/longest-substring-with-at-most-k-distinct-characters/Figures/340/2.png)

- Time Complexity : $\mathcal{O}(N * logN)$
- Space Complexity : $\mathcal{O}(N)$

```Python
class Solution:
    def lengthOfLongestSubstringKDistinct(self, s: str, k: int) -> int:
        n = len(s)
        lo, hi = k, n

        if n <= k:
            return n

        def is_valid(size):
            counter = collections.Counter(s[:size])
            if len(counter) <= k:
                return True
            for end in range(size, n):
                left, right = s[end - size], s[end]
                
                counter[right] += 1
                counter[left] -= 1
                if counter[left] == 0:
                    del counter[left]
                if len(counter) <= k:
                    return True
                
            return False
        
        while lo < hi:
            mi = hi - (hi - lo) // 2

            if is_valid(mi):
                lo = mi
            else:
                hi = mi - 1
            
        return lo
```

