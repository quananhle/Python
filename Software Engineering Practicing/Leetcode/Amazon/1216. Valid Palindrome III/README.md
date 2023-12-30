## [1216. Valid Palindrome III](https://leetcode.com/problems/valid-palindrome-iii)

```Tag```: ```Dynamic Programming```

#### Difficulty: Hard

Given a string ```s``` and an integer ```k```, return ```true``` if ```s``` is a ```k```-__palindrome__.

A string is ```k```-__palindrome__ if it can be transformed into a palindrome by removing at most ```k``` characters from it.

![image](https://github.com/quananhle/Python/assets/35042430/eae2993f-b2e9-4418-b4ed-6dabb258da0e)

---

__Example 1:__
```
Input: s = "abcdeca", k = 2
Output: true
Explanation: Remove 'b' and 'e' characters.
```

__Example 2:__
```
Input: s = "abbababa", k = 1
Output: true
```

__Constraints:__

- $1 \le s.length \le 1000$
- ```s``` consists of only lowercase English letters.
- $1 \le k \le s.length$


---

### Dynamic Programming Framework

#### Top-Down Dynamic Programming 

```Python
class Solution:
    def isValidPalindrome(self, s: str, k: int) -> bool:
        n = len(s)

        @functools.lru_cache(maxsize=None)
        def dp(left, right):
            # Base cases
            # One letter remaining
            if left == right:
                return 0
            # Two letters remaining
            if left == right - 1:
                return 1 if s[left] != s[right] else 0
            
            # DP Transitions: matching characters or unmatching characters
            if s[left] == s[right]:
                return dp(left + 1, right - 1)
            
            return 1 + min(dp(left + 1, right), dp(left, right - 1))
        
        return dp(0, n - 1) <= k
```

#### Bottom-Up Dynamic Programming (2D)

![image](https://user-images.githubusercontent.com/35042430/204914626-85e211dd-57c1-47b7-a0d1-7c1bfd2665eb.png)

```Python
class Solution(object):
    def isValidPalindrome(self, s, k):
        """
        :type s: str
        :type k: int
        :rtype: bool
        """
        # Top-Down Dynamic Programming 
        #### Time Complexity: O(N^2)
        #### Space Complexity: O(N^2)
        res = [[None] * len(s) for _ in range(len(s))]
        def dp(s, left, right):
            # Base case, only 1 letter remaining
            if left == right:
                return 0
            # Base case, only 2 letters remaining
            if left == right - 1:
                return 1 if s[left] != s[right] else 0
            # Return precomputed value if exists     
            if res[left][right]:
                return res[left][right]
            # Check if character at left index matches character at right index
            if s[left] == s[right]:
                res[left][right] = dp(s, left+1, right-1)
                return res[left][right]
            else:
                # Check if character at left index does not match character at right index
                # Either delete character at left index or right index
                res[left][right] = 1 + min(dp(s, left+1, right), dp(s, left, right-1))
                return res[left][right]

        return dp(s, 0, len(s)-1) <= k
        '''
        "abcdeca"
         |||||||                                                                                                                                                                            | True
         0123456                                                                                                                                                                            |
        s[0] == s[6]: res[0][6] = dp(s, 1, 5)                                                                                                                                               | 2
                                    |                                                                                                                                                       |
                    b != c: res[1][5] = 1 + min( dp(s, 2, 5), dp(s, 1, 4) )                                                                                                                 | 2  
                                                  |            |                                                                                                                            |
                        c == c: res[2][5] = dp(s, 3, 4)     b != e: res[1][4] = 1 + min(dp(s, 2, 4),                                 dp(s, 1, 3))                                           | 1  3
                                             |                                           |                                            |                                                     |
                                    s[3] != s[4]        s[2] != s[4]: res[2][4] = 1 + min( dp(s, 3, 4), dp(s, 2, 3) )      s[1] != s[3]: res[1][3] =  1 + min( dp(s, 2, 3), dp(s, 1, 2) )   | 1  2 2
                                    return 1                                                |           |                                                       |            |              |
                                                                                        s[3] != s[4]    s[2] != s[3]                                        s[2] != s[3]    s[1] != s[2]    |    1 1
                                                                                        return 1        return 1                                            return 1        return 1        |

        "abbababa"
         ||||||||                                                                                                                                                                           | True
         01234567                                                                                                                                                                           |
        s[0] == s[7]: res[0][7] = dp(s, 1, 6)                                                                                                                                               | 1
                                    |                                                                                                                                                       |
                    s[1] == s[6]: res[1][6] = dp(s, 2, 5)                                                                                                                                   | 1  
                                                  |            |                                                                                                                            |
                  s[2] != s[5]: res[2][5] = 1 + min(dp(s, 3, 5), dp(s, 2, 4))                                                                                                               | 1
                                                    |             |                                                                                                                         |
                        s[3] == s[5]: res[3][5] = dp(s, 4, 4)    s[2] == s[4]: res[2][4] = dp(s, 3, 3)                                                                                      | 0  0
                                                   |                                        |                                                                                               |
                                            4 == 4                                          3 == 3                                                                                          | 0
                                            return 0                                        return 0                                                                                        |
        ''' 
```
![image](https://user-images.githubusercontent.com/35042430/204914985-680e1dcb-7810-4b66-9c76-c8166f79124e.png)

---

### Breadth-First Search + Two-Pointer Technique (Longest Palindromic Subsequence Template)

```Python
class Solution:
    def isValidPalindrome(self, s: str, k: int) -> bool:
        n = len(s)

        queue = collections.deque([(0, n - 1, k)])
        visited = set()

        while queue:
            left, right, remaining = queue.popleft()
            if remaining < 0:
                return False
            
            while s[left] == s[right]:
                left += 1
                right -= 1
                if left >= right:
                    return True
            
            if not (left + 1, right) in visited:
                queue.append((left + 1, right, remaining - 1))
                visited.add((left + 1, right))
            
            if not (left, right - 1) in visited:
                queue.append((left, right - 1, remaining - 1))
                visited.add((left, right - 1))
```
