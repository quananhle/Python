## [76. Minimum Window Substring](https://leetcode.com/problems/minimum-window-substring/)

```Tag```: ```Two Pointers``` ```Sliding Window```

#### Difficulty: Hard

Given two strings ```s``` and ```t``` of lengths ```m``` and ```n``` respectively, return _the minimum window substring of ```s``` such that every character in ```t``` (including duplicates) is included in the window_. If there is no such substring, return _the empty string ```""```_.

The testcases will be generated such that the answer is unique.

![image](https://github.com/quananhle/Python/assets/35042430/5f3ef991-ec19-40ea-aaee-fd380e4482ba)

---

__Example 1:__
```
Input: s = "ADOBECODEBANC", t = "ABC"
Output: "BANC"
Explanation: The minimum window substring "BANC" includes 'A', 'B', and 'C' from string t.
```

__Example 2:__
```
Input: s = "a", t = "a"
Output: "a"
Explanation: The entire string s is the minimum window.
```

__Example 3:__
```
Input: s = "a", t = "aa"
Output: ""
Explanation: Both 'a's from t must be included in the window.
Since the largest window of s only has one 'a', return empty string.
```

__Constraints:__

- $m == s.length$
- $n == t.length$
- $1 \le m, n \le 10^5$
- ```s``` and ```t``` consist of uppercase and lowercase English letters.
 
---

![image](https://leetcode.com/problems/minimum-window-substring/Figures/76/76_Minimum_Window_Substring_1.png)

### Sliding Window

__Algorithm__

1. We start with two pointers, ```left``` and ```right``` initially pointing to the first element of the string ```S```.

2. We use the ```right``` pointer to expand the window until we get a desirable window i.e. a window that contains all of the characters of ```T```.

3. Once we have a window with all the characters, we can move the ```left``` pointer ahead one by one. If the window is still a desirable one we keep on updating the minimum window size.

4. If the window is not desirable any more, we repeat step 2 onwards.

![image](https://leetcode.com/problems/minimum-window-substring/Figures/76/76_Minimum_Window_Substring_2.png)

The above steps are repeated until we have looked at all the windows. The smallest window is returned.

![image](https://leetcode.com/problems/minimum-window-substring/Figures/76/76_Minimum_Window_Substring_3.png)

```Python
class Solution:
    def minWindow(self, s: str, t: str) -> str:
        if not t or not s:
            return ""

        n, m = len(s), len(t)
        # Frequency of all unique characters in t
        memo = collections.Counter(t)
        # Number of unique characters in t
        unique = len(memo)
        # Keep track of how many unique character in t are already presented in the current window
        remaining = unique
        start, end = 0, 0

        counter = dict()

        # ans tuple to keep count of (window length, left pointer, right pointer)
        ans = math.inf, None, None

        while end < n:
            # Count the frequency of letter as window expands to the right
            letter = s[end]
            counter[letter] = 1 + counter.get(letter, 0)

            if letter in memo and counter[letter] == memo[letter]:
                remaining -= 1
            
            while start <= end and remaining == 0:
                letter = s[start]
                # Save the smallest window until now
                if end - start + 1 < ans[0]:
                    ans = (end - start + 1, start, end)
                
                # Update the start pointer counter
                counter[letter] -= 1
                if letter in memo and counter[letter] < memo[letter]:
                    remaining += 1

                start += 1
            end += 1

        return "" if ans[0] == float("inf") else s[ans[1] : ans[2] + 1]
```

```Python
class Solution:
    def minWindow(self, s: str, t: str) -> str:
        # Idea: Two pointers: moving end forward to find a valid window,
        #                     moving start forward to find a smaller window
        #                     counter and hash_map to determine if the window is valid or not
        n, counter = len(s), len(t)
        begin, end, head = 0, 0, 0 
        
        # set minimum length to len(string) + 1. It cannot be greater than that
        min_len = n + 1        
        
        # hashmap to hold character count in T
        memo = collections.Counter(t)
            
        # Iterate throught the loop till we reach end of string S   
        while end < n:
            letter = s[end]
            if letter in memo and memo[letter] > 0:
                counter -= 1
            memo[letter] -= 1
                
            end += 1            

            # While counter is zero (it means we have all characters between begin and end), calculate the length and min_length
            while counter == 0:
                if end - begin < min_len:
                    min_len = end - begin
                    head = begin

                start = s[begin]
                if start in memo:
                    memo[start] += 1
                    if memo[start] > 0: 
                        counter += 1                
                begin += 1
        
        # Calculate the min string
        if min_len == n+1:
            return ""
        return s[head: head+min_len]
```
