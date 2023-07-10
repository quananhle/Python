## [2272. Substring With Largest Variance](https://leetcode.com/problems/substring-with-largest-variance/)

```Tag```: ```Dynamic Programming``` ```Kadane's Algorithm```

#### Difficulty: Hard

The variance of a string is defined as the largest difference between the number of occurrences of any ```2``` characters present in the string. Note the two characters may or may not be the same.

Given a string ```s``` consisting of lowercase English letters only, return _the largest variance possible among all substrings of ```s```_.

__A substring is a contiguous sequence of characters within a string__.

![image](https://github.com/quananhle/Python/assets/35042430/0f25768b-5916-437d-9299-f89ae69175e6)

---

__Example 1:__
```
Input: s = "aababbb"
Output: 3
Explanation:
All possible variances along with their respective substrings are listed below:
- Variance 0 for substrings "a", "aa", "ab", "abab", "aababb", "ba", "b", "bb", and "bbb".
- Variance 1 for substrings "aab", "aba", "abb", "aabab", "ababb", "aababbb", and "bab".
- Variance 2 for substrings "aaba", "ababbb", "abbb", and "babb".
- Variance 3 for substring "babbb".
Since the largest possible variance is 3, we return it.
```

__Example 2:__
```
Input: s = "abcde"
Output: 0
Explanation:
No letter occurs more than once in s, so the variance of every substring is 0.
```

__Constraints:__

- $1 <= s.length <= 10^{4}$
- ```s``` consists of lowercase English letters.

---

### Kadane's Algorithm

![image](https://leetcode.com/problems/substring-with-largest-variance/Figures/2272/1.png)

![image](https://leetcode.com/problems/substring-with-largest-variance/Figures/2272/exp.png)

![image](https://leetcode.com/problems/substring-with-largest-variance/Figures/2272/3.png)

__Algorithm:__

1. Initialize a hash map ```memo``` to record the count of each distinct character in ```s```. (Since we already know in advance that ```s``` contains only ```26``` different letters, we can use an array of length ```26``` as the counter)
2. For each pair of distinct letters ```major``` and ```minor```, we apply Kadane's algorithm with modifications. All different pairs of distinct letters are considered, and two pairs of the same letters in different orders are considered to be different. In short, we will consider both ```(a, b)``` and ```(b, a)```.
3. Set ```global_max```, ```major_count``` and ```minor_count``` to ```0```, and let ```total_minor``` be the number of character ```minor``` in the string.
4. Traverse the string ```s```, and for each letter ```c```:
  - If ```c``` is ```major```, increment ```major_count``` by ```1```.
  - If ```c``` is ```minor```, increment ```minor_count``` by ```1``` and decrement ```total_minor``` by ```1```.
5. Update ```global_max``` only when ```minor_count > 0``` (The first modification).
6. If ```major_count - minor_count < 0```, reset them to ```0``` only when ```total_minor > 0``` (The second modification).
7. Move on to the next pair of letters ```(major, minor)``` and repeat from step 3.
8. Return ```global_max``` when the iteration is complete.

- Time Complexity : $\mathcal{O}(N \cdot k^{2})$. Kadane's algorithm requires $\mathcal{O}(N)$ time to traverse ```s```. For each pair of alphabets ```(major, minor)```, we need to traverse ```s``` once. In the worst-case scenario, ```s``` contains $k = 26$ different letters, so there are $k\cdot (k - 1)$ possible pairs of letters.
- Space Complexity : $\mathcal{O}(1)$

```Python
class Solution:
    def largestVariance(self, s: str) -> int:
        memo = [0] * 26
        for c in s:
            memo[ord(c) - ord('a')] += 1
        
        ans = 0

        for i in range(26):
            for j in range(26):
                if i == j or memo[i] == 0 or memo[j] == 0:
                    continue
                major = chr(ord('a') + i)
                minor = chr(ord('a') + j)
                major_cnt = minor_cnt = 0
                total_minor = memo[j]

                for c in s:
                    if c == major:
                        major_cnt += 1
                    if c == minor:
                        minor_cnt += 1
                        total_minor -= 1
                    
                    if minor_cnt > 0:
                        ans = max(ans, major_cnt - minor_cnt)

                    if major_cnt < minor_cnt and total_minor > 0:
                        major_cnt = minor_cnt = 0

        return ans
```

