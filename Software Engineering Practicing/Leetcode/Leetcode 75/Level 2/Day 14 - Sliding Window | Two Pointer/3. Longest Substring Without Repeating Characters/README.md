## [3. Longest Substring Without Repeating Characters](https://leetcode.com/problems/longest-substring-without-repeating-characters/)

```Tag```: ```Two Pointers``` ```Sliding Window``` ```Hash Map``` ```Hash Set```

#### Difficulty: Medium

Given a string ```s```, find the length of the longest substring without repeating characters.

![image](https://user-images.githubusercontent.com/35042430/225391142-77b1b81a-a802-4438-aa5e-7ab4694051ca.png)

---

__Example 1:__
```
Input: s = "abcabcbb"
Output: 3
Explanation: The answer is "abc", with the length of 3.
```

__Example 2:__
```
Input: s = "bbbbb"
Output: 1
Explanation: The answer is "b", with the length of 1.
```

__Example 3:__
```
Input: s = "pwwkew"
Output: 3
Explanation: The answer is "wke", with the length of 3.
Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
```

__Constraints:__

- ```0 <= s.length <= 5 * 10^4```
- ```s``` consists of English letters, digits, symbols and spaces.

---

### Brute Force

- __Time complexity__: ```O(N^3)```
- __Space complexity__: ```O(min(M, N))```

```Python
class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        ### Time Limit Exceeded
        def check(start, end):
            chars = set()
            while start < end + 1:
                c = s[start]
                if c in chars:
                    return False
                chars.add(c)
                start += 1
            return True
        
        ans = 0
        for i in range(len(s)):
            for j in range(i, len(s)):
                if check(i, j):
                    ans = max(ans, j - i + 1)
        
        return ans
```

### Sliding Window + Two Pointers

#### Hash Set

- __Time complexity__: ```O(2N)``` == ```O(N)```
- __Space complexity__: ```O(min(M, N))```

```Python
class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        seen = set()
        start = end = 0
        ans = 0

        while end < len(s):
            left, right = s[start], s[end]

            if not right in seen:
                seen.add(right)
                end += 1
            else:
                seen = set()
                ans = max(ans, end - start)
                start += 1
                end = start

        # Ensure to get the longest substring include the last character in s
        ans = max(ans, end - start)
        return ans
```

#### Hash Map (Counter)

```Python
class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        chars = collections.Counter()
        start = end = 0
        ans = 0

        while end < len(s):
            right = s[end]
            chars[right] += 1

            while chars[right] > 1:
                left = s[start]
                chars[left] -= 1
                start += 1

            ans = max(ans, end - start + 1)
            end += 1

        return ans
```

#### Optimized Sliding Window

The reason is that if ```s[j]``` have a duplicate in the range ```[i, j]``` with index ```j'```, we don't need to increase ```i``` little by little. We can skip all the elements in the range ```[i, j′]```, and let ```i``` to be ```j′ + 1``` directly.

```Python
class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        n = len(s)
        start = end = 0
        ans = 0

        memo = dict()

        while end < len(s):
            if s[end] in memo:
                start = max(start, memo[s[end]])

            ans = max(ans, end - start + 1)
            memo[s[end]] = end + 1
            end += 1

        return ans    
```

```Python
class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        memo = dict()
        start = ans = 0

        for end, char in enumerate(s):
            if char in memo and memo[char] >= start:        # Ensure memo[char] >= start for edge case "abba"
                start = memo[char] + 1
            
            if ans < end - start + 1:
                ans = end - start + 1

            memo[char] = end

        return ans
```

### ASCII

Commonly used tables are:

- ```int[26]``` for Letters ```'a'``` - ```'z'``` or ```'A'``` - ```'Z'```
- ```int[128]``` for ASCII
- ```int[256]``` for Extended ASCII

```Python
class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        chars = [None] * 128
        start = end = 0
        ans = 0

        while end < len(s):
            right = s[end]

            index = chars[ord(right)]
            if index != None and start <= index < end:
                start = index + 1
            ans = max(ans, end - start + 1)

            chars[ord(right)] = end
            end += 1
        
        return ans
```
